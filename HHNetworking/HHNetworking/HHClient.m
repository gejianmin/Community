//
//  HHClient.m
//  HHNetworking
//
//  Created by gejianmin on 16/7/11.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#import "HHClient.h"
#import "HHInterface.h"

//static NSString *const HHUserCacheKey = @"HHUserCacheKey";
static NSString *const HHUserCacheKey = @"HHUserCacheKeyTmp";


@interface HHClient()


@end


@implementation HHClient

@synthesize sessionManager=_sessionManager;
@synthesize token=_token;
@synthesize user=_user;
@synthesize UserId=_UserId;
@synthesize EnterpriseId=_EnterpriseId;
@synthesize DepartmentId=_DepartmentId;
@synthesize RoleId=_RoleId;
@synthesize realLoginIdentifier=_realLoginIdentifier;

+ (instancetype)sharedInstance{
    static HHClient *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[HHClient alloc] init];
        
    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginFinish:) name:kLoginFinishNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginFinish:) name:kTokenExpiredNotification object:nil];
        
        _baseURL=kDefaultBaseURLString;
        [[HHSecurity sharedInstance] setCommonParam:self.token forKey:@"Token"];
//        [HHSecurity sharedInstance].businessLine=kSecBusinessLine;
        
    }
    return self;
}

- (void)setToken:(NSString *)token{
    _token=token;
    [[HHSecurity sharedInstance] setCommonParam:token forKey:@"Token"];
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:HH_AUTH_TOKEN];
}

- (void)setUserId:(NSString *)UserId {
    
    [[NSUserDefaults standardUserDefaults] setObject:UserId forKey:@"UserId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)setEnterpriseId:(NSString *)EnterpriseId {
    
    [[NSUserDefaults standardUserDefaults] setObject:EnterpriseId forKey:@"EnterpriseId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)setDepartmentId:(NSString *)DepartmentId{
    [[NSUserDefaults standardUserDefaults] setObject:DepartmentId forKey:@"DepartmentId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)setRoleId:(NSString *)RoleId{
    [[NSUserDefaults standardUserDefaults] setObject:RoleId forKey:@"RoleId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)loginFinish:(NSNotification *)notification{
    
    HHUserInfo *user=notification.object;
    self.user=user;
}
- (NSString *)token{
    if (_token==nil) {
        _token=[[NSUserDefaults standardUserDefaults]objectForKey:HH_AUTH_TOKEN];
    }
    return _token;
}

- (NSString *)EnterpriseId {
    if (_EnterpriseId==nil) {
        _EnterpriseId=[[NSUserDefaults standardUserDefaults]objectForKey:@"EnterpriseId"];
    }
    return _EnterpriseId;
    
}
- (NSString *)DepartmentId {
    if (_DepartmentId==nil) {
        _DepartmentId=[[NSUserDefaults standardUserDefaults]objectForKey:@"DepartmentId"];
    }
    return _DepartmentId;
    
}
- (NSString *)RoleId {
    if (_RoleId==nil) {
        _RoleId=[[NSUserDefaults standardUserDefaults]objectForKey:@"RoleId"];
    }
    return _RoleId;
    
}


-(void)setUser:(HHUserInfo *)user{
//    if (user.userId.length > 0 && user.token.length == 0) {
//        NSLog(@"个人信息存储异常，未解决");
//        return;
//    }
    _user=user;
   
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:user];
    [[NSUserDefaults standardUserDefaults]setObject:data forKey:HHUserCacheKey];
    
}
- (HHUserInfo *)user{
    if (_user==nil) {
        NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:HHUserCacheKey];
        _user=[NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (!_user) {
            _user = [[HHUserInfo alloc] init];
        }
    }
    return _user;
}
//-(id<HHAuthSession>)authSession{
//    if (_authSession==nil) {
//        _authSession=[[HHAuthSession alloc] initWithBaseURL:self.baseURL];
//        ((HHAuthSession *)_authSession).securityBaseURL=_securityURL;
//
//    }
//    return _authSession;
//}

- (id<HHSessionManager>)sessionManager{
    if (_sessionManager==nil) {
        _sessionManager=[[HHSessionManager alloc] init];
    }
    return _sessionManager;
}
/*!< 清除缓存**/
- (void)clearMemory {
    
    _EnterpriseId = nil;
    _DepartmentId = nil;
    _RoleId = nil;
    _UserId = nil;
    
    self.user = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:HHUserCacheKey];
    
}

- (void)signup {
    //退出登录
    //1.用户信息清除
    [self clearMemory];
    //2.融云退出
    
    //2.socket断开
}


@end
