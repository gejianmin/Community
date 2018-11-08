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
#import "ArtDetailBottomView.h"
#import "InfoArt_ShareAddRequest.h"
@interface ArtDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong) UIView * articleHeaderV;//文章标题背景视图
@property(nonatomic, strong) UILabel * titleL;//文章头
@property(nonatomic, strong) UILabel * timeL;//创建时间
@property(nonatomic, strong) ArtDetailBottomView * bottomV;
@property(nonatomic, strong) InfoArt_DetailModel * artDetailModel;
@end

@implementation ArtDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shareSuccess) name:kUMengShareNotification object:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    __weak typeof(self) tyself = self;
    
    InfoArt_DetailRequest *request = [[InfoArt_DetailRequest alloc] init];
    [request infoArt_DetailRequestWithCat_ID:self.art_id];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InfoArt_DetailModel *model = object;
        self.artDetailModel = object;
        tyself.headTitle = model.title;
        self.titleL.text = model.title;
        self.timeL.text = model.create_time;
        self.bottomV.model  = model;
        [tyself.webView loadHTMLString:model.content baseURL:nil];
        
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
    
    
}
- (void)createUI {
    
    //分享按钮
    [self addRightBarItemWithImage:[UIImage imageNamed:@"fenxiang"] target:self action:@selector(share)];
    
    
    //标题头背景图
    [self.view addSubview:self.articleHeaderV];
    [self.articleHeaderV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        
    }];
    //标题
    self.titleL = [[UILabel alloc]init];
    _titleL.numberOfLines = 0;
    _titleL.font = kFont(19);
    [self.articleHeaderV addSubview:_titleL];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.articleHeaderV.mas_top);
        make.left.equalTo(self.articleHeaderV.mas_left);
        make.right.equalTo(self.articleHeaderV.mas_right);
        
    }];
    //创建时间
    self.timeL = [[UILabel alloc]init];
    _timeL.textColor = kColorGray4;
    _timeL.font = kFont(16);
    [self.articleHeaderV addSubview:_timeL];
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.articleHeaderV.mas_right).offset(-15);
        make.top.equalTo(_titleL.mas_bottom).offset(5);
        make.bottom.equalTo(self.articleHeaderV.mas_bottom).offset(-5);
        
    }];
    
    
    //底部数量视图统计
    
    self.bottomV = [ArtDetailBottomView bottomView];
    [self.view addSubview:_bottomV];
    [self.bottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@50);
        
    }];
    JTDWeakSelf
    self.bottomV.shareBlock = ^{
        
        [WeakSelf share];
        
    };
    
    //视图webView
    self.webView = [UIWebView new];
    [self.view addSubview:_webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.articleHeaderV.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(_bottomV.mas_top);
        
        
    }];
    if ([self.webView.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
        }
    }
    
}

// 分享
- (void)share {
    JTDShareContent * model = [[JTDShareContent alloc]init];
    model.centent = self.artDetailModel.desc;
    model.name = self.artDetailModel.title;
    model.shareURL = [NSString stringWithFormat:@"%@%@",@"http://quarter.sinoyjlm.com/article?",self.art_id];
    model.images = @"icon";
    [JTDShareVC shareToController:self shareModel:model shareType:PayStateShare];
    
}

#pragma mark--分享成功
-(void)shareSuccess{
    
    [self showToastHUD:@"分享成功" complete:nil];
    
    InfoArt_ShareAddRequest *request = [[InfoArt_ShareAddRequest alloc]init];
    [request shareCountAddOnce:self.art_id];
    [request setFinishedBlock:^(id object, id responseData) {
       
        NSLog(@"请求成功");
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"请求失败");
    }];
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


- (UIView *)articleHeaderV {
    if (!_articleHeaderV) {
        _articleHeaderV = [[UIView alloc]init];
    }
    return _articleHeaderV;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
