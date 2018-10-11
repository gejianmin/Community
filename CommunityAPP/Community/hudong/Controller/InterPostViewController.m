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
#import "ELCImagePickerController.h"

@interface InterPostViewController ()

//@property (nonatomic, assign) PostType type;
@property (nonatomic, strong) InterPostViewDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *selectedPicsArr;
@end

@implementation InterPostViewController

+ (void)pushController:(UIViewController *)superController topicListArray:(NSArray *)topicListArray postType:(PostType )type topicId:(NSString* )topicId{
    InterPostViewController * VC = [[InterPostViewController alloc]init];
    VC.topicListArray = topicListArray;
    VC.type = type;
    VC.topicId = topicId;
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
#pragma mark--申请
-(void)fabu{
    NSMutableDictionary * dict = self.dataSource.dataSourceDictionary;
    if ([NSObject isBlankString:[dict objectForKey:@"p_title"]]) {
        [self showToastHUD:@"请输入标题"];
        return;
    }
    if ([NSObject isBlankString:[dict objectForKey:@"p_content"]]) {
        [self showToastHUD:@"请描述详情"];
        return;
    }
    if ([NSObject isBlankString:[dict objectForKey:@"photos"]]) {
        [self showToastHUD:@"请上传图片"];
        return;
    }
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
        if (![model.content isEqualToString:model.contentID]) {
            [dict setObject:model.contentID forKey:@"topic_id"];
        }else{
            [dict setObject:model.content forKey:model.titleName];
            if (_type == PostType_ErShou) {
                [dict setObject:self.topicId forKey:@"topic_id"];
            }
        }
    }
    [dict setObject:@"39.23323" forKey:@"lat"];
    [dict setObject:@"166.312321" forKey:@"lng"];
    [dict setObject:@"北京市" forKey:@"address"];
    JTDWeakSelf
    [LoginViewController verificationTokenWithSuperViewController:self SuccessCallBack:^{
        PublicCommunityRequest *request = [[PublicCommunityRequest alloc] init];
        [request publicCommunityWithInfo:dict];
        [request setFinishedBlock:^(id object, id responseData) {
            if (responseData) {
                if ([responseData[@"status"] isEqualToString:successCode]) {
                    [WeakSelf showToastHUD:@"申请成功" complete:^{
                        [WeakSelf.navigationController popViewControllerAnimated:YES];
                    }];
                }else{
                    [WeakSelf showToastHUD:responseData[@"error"][@"message"] complete:nil];
                }
            }
        } failedBlock:^(NSInteger error, id responseData) {
            NSLog(@"%ld",error);
        }];
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
