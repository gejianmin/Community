//
//  InterButton_categaryModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/20.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Inter_categaryModel : NSObject
@property (nonatomic, copy) NSString *topic_id;//帖子分类id
@property (nonatomic, copy) NSString *topic_logo;
@property (nonatomic, copy) NSString *topic_name;//分类名称
@property (nonatomic, copy) NSString *topic_desc;
@property (nonatomic, copy) NSString *is_follow;
@property (nonatomic, copy) NSString *follow_number;

@end
@interface InterButton_categaryModel : NSObject
@property (nonatomic, copy) NSArray <Inter_categaryModel *> *data;


@end
