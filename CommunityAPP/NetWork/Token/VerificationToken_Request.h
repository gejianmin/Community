//
//  VerificationToken_Request.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/10/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseRequest.h"

@interface VerificationToken_Request : BaseRequest

- (void)verificationTokenWithToken:(NSString *)token;

@end
