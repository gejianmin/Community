//
//  QuarterViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "QuarterViewController.h"

@interface QuarterViewController ()
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@end

@implementation QuarterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView = [[UIWebView alloc] init];
    [self.view addSubview:_webView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(0);
        make.top.bottom.left.right.equalTo(self.view);
    }];
    NSLog(@"self.view  = %@",[NSValue valueWithCGRect:self.view.frame]);

    
    if ([self.webView.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }

    NSURL *url = [NSURL URLWithString:@"http://quarter.sinoyjlm.com"];
    [self.webView setScalesPageToFit:YES];//自动缩放以适应屏幕
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.indicatorView setHidesWhenStopped:YES];
}

- (void)viewDidLayoutSubviews{
    NSLog(@"self.view  = %@",[NSValue valueWithCGRect:self.view.frame]);
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [self preferredStatusBarStyle];
    //    [self setStatusBarBackgroundColor:RGB(254, 104, 157)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
