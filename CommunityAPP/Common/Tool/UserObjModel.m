//
//  UserObjModel.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "UserObjModel.h"

static UserObjModel *userObj = nil;
@implementation UserObjModel

+ (instancetype)shareIntance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userObj == nil) {
            userObj = [[UserObjModel alloc] init];
        }
    });
    return userObj;
}
- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

@end
