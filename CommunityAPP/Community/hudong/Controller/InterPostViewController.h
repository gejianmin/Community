//
//  InterPostViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/19.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewController.h"
#import "InterPostViewDataSource.h"

@interface InterPostViewController : BaseTableViewController

@property (nonatomic,copy) NSArray *topicListArray;
@property (nonatomic, strong) NSMutableDictionary * dataSourceDictionary;

@property(nonatomic,assign)PostType  type;
@property(nonatomic,copy)NSString * topicId;

+ (void)pushController:(UIViewController *)superController topicListArray:(NSArray *)topicListArray postType:(PostType )type topicId:(NSString* )topicId;

@end
