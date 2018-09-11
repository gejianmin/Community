//
//  HHClient.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "HHClient.h"

static NSString *const HHUserCacheKey = @"HHUserCacheKey";

@implementation HHClient
    @synthesize user=_user;
+ (instancetype)sharedInstance{
    static HHClient *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[HHClient alloc] init];
        
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
    if (kStringIsEmpty([[[HHClient sharedInstance]user]token]) ) {
        return NO;
    }else{
        return YES;
    }
}
    @end
