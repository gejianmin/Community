//
//  ArtDetailViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "ArtDetailViewController.h"
#import "InfoArt_DetailRequest.h"
#import "InfoArt_DetailModel.h"

@interface ArtDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ArtDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additionalj setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    __weak typeof(self) tyself = self;
    
    InfoArt_DetailRequest *request = [[InfoArt_DetailRequest alloc] init];
    [request infoArt_DetailRequestWithCat_ID:self.art_id];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InfoArt_DetailModel *model = object;
        tyself.headTitle = model.title;
        [tyself.webView loadHTMLString:model.content baseURL:nil];
        
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
    self.webView = [UIWebView new];
    [self.view addSubview:_webView];
    
    _webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.view.height);
    
    if ([self.webView.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
        }
    }
    
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"1111111");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%@",[error localizedDescription]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
