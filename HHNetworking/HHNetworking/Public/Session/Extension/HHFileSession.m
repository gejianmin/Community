//
//  HHFileSession.m
//  HHNetworking
//
//  Created by LWJ on 2016/12/5.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#import "HHInterface.h"
#import "HHProject.h"
#define IMAGERURL(imageUrlPath) [imageUrlPath hasPrefix:@"http"] ? imageUrlPath : [NSString stringWithFormat:@"%@%@",ALiYunUrlPath,imageUrlPath]
@implementation HHFileSession
//- (NSURL *)downloadSmallPathWithImage:(HHCustomerImage *)image{
//     NSString *imagePath=[IMAGERURL(image.PATH) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    return [NSURL URLWithString:imagePath];
//}

@end

