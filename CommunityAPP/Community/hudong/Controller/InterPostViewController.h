//
//  InterPostViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/19.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewController.h"
#import "InterPostViewDataSource.h"

//typedef NS_ENUM(NSInteger,PostType) {
//    PostType_LinLiQuan,
//    PostType_ErShou
//};

@interface InterPostViewController : BaseTableViewController

//- (instancetype)initWithInterPostWith:(PostType)type;

@property (nonatomic,copy) NSArray *topicListArray;

@property(nonatomic,assign)PostType  type;

+ (void)pushController:(UIViewController *)superController topicListArray:(NSArray *)topicListArray postType:(PostType )type;

@end
