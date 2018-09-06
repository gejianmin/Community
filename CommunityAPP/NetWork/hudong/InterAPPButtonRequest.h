//
//  InterAPPButtonRequest.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface InterAPPButtonRequest : BaseRequest


/**
 获取某小区互动页面的app按钮

 @param ID 小区ID
 */
- (void)interAPPButtonRequestWithID:(NSString *)ID;

@end
