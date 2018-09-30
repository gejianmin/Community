//
//  InterPostViewDataSource.h
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PostType) {
    PostType_LinLiQuan,
    PostType_ErShou
};
@interface InterPostViewDataSource : NSObject

@property (nonatomic,copy) NSArray *topicListArray;


@property(nonatomic,assign) PostType  controllerType;

- (void)registerTableViewCell:(UITableView *)tableView;

- (instancetype)initWithType:(PostType )controllerType;



@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) NSMutableDictionary * dataSourceDictionary;

@end
