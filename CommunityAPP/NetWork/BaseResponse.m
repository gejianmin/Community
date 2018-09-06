//
//  BaseResponse.m
//  55BBS
//
//  Created by KepenJ on 2017/2/24.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseResponse.h"
#import "BaseRequest.h"

@implementation BaseResponse

-(void)parseBackError
{
    [self showErrorResultInMainThreadToUI:self.errorCode];
//    [self doesNotRecognizeSelector:_cmd];

}

-(void)parseBackData
{
    [self doesNotRecognizeSelector:_cmd];
}

-(void)showFinishedResultDataInMainThreadToUI:(id)mResultData{
    if (_request.finishedBlock)
    {
        if ([NSThread isMainThread])
        {
            _request.finishedBlock(mResultData,_responseData);
        }
        else
        {
            __strong __block id requestObj=self.request;
            dispatch_async(dispatch_get_main_queue(), ^{
                _request.finishedBlock(mResultData,_responseData);
                requestObj=nil;
            });
        }
    }
}

-(void)showErrorResultInMainThreadToUI:(NSInteger)mErrorCode
{
    if (_request.failedBlock)
    {
        if ([NSThread isMainThread])
        {
            _request.failedBlock(mErrorCode,_responseData);
        }
        else
        {
            __strong __block id requestObj=self.request;
            dispatch_async(dispatch_get_main_queue(), ^{
                _request.failedBlock(mErrorCode,_responseData);
                requestObj=nil;
            });
        }
    }
}

@end
