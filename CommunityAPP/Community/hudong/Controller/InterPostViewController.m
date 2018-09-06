//
//  InterPostViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/19.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterPostViewController.h"
#import "InterPostViewDataSource.h"

@interface InterPostViewController ()

@property (nonatomic, assign) PostType type;
@property (nonatomic, strong) InterPostViewDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray *selectedPicsArr;
@end

@implementation InterPostViewController

- (instancetype)initWithInterPostWith:(PostType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = RGB(249, 249, 249);
    
    [self setLeftItemWithImageTarget:self];
    [self setRightItemWithTitle:@"发布" Target:self];
    
    if (_type == PostType_ErShou) {
        self.title = @"发布二手";
    }else{
        self.title = @"发布邻里圈";
    }
    self.tableView.frame = self.view.bounds;
    self.dataSource = [[InterPostViewDataSource alloc] init];
    _dataSource.topicListArray = self.topicListArray;
    [_dataSource registerTableViewCell:self.tableView];
    
    if (_type == PostType_LinLiQuan) {

    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
