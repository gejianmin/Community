//
//  JifenshangchengViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "JifenshangchengViewController.h"
#import "FocusScrollView.h"
#import "InforVillage_CarouselRequest.h"
#import "InforVillage_CarouselModel.h"
@interface JifenshangchengViewController ()

@property (weak, nonatomic) IBOutlet UIView *banImageBackView;// 轮播图背景
@property (nonatomic, copy) NSArray *carouselArray;
@property (nonatomic, strong) FocusScrollView *focusScrollView;

@end

@implementation JifenshangchengViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"nav_cacel"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}
- (void)backButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分商城";
    // 轮播图
    [self carouselRequest];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//轮播图请求
- (void)carouselRequest{
    __weak typeof(self) tyself = self;
    InforVillage_CarouselRequest *request = [[InforVillage_CarouselRequest alloc] init];
    
    NSString *ord_ID = [[HHComlient sharedInstance] user].vid;
    [request InforVillage_CarouselRequestWithID:ord_ID];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_CarouselModel *model = object;
        tyself.carouselArray = [model.Village_CarouselArray mutableCopy];
        tyself.focusScrollView = [[FocusScrollView alloc] initWithFrameRect:CGRectMake(0, 0, tyself.banImageBackView.frame.size.width, tyself.banImageBackView.frame.size.height) ContentSize:tyself.focusScrollView.frame.size];
        [tyself.focusScrollView updataImagesWithArray:tyself.carouselArray];
        [tyself.banImageBackView addSubview:tyself.focusScrollView];
    } failedBlock:^(NSInteger error, id responseData) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
