//
//  ICClientSession.m
//  HHNetworking
//
//  Created by tongda ju on 2017/10/27.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import "HHInterface.h"
#import <AdSupport/AdSupport.h>
#import "AFNetWorking.h"
static NSString * getTokenUrl = @"/token/gettoken";//获取token
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
NSString * const kLoginSingleSignOnNotification = @"kLoginSingleSignOnNotification";

NSString * const kCompanyId = @"companyId";
NSString *const kLoginMustNotification=@"kLoginMustNotification";
NSString * const kUserID = @"userID";
NSString * const kUserName = @"name";


@implementation ICClientSession

- (NSURLSessionDataTask *)OA_Post:(NSString *)path HTTPHeaderValue:(NSDictionary *)HTTPHeaderDictionary params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete{
   
    NSString *url=[self urlWithPath:path];
    
    NSMutableDictionary * headerDictionary = [NSMutableDictionary dictionary];
    [headerDictionary addEntriesFromDictionary:@{@"Content-Type":@"application/json;charset=UTF-8"}];
    if (!kDictIsEmpty(HTTPHeaderDictionary)) {/*!< 判断字典非空*/
        [headerDictionary addEntriesFromDictionary:HTTPHeaderDictionary];
    }
    NSURLSessionDataTask * task = [self POST:url params:pramas HTTPHeader:headerDictionary complete:^(id response, HHError *error) {
        if (response){
            if (complete) {
                complete(response,nil);
            }
            
        }else{
            if (complete) {
                complete(nil,error);
            }
        }
    }];
    return task;
    
}
-(NSURLSessionDataTask *)OA_PostNormal:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete{
    
    NSURLSessionDataTask * task = [self POST_NORMAL:path params:pramas urlType:0 HTTPHeader:@{@"Content-Type":@"application/json;charset=UTF-8"} complete:^(id response, HHError *error) {
         if (response){
        if (complete) {
            complete(response,nil);
        }
    }else{
        if (complete) {
            complete(nil,error);
        }
    }
    }];
    return task;
    
}
/*!< 特殊接口，对返回值不做任何处理*/
- (NSURLSessionDataTask *)OA_PostNormalFormData:(NSString *)path params:(NSDictionary *)pramas  complete:(HHSessionCompleteBlock)complete{
    
    NSString *url=[self urlWithPath:path];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];/*!< 用于接收未知类型的数据，数据不做任何处理*/
    NSURLSessionDataTask *task = [manager POST:url parameters:nil progress:nil success:
     ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSString *text = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
         complete(text,nil);
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败--%@",error);
     }];
    return task;
}
- (NSURLSessionDataTask *)post_asyncUploadImage:(UIImage *)image path:(NSString *)path complete:(HHSessionCompleteBlock )complete{
    NSString *url=[self urlWithPath:path];
    static int i=0;i++;
    HHFile *file=[[HHFile alloc] init];
    file.data=UIImageJPEGRepresentation(image, 0.1);
    file.mimeType=@"image/jpeg";
    file.name=[NSString stringWithFormat:@"%d.jpg",(int)[[NSDate date] timeIntervalSince1970]+i];
    file.key=@"upload";
    return [self FILE:url params:nil files:@[file] complete:^(id response, HHError *error) {
        if (response) {
            if (complete) {
                complete(response,nil);
            }
        }else{
            if (complete) {
                complete(nil,error);
            }
        }
    }];
    
    
    
}


- (NSURLSessionDataTask *)OA_asyncUploadImage:(UIImage *)image path:(NSString *)path complete:(HHSessionCompleteBlock )complete{
    
    NSString *url=[self urlWithPath:path];
    static int i=0;i++;
    HHFile *file=[[HHFile alloc] init];
    file.data=UIImageJPEGRepresentation(image, 0.1);
    file.mimeType=@"image/jpeg";
    file.name=[NSString stringWithFormat:@"%d.jpg",(int)[[NSDate date] timeIntervalSince1970]+i];
    file.key=@"upload";
    return [self FILE:url params:nil files:@[file] complete:^(id response, HHError *error) {
        if (response) {
            if (complete) {
                complete(response,nil);
            }
        }else{
            if (complete) {
                complete(nil,error);
            }
        }
    }];
}

@end
