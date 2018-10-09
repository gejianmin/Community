//
//  HHClient.h
//  HHNetworking
//
//  Created by gejianmin on 16/7/11.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HHUserInfo;
@protocol HHSessionManager;

@interface HHClient : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *baseURL;//根域名
@property (nonatomic, copy) NSString *token;//token
@property (nonatomic, copy) NSString *UserId;//用户ID
@property (nonatomic, copy) NSString *EnterpriseId;//公司ID
@property (nonatomic, copy) NSString *DepartmentId;//部门ID
@property (nonatomic, copy) NSString *RoleId;//角色ID



@property (nonatomic, strong) HHUserInfo *user;//当前登录用户

@property (nonatomic, strong, readonly) id<HHSessionManager> sessionManager;

@property (nonatomic,copy) NSString * realLoginIdentifier;
 
- (BOOL)isLogin;

- (void)signup;//退出登录


- (void)clearMemory;



@end
