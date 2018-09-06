//
//  RequestBaseModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/8.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestBaseModel : NSObject

@property (nonatomic ,copy) NSString *status; //@"failed" or @"success"
@property (nonatomic ,assign) NSInteger code;
@property (nonatomic ,copy) NSString *message;

@end
