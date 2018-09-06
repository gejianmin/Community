//
//  NetWorkConfig.m
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NetWorkConfig.h"

@implementation NetWorkConfig

- (instancetype)init{
    if (self = [super init]) {
//        _headerFields=[[NSMutableDictionary alloc]initWithCapacity:8];
        _hostString = URI_MAIN;
    }
    return self;
}
@end
