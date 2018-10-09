//
//  HHProjectSession.m
//  HHNetworking
//
//  Created by LWJ on 2016/11/30.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#import "HHInterface.h"
#import "HHProject.h"
#import "HHCustomerCellItem.h"
#import "HHUserInfo.h"
@implementation HHProjectSession
//- (void)asyncFetchProjectList:(HHList)list complete:(HHSessionCompleteBlock)complete{
//    [HHSecurity sharedInstance].businessLine=kSecRZZLBusinessLine;
//    NSString *url=[self urlWithPath:kBangGetProjectList];
//    [self DATA:url params:@{@"PostModel":@{@"SupplierID":[HHClient sharedInstance].user.FinanceLeaseId,@"rows":@(list.pageSize),@"page":@(list.pageIndex),@"totalRows":@(0),@"totalPages":@(0)}} complete:^(id response, HHError *error) {
//        if (response) {
//            NSArray *temp=[HHProject mj_objectArrayWithKeyValuesArray:response[@"Data"][@"Data"]];
//            complete([temp copy],nil);
//        }else{
//            complete(nil,error);
//        }
//    }];
//    [HHSecurity sharedInstance].businessLine=kSecBusinessLine;
//
//}
//- (void)asyncDeleteProject:(HHProject *)project complete:(HHSessionCompleteBlock)complete{
//    [HHSecurity sharedInstance].businessLine=kSecRZZLBusinessLine;
//    NSString *url=[self urlWithPath:kBangDeleteQuotation];
//    [self DATA:url params:@{@"PostModel":@{@"Project_ID":project.ProjectID,@"Suppliers_ID":[HHClient sharedInstance].user.FinanceLeaseId}} complete:^(id response, HHError *error) {
//        if (response) {
//            complete(response,nil);
//        }else{
//            complete(nil,error);
//        }
//
//    }];
//    [HHSecurity sharedInstance].businessLine=kSecBusinessLine;
//}
//- (void)asyncFetchProjectInfoById:(NSString *)pid complete:(HHSessionCompleteBlock)complete{
//    [HHSecurity sharedInstance].businessLine=kSecRZZLBusinessLine;
//    NSString *url=[self urlWithPath:kBangGetProjectInfo];
//    [self DATA:url params:@{@"PostModel":@{@"Supplier_Id":[HHClient sharedInstance].user.FinanceLeaseId,@"Project_Id":pid}} complete:^(id response, HHError *error) {
//        if (response) {
//            HHCustomer *customer=[HHCustomer mj_objectWithKeyValues:response[@"Data"]];
//            complete(customer,nil);
//
//        }else{
//            complete(nil,error);
//        }
//    }];
//    [HHSecurity sharedInstance].businessLine=kSecBusinessLine;
//
//}
//- (void)asyncSubmitProject:(HHProject *)project complete:(HHSessionCompleteBlock)complete{
//    [HHSecurity sharedInstance].businessLine=kSecRZZLBusinessLine;
//    NSString *url=[self urlWithPath:kBangSumbitProject];
//    [self DATA:url params:@{@"PostModel":@{@"Supplier_Id":[HHClient sharedInstance].user.FinanceLeaseId,@"Project_Id":project.ProjectID}} complete:^(id response, HHError *error) {
//        if (response) {
//            complete(response,nil);
//            
//        }else{
//            complete(nil,error);
//        }
//    }];
//    [HHSecurity sharedInstance].businessLine=kSecBusinessLine;
//
//}
- (void)asyncOCRWithIDCardImage:(UIImage *)image complete:(HHSessionCompleteBlock)complete{
    NSString *url=kFacePlusOCRIDCard;
    
    HHFile *file=[[HHFile alloc] init];
    file.data=UIImageJPEGRepresentation(image, 0.5);
    file.key=@"image";
    file.mimeType=@"image/jpeg";
    file.name=[NSString stringWithFormat:@"%d.jpg",(int)[[NSDate date] timeIntervalSince1970]];
    [self FILE:url params:@{@"api_key":kFaceID_APP_KEY,@"api_secret":kFaceID_APP_SECRET,@"legality":@"0"} files:@[file] HTTPHeader:nil complete:^(id response, HHError *error) {
        
        if (response) {
            FMWLog(@"\n\n路径:%@\n***请求结果:\n%@\n***结束\n\n",url,response);
            HHIDCard *idcard=[HHIDCard mj_objectWithKeyValues:response];
            complete(idcard,nil);
        }else{
            FMWLog(@"error:%@",error);
            if (complete) {
                complete(nil,error);
            }
        }
        
    }];
}

@end
