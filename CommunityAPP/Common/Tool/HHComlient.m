//
//  HHComlient.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "HHComlient.h"

static NSString *const HHUserCacheKey = @"HHUserCacheKey";

@implementation HHComlient
    
@synthesize user=_user;
    
+ (instancetype)sharedInstance{
    static HHComlient *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[HHComlient alloc] init];
        
    });
    return instance;
}
- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}
    
-(void)setUser:(UserObjModel *)user{
    _user = user;
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:user];
    [[NSUserDefaults standardUserDefaults]setObject:data forKey:HHUserCacheKey];
    
}
- (UserObjModel *)user{
    if (_user==nil) {
        NSData *data=[[NSUserDefaults standardUserDefaults]objectForKey:HHUserCacheKey];
        _user=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return _user;
}
-(BOOL)isLogin{
    if (kStringIsEmpty([[[HHComlient sharedInstance]user]token]) ) {
        return NO;
    }else{
        return YES;
    }
}
    /*!< 清除缓存**/
- (void)clearMemory {
    self.user = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:HHUserCacheKey];
}
    @end
