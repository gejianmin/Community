//
//  QuarterViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "QuarterViewController.h"
#import "WebViewController.h"
#import "QRCodeViewController.h"
#import "YKZSearchViewController.h"
@interface QuarterViewController ()<UIGestureRecognizerDelegate,UITextFieldDelegate>

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property(nonatomic, strong) UIView  * navigationBarV;// 自定义的导航条
@end

@implementation QuarterViewController

// 导航条自定义

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:self.navigationBarV];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    [self.navigationBarV removeFromSuperview];
}

- (UIView *)navigationBarV {
    if (!_navigationBarV) {
        _navigationBarV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, GSANavgationBarHeight)];
        _navigationBarV.backgroundColor = [UIColor whiteColor];
        UIImageView *imageV = [[UIImageView alloc]init];
        imageV.userInteractionEnabled = YES;
        imageV.image = [UIImage imageNamed:@"saoyisao"];
        [_navigationBarV addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(_navigationBarV.mas_left).offset(16);
            make.centerY.equalTo(_navigationBarV.mas_centerY);
            make.width.height.equalTo(@30);
        }];
        
        // 给二维码点击按钮添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(QRcodeClick)];
        [imageV addGestureRecognizer:tap];
        
        UIView *grayBackV = [[UIView alloc]init];
        grayBackV.backgroundColor = kColorGray8;
        grayBackV.layer.masksToBounds = YES;
        grayBackV.layer.cornerRadius = 5;
        [_navigationBarV addSubview:grayBackV];
        [grayBackV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageV.mas_right).offset(16);
            make.centerY.equalTo(imageV.mas_centerY);
            make.right.equalTo(_navigationBarV.mas_right).offset(-16);
            make.height.equalTo(imageV.mas_height);
            
        }];
        
        UIImageView *searchImageV = [[UIImageView alloc]init];
        searchImageV.image = [UIImage imageNamed:@"search_black"];
        searchImageV.frame = CGRectMake(8, 5, 20, 20);
        [grayBackV addSubview:searchImageV];
        
        //搜索框
        UITextField *searchTF = [[UITextField alloc]init];
        searchTF.delegate = self;
        searchTF.borderStyle = UITextBorderStyleNone;
        searchTF.placeholder = @"  请输入想要购买的商品或服务";
        [grayBackV addSubview:searchTF];
        [searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(searchImageV.mas_right);
            make.centerY.equalTo(searchImageV.mas_centerY);
            make.right.equalTo(grayBackV.mas_right).offset(-16);
        }];
        [searchTF addTarget:self action:@selector(searchValueChange) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _navigationBarV;
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    YKZSearchViewController *ykzSearch = [[YKZSearchViewController alloc]init];
    [self.navigationController pushViewController:ykzSearch animated:YES];
    return NO;
    
}
// 二维码点击
- (void)QRcodeClick {
    
    QRCodeViewController *qrVC = [[QRCodeViewController alloc]init];
    qrVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:qrVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.headTitle;
    // 开启日志，方便调试
    //[WKWebViewJavascriptBridge enableLogging];
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    wkWebConfig.userContentController = wkUController;
    
    //自适应屏幕的宽度js
    
    NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    //添加js调用
    [wkUController addUserScript:wkUserScript];
    self.webView = [[WKWebView alloc] initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, HH_SCREEN_H-GSA_TabbarHeight-GSANavHeight) configuration:wkWebConfig];
    self.webView.navigationDelegate=self;
    [self.view addSubview:_webView];
    [self.view addSubview:self.indicatorView];
    self.indicatorView.center = CGPointMake(self.view.center.x, self.view.center.y-100);
        // 给webview建立JS与OjbC的沟通桥梁
        self.jsBridge = [WKWebViewJavascriptBridge bridgeForWebView:_webView];
        // 设置代理，如果不需要实现，可以不设置
        [_jsBridge setWebViewDelegate:self];
    [self registerJavaScriptHandler];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:Quarter_HTML5]]];
    
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)registerJavaScriptHandler
{
    // 子类若有需求可以重写
}

// MARK: WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    [self.indicatorView startAnimating];
    NSLog(@"webview didStartNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [self.indicatorView stopAnimating];
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
//        if (self.customTitle) {
//            self.title=self.customTitle;
//        }else{
//            if (title) {
//                self.title=title;
//            }
//
//        }
    }];
    NSString * token = [[[HHComlient sharedInstance]user] token];
    NSString * vid = [[[HHComlient sharedInstance]user] vid];
    NSString * lat = [NSString stringWithFormat:@"%.6f",[[[HHComlient sharedInstance]user] lat]];
    NSString * lng = [NSString stringWithFormat:@"%.6f",[[[HHComlient sharedInstance]user] lng]];
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"localStorage.setItem('token','%@')", token] completionHandler:nil];
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"localStorage.setItem('vid','%@')", vid] completionHandler:nil];
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"localStorage.setItem('lat','%@')", lat] completionHandler:nil];
    [self.webView evaluateJavaScript:[NSString stringWithFormat:@"localStorage.setItem('lng','%@')", lng] completionHandler:nil];
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    [self.indicatorView stopAnimating];
    NSLog(@"webview didFailNavigation");
}

#pragma mark - 返回
- (void)backButtonPressed:(UIButton *)sender
{
    // 第二个判断防止重定向导致页面无法返回问题
    if ([self.webView canGoBack] && [self.webView.backForwardList.backList count]>1)
    {
        [self.webView goBack];
        [self goBackAction];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
        [self WebBack];
    }
}
- (void)goBackAction{// 子类若有需求可以重写
    
}
- (void)WebBack{
    
}
- (UIActivityIndicatorView *)indicatorView{
    
    if (!_indicatorView)
    {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}

- (void)viewDidLayoutSubviews{
    NSLog(@"self.view  = %@",[NSValue valueWithCGRect:self.view.frame]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.indicatorView stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicatorView startAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.indicatorView stopAnimating];
}

@end
