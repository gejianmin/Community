//
//  PostActivityListController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/5.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "PostActivityListController.h"
#import "PostActivityListCell.h"
#import "SGPagingView.h"

@interface PostActivityListController ()<UITableViewDelegate,UITableViewDataSource,SGPageTitleViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation PostActivityListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发布活动";
    self.barBackGroundColor = [UIColor redColor];
    [self setLeftItemWithImageTarget:self];
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = [UIColor blackColor];
    configure.spacingBetweenButtons = 30.f;
    configure.titleFont = FONT(14);
    configure.titleSelectedColor = [UIColor redColor];
    configure.indicatorColor = [UIColor redColor];
    
    SGPageTitleView *pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(2.0f, 0, SCREEN_WIDTH, 50) delegate:self titleNames:@[@"已审核",@"未审核"] configure:configure];
    pageTitleView.backgroundColor = [UIColor whiteColor];
    pageTitleView.isShowBottomSeparator = NO;
    pageTitleView.isNeedBounces = NO;
    pageTitleView.offSetAnimated = YES;
    pageTitleView.selectedIndex = 0;
    
    [self.view addSubview:pageTitleView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, pageTitleView.bottom, self.view.width, self.view.height - pageTitleView.bottom) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.equalTo(@(pageTitleView.bottom));
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostActivityListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostActivityListCell"];
    if (!cell) {
        cell = [[PostActivityListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PostActivityListCell"];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
