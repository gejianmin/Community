//
//  InterPostViewDataSource.h
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InterPostViewDataSource : NSObject

@property (nonatomic,copy) NSArray *topicListArray;

- (void)registerTableViewCell:(UITableView *)tableView;

@end
