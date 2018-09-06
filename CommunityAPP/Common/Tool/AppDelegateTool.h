//
//  APPDelegateTool.h
//  CommunityAPP
//
//  Created by yingke on 2018/7/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDelegateTool : NSObject

+ (UIViewController *)currentViewController;

+ (UIViewController *)topViewController;
@end
