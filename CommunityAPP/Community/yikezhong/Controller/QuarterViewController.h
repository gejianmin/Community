//
//  QuarterViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>
#import "WKWebViewJavascriptBridge.h"
@interface QuarterViewController : BaseViewController<WKNavigationDelegate>

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSString *customTitle;

@property (nonatomic, strong) WKWebViewJavascriptBridge *jsBridge;
//子类重写 -h5页面回退
- (void)goBackAction;
//子类重写 -h5页面关闭
- (void)WebBack;
@end
