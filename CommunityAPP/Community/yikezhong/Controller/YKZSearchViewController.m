//
//  YKZSearchViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "YKZSearchViewController.h"
#import <WebKit/WebKit.h>
@interface YKZSearchViewController ()<WKUIDelegate,WKNavigationDelegate>

@property(nonatomic, strong) WKWebView * webView;
@end

@implementation YKZSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    // 配置configuration
    WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc]init];
    //注册方法
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) configuration:configuration];     _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    _webView.scrollView.bounces = NO;
    [self.view addSubview:self.webView];
    
    // 加载
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://quarter.sinoyjlm.com/search"]];
    [self.webView loadRequest:request];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    HHLog(@"准备加载url...");
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    HHLog(@"准备加载内容....");
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    HHLog(@"页面加载完成...");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    HHLog(@"页面加载失败...");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
