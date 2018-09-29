//
//  PubMyCommunityVC.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "PubMyCommunityVC.h"
#import "GSAPublishCell.h"
#import "GSAPublishModel.h"
#import "SelectMyCommunityVC.h"
@interface PubMyCommunityVC ()<UITableViewDelegate,UITableViewDataSource,GSAPublishButtonDelegate>

@property (nonatomic, strong) NSMutableArray  *dataSourceItemsArray;
@property(nonatomic,strong)UITableView * ps_tableView;

@end

@implementation PubMyCommunityVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申请入住小区";
    [self addRightBarItemWithTitle:@"发布" tintColor:kColorWhite backgroudColor:kColorMainBlue target:self action:@selector(publishEvent)];
    [self.view addSubview:self.ps_tableView];
    [self reloadArrayData];
}

-(void)reloadArrayData{
    self.dataSourceArray = [NSMutableArray arrayWithArray:@[
                                                            [[GSAPublishModel alloc] initWithTitle:@"小区名" detailTitle:@"请选择小区" reuseIdentifier:kImageCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorSelectStatu content:@"" contentID:@"" titleName:@"" selecStyle:selectDateStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"楼栋号" detailTitle:@"请输入楼栋号（如A10或10）" reuseIdentifier:kNormalCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"" selecStyle:selectDateStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"单元号" detailTitle:@"请输入单元号（无单元号 输入0）" reuseIdentifier:kNormalCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"" selecStyle:selectToPlaceStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"门牌号" detailTitle:@"请输入门牌号（如102）" reuseIdentifier:kNormalCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"" selecStyle:selectInterestStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"联系人" detailTitle:@"" reuseIdentifier:kButtonCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:segmentShowCustomStyle content:[[[HHClient sharedInstance]user]mobile] contentID:@"" titleName:@"" selecStyle:selectThemeStyle],
                                                            [[GSAPublishModel alloc] initWithTitle:@"手机号" detailTitle:@"" reuseIdentifier:kButtonCellReuseIdentifier buttonTitle:@"" isHeidenMark:1 selectorStatu:segmentShowCustomStyle content:[[[HHClient sharedInstance]user]mobile] contentID:@"" titleName:@"" selecStyle:0],
                                                            ]];
    
}
- (UITableView *)ps_tableView{
    if (_ps_tableView == nil) {
        _ps_tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, HH_SCREEN_H-GSA_TabbarHeight) style:UITableViewStyleGrouped];
        _ps_tableView.delegate = self;
        _ps_tableView.dataSource = self;
        _ps_tableView.tag = 2;
        [_ps_tableView setBackgroundColor:[UIColor clearColor]];
        [_ps_tableView registerClass:[GSAPublishCell class] forCellReuseIdentifier:NSStringFromClass([GSAPublishCell class])];
    }
    return _ps_tableView;
}
-(NSMutableArray*)dataSourceArray{
    if (_dataSourceArray == nil) {
        _dataSourceArray = [[NSMutableArray alloc]init];
    }
    return _dataSourceArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]init];
    return headerView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 62.5;
//}
#pragma mark-真实高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
    return 55.0;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GSAPublishModel * model = self.dataSourceArray[indexPath.row];
    GSAPublishCell *cell=[tableView dequeueReusableCellWithIdentifier:model.reuseIdentifier];
    if (cell==nil) {
        cell=[[GSAPublishCell alloc] initWithReuseIdentifier:model.reuseIdentifier indexPath:indexPath];
    }
    cell.model = model;
    cell.delegate = self;
    [cell reloadDataWithModel:model indexPath:indexPath callBack:^(NSString *content, NSIndexPath *indexPath) {
        [self reloadDataWithContent:content andContentID:content indexPath:indexPath];
    }];
    return cell;
}

#pragma mark--描述约行事件代理
-(void)GSAPublishAgreeActionButton:(CustomBtn *)sender indexPath:(NSIndexPath *)currentIndexPath{
    NSString* titleString = nil;
    if ([sender.titleLabel.text isEqualToString:@"点击编辑约行描述"]) {
        titleString = @"编辑约行描述";
    }else{//点击编辑轨迹描述
        titleString = @"编辑轨迹描述";
    }
//    [GSAHomeAgreeActionDescribeViewController pushFromViewController:self andContent:[self getContentWithIndexPath:currentIndexPath] andTitle:titleString  callback:^(NSString *content) {
//        [self reloadDataWithContent:content andContentID:content indexPath:currentIndexPath];
//    }];
}
#pragma mark--描述事件代理
-(void)GSAPublishButton:(CustomBtn *)sender indexPath:(NSIndexPath *)currentIndexPath{
    //    GSAWeakSelf
    //    [GSARichTextEditViewController pushFromViewController:self andContent:[self getContentWithIndexPath:currentIndexPath] callback:^(NSString *content) {
    //        [self reloadDataWithContent:content andContentID:content indexPath:currentIndexPath];
    //    }];
//    [GSARichTextEditViewController pushFromModelViewController:self andContent:[self getContentWithIndexPath:currentIndexPath] callback:^(NSString *content, NSString *ID) {
//        [self reloadDataWithContent:content andContentID:ID indexPath:currentIndexPath];
//    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GSAPublishModel * model = self.dataSourceArray[indexPath.row];
//    JTDWeakSelf
    if (model.selecStyle == selectDateStyle ) {
        [self reloadDataWithContent:@"某小区" andContentID:@"mouxiaoq" indexPath:indexPath];
        SelectMyCommunityVC * VC = [[SelectMyCommunityVC alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
//        HHDatePickerController *date=[[HHDatePickerController alloc] init];
//        date.datePickerStyle=HHDatePickerStyleNormal;
//        date.datePickerMode=UIDatePickerModeDate;
//        date.didSelectDateBlock=^(HHDate *date){
//            NSDateFormatter *dfmt=[[NSDateFormatter alloc]init];
//            [dfmt setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//            NSString * dateTime =[[[dfmt stringFromDate:date.date] copy]substringToIndex:10];//11
//            [self reloadDataWithContent:dateTime andContentID:dateTime indexPath:indexPath];
//        };
//        [date showInViewController:self];
    }
}
//将UIColor转换成16进制字符串 转换出来的字符串不带＃号
-(NSString*)toStrByUIColor:(UIColor*)color{
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    int rgb = (int) (r * 255.0f)<<16 | (int) (g * 255.0f)<<8 | (int) (b * 255.0f)<<0;
    return [NSString stringWithFormat:@"%06x", rgb];
}
#pragma mark -- cell赋值操作
- (void)reloadDataWithContent:(NSString * )content andContentID:(NSString *)contentID indexPath:(NSIndexPath *)indexPath {
    GSAPublishModel * model = _dataSourceArray[indexPath.row];
    model.content = content;
    model.contentID = contentID;
    [_dataSourceArray replaceObjectAtIndex:indexPath.row withObject:model];
    if (model.selectorStatu == selectorSelectStatu) {
        [self.ps_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}
#pragma mark--发布
-(void)publishEvent{
    for (int i = 0; i < self.dataSourceArray.count; i++) {
        GSAPublishModel * model = self.dataSourceArray[i];
        HHLog(@"数据%@",model.content);
        if ([NSObject isBlankString:model.content]) {
            [self showToastHUD:[NSString stringWithFormat:@"%@",model.detailTitle]];
            return;
        }
    }
    
}
//- (NSString *)getContentWithIndexPath:(NSIndexPath *)indexPath {
//    GSAPublishModel * model = _dataSourceArray[indexPath.row];
//    return  model.content;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
