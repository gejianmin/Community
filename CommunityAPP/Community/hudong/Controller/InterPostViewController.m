//
//  InterPostViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/19.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterPostViewController.h"
#import "NearCommunityRequest.h"
#import "GSAPublishModel.h"
@interface InterPostViewController ()

//@property (nonatomic, assign) PostType type;
@property (nonatomic, strong) InterPostViewDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *selectedPicsArr;
@end

@implementation InterPostViewController

+ (void)pushController:(UIViewController *)superController topicListArray:(NSArray *)topicListArray postType:(PostType )type{
    InterPostViewController * VC = [[InterPostViewController alloc]init];
    VC.topicListArray = topicListArray;
    VC.type = type;
    VC.hidesBottomBarWhenPushed = YES;
    [superController.navigationController pushViewController:VC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = kColorGray9;
    [self addRightBarItemWithTitle:@"发布" tintColor:kColorBlack target:self action:@selector(fabu)];
    if (_type == PostType_ErShou) {
        self.title = @"发布二手";
    }else{
        self.title = @"发布邻里圈";
    }
    self.tableView.frame = self.view.bounds;
    self.dataSource = [[InterPostViewDataSource alloc] initWithType:self.type];
    self.dataSource.topicListArray = self.topicListArray;
    [self.dataSource registerTableViewCell:self.tableView];
    
    
}
//-(void)fabu{
//    HHLog(@"top数据%@",self.dataSource.dataSourceDictionary);
//    for (int i = 0; i< self.dataSource.dataSourceArray.count; i++) {
//        GSAPublishModel * model = self.dataSource.dataSourceArray[i];
//        HHLog(@"shuju%@",model.content);
//    }
//    if (_type == PostType_LinLiQuan) {
//
//    }
//}
#pragma mark--申请
-(void)fabu{
    //    * @params p_title    标题
    //    * @params p_content  帖子内容
    //    * @params lat        纬度
    //    * @params lng        经度
    //    * @params topic_id   话题id
    //    * @params address    地址
    //    * @params photos     上传图片的地址
    //    * @params price      价格
    
    NSMutableDictionary * dict = self.dataSource.dataSourceDictionary;
    NSMutableArray * array = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.dataSource.dataSourceArray.count; i++) {
        GSAPublishModel * model = self.dataSource.dataSourceArray[i];
        if ([model.titleName isEqualToString:@"price"]) {
            if ([NSObject isBlankString:model.content]) {
                [self showToastHUD:@"请输入价格"];
                return;
            }
        }
        if ([NSObject isBlankString:model.content]) {
            [self showToastHUD:[NSString stringWithFormat:@"%@",model.detailTitle]];
            return;
        }
        [array addObject:model.content];
        if (![model.content isEqualToString:model.contentID]) {
            [dict setObject:model.contentID forKey:@"topic_id"];
        }else{
            [dict setObject:model.content forKey:model.titleName];
        }
    }
    [dict setObject:@"39.23323" forKey:@"lat"];
    [dict setObject:@"166.312321" forKey:@"lng"];
    [dict setObject:@"北京市" forKey:@"address"];
    [dict setObject:@"12433" forKey:@"photos"];
    HHLog(@"dict==== = %@", dict);
    //    return;
    //    PublicCommunityRequest *request = [[PublicCommunityRequest alloc] init];
    //    [request publicCommunityWithInfo:dict];
    //    [request setFinishedBlock:^(id object, id responseData) {
    //        if (responseData) {
    //            if ([responseData[@"status"] isEqualToString:successCode]) {
    //                [self showToastHUD:@"申请成功" complete:^{
    //                    [self.navigationController popViewControllerAnimated:YES];
    //                }];
    //            }
    //        }
    //
    //
    //    } failedBlock:^(NSInteger error, id responseData) {
    //        NSLog(@"%ld",error);
    //    }];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
