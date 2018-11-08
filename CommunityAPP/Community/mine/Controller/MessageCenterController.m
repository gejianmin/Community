//
//  MessageCenterController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/8.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "MessageCenterController.h"
#import "SGPagingView.h"
#import "NoticeTableViewCell.h"
#import "MessageTableViewCell.h"

typedef NS_ENUM(NSInteger,Source) {
    Source_Message,
    Source_Notice
};

@interface MessageCenterController ()<SGPageTitleViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) Source source;
@property (nonatomic,strong) NSMutableArray *dataArry;
@property (nonatomic,strong) NSMutableArray *delectArray;
@end

@implementation MessageCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = RGB(246, 246, 246);
    self.view.backgroundColor = kColorGray9;

    self.title = @"消息中心";
    self.barBackGroundColor = [UIColor whiteColor];
    [self setLeftItemWithImageTarget:self];
    [self setRightItemWithTitle:@"删除" Target:self];
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleColor = [UIColor blackColor];
    configure.spacingBetweenButtons = 30.f;
    configure.titleFont = FONT(15);
    configure.titleSelectedColor = [UIColor redColor];
    configure.indicatorColor = [UIColor redColor];
    
    SGPageTitleView *pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(2.0f, 0, SCREEN_WIDTH, 50) delegate:self titleNames:@[@" 消息 ",@" 通知 "] configure:configure];
    pageTitleView.backgroundColor = [UIColor whiteColor];
    pageTitleView.isShowBottomSeparator = NO;
    pageTitleView.isNeedBounces = NO;
    pageTitleView.offSetAnimated = YES;
    pageTitleView.selectedIndex = 0;
    [self.view addSubview:pageTitleView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 20)];
    lineView.backgroundColor = [UIColor grayColor];
    [pageTitleView addSubview:lineView];
    lineView.centerX = pageTitleView.width/2;
    lineView.centerY = pageTitleView.height/2;

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, pageTitleView.bottom, self.view.width, self.view.height - pageTitleView.bottom) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.equalTo(@(pageTitleView.bottom));
    }];
    
    
    _source = Source_Message;
    self.dataArry = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
}
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    if (selectedIndex == 0) {
        _source = Source_Message;
    }else{
        _source = Source_Notice;
    }
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArry.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_source == Source_Message) {
        
        MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell"];
        if (!cell) {
            cell = [[MessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageTableViewCell"];
        }
        return cell;
    }else{
        NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoticeTableViewCell"];
        if (!cell) {
            cell = [[NoticeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NoticeTableViewCell"];
        }
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.isEditing) {
        
        [self.delectArray addObject:indexPath];
        
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.isEditing) {
        [self.delectArray removeObject:indexPath];
        return;
    }
}
/**
 *  只要实现了这个方法，左滑出现按钮的功能就有了
 (一旦左滑出现了N个按钮，tableView就进入了编辑模式, tableView.editing = YES)
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/**
 *  左滑cell时出现什么按钮
 */
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"关注" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了关注");
        
        // 收回左滑出现的按钮(退出编辑模式)
        tableView.editing = NO;
    }];
    
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.dataArry removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    return @[action1, action0];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)next{
    if (self.tableView.isEditing) {
        [self.tableView setEditing:NO animated:YES];
        [self.delectArray removeAllObjects];
    }else{
        [self.tableView setEditing:YES animated:YES];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *)dataArry{
    if (!_dataArry) {
        self.dataArry = [NSMutableArray array];
    }
    return _dataArry;
}
- (NSMutableArray *)delectArray{
    if (!_delectArray){
        self.delectArray = [NSMutableArray array];
    }
    return _delectArray;
}

@end
