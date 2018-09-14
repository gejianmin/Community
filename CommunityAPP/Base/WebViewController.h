//
//  WebViewController.h
//  GeniusWatch
//
//  Created by clei on 15/9/16.
//  Copyright (c) 2015年 chenlei. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>
#import "WKWebViewJavascriptBridge.h"

@interface WebViewController : BaseViewController<WKNavigationDelegate>

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSString *customTitle;

//@property (nonatomic, strong) WKWebViewJavascriptBridge *jsBridge;
//子类重写 -h5页面回退
- (void)goBackAction;
//子类重写 -h5页面关闭
- (void)WebBack;
@end
