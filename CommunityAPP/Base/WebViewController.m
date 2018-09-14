//
//  WebViewController.m
//  GeniusWatch
//
//  Created by clei on 15/9/16.
//  Copyright (c) 2015年 chenlei. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, strong)UIActivityIndicatorView *indicatorView;

@end

@implementation WebViewController

#pragma mark - View's Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = self.headTitle;
    // 开启日志，方便调试
//    [WKWebViewJavascriptBridge enableLogging];
    
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    
    wkWebConfig.userContentController = wkUController;
    
    //自适应屏幕的宽度js
    
    NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    //添加js调用
    
    [wkUController addUserScript:wkUserScript];
    
    self.webView = [[WKWebView alloc] initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH, self.view.height) configuration:wkWebConfig];
    self.webView.navigationDelegate=self;
    [self.view addSubview:_webView];

    
    [self.view addSubview:self.indicatorView];
    self.indicatorView.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    
//    // 给webview建立JS与OjbC的沟通桥梁
//    self.jsBridge = [WKWebViewJavascriptBridge bridgeForWebView:_webView];
//
//    // 设置代理，如果不需要实现，可以不设置
//    [_jsBridge setWebViewDelegate:self];
    
    [self registerJavaScriptHandler];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
//    NSLog(@"url  =  %@",[KOShowShareApplication makeH5UrlWithRightHalfString:_urlString]);
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
    
//    NSString *identity = [USER_DEFAULT objectForKey:@"identity"];
//    if (identity)
//    {
//        NSDictionary *paras = @{@"identity":identity,@"client_identity":[KOShowTool getDeviceIdentity],@"channel_id":[KOShowTool getChannelID]};
//        NSString *jsonString = [CommonTool jsonStringFromDictionary:paras];
//        [self.jsBridge callHandler:@"getWebData" data:jsonString];
//    }
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable title, NSError * _Nullable error) {
        if (self.customTitle) {
            self.title=self.customTitle;
        }else{
            if (title) {
                self.title=title;
            }
            
        }
    }];
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

- (void)goBackAction
{
    // 子类若有需求可以重写
}
- (void)WebBack{
    
    
}
- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView)
    {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}

@end
