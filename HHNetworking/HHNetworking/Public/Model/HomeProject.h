//
//  HomeProject.h
//  CRMSystemClient
//
//  Created by tongda ju on 2017/5/22.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BusinessJsonArray,ClueJsonArray,ContactsJsonArray,CustomerJsonArray,PerformanceTarget,SalesStatistics,AssessmentTargetDataList,IdentifierDataList,TimeScopeDataList;
@interface HomeProject : NSObject
//首页
@property (nonatomic, strong) PerformanceTarget * performanceTarget;
@property (nonatomic, strong) SalesStatistics * salesStatistics;
@property (nonatomic, strong) AssessmentTargetDataList * assessmentTargetDataList;
@property (nonatomic, strong) IdentifierDataList * identifierDataList;
@property (nonatomic, strong) TimeScopeDataList * timeScopeDataList;


//搜索
@property (nonatomic, strong) BusinessJsonArray * businessJsonArray;
@property (nonatomic, strong) ClueJsonArray *clueJsonArray;
@property (nonatomic, strong) ContactsJsonArray *contactsJsonArray;
@property (nonatomic, strong) CustomerJsonArray *customerJsonArray;
//businessJsonArray
@end
////////////////////////////////////////////////首页///////////////////////////////////////////////
//业绩目标
@interface PerformanceTarget : NSObject

@property(nonatomic,strong)NSString * alreadyCompleted;//已完成
@property(nonatomic,strong)NSString *completionRate;
@property(nonatomic,strong)NSString *targetAmount;//目标金额

@end


//销售统计
@interface SalesStatistics : NSObject

@property(nonatomic,strong)NSString *contractNum;//合同数量
@property(nonatomic,strong)NSString * contractPaymentAmount;//回款金额
@property(nonatomic,strong)NSString *contractTotalAmount;//合同金额
@property(nonatomic,strong)NSString * contractPaymentAmountUnit;//回款金额单位
@property(nonatomic,strong)NSString *contractTotalAmountUnit;//合同金额单位
@property(nonatomic,strong)NSString *clueNum;//线索
@property(nonatomic,strong)NSString *customerNum;//客户数量
@property(nonatomic,strong)NSString * bussOppNum;//商机数量
@property(nonatomic,strong)NSString *traceRecordNum;//写跟进次数记录
@property(nonatomic,strong)NSString * signInNum;//拜访签到次数

@end
@interface AssessmentTargetDataList : NSObject

@property(nonatomic,strong)NSString * name;
@property(nonatomic,assign)NSInteger code;
@property(nonatomic,strong)NSString *remark;
@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,assign)NSInteger pid;

@end
@interface IdentifierDataList : NSObject

@property(nonatomic,strong)NSString * name;
@property(nonatomic,assign)NSInteger code;
@property(nonatomic,strong)NSString *remark;
@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,assign)NSInteger pid;

@end
@interface TimeScopeDataList : NSObject

@property(nonatomic,strong)NSString * name;
@property(nonatomic,assign)NSInteger code;
@property(nonatomic,strong)NSString *remark;
@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,assign)NSInteger pid;


@end

////////////////////////////////////////////////搜索///////////////////////////////////////////////
@interface BusinessJsonArray : NSObject
//商机
@property(nonatomic,strong)NSString * businessName;
@property(nonatomic,strong)NSString *companyCustomerName;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *sourceId;
@property (nonatomic, strong) NSString * salesAmount;

@end
@interface ClueJsonArray : NSObject
//线索
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString *companyName;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *sourceId;
@property (nonatomic, strong) NSString * mobilePhone;

@end
@interface ContactsJsonArray : NSObject
//联系人
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString *customerCompanyName;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *sourceId;
@property (nonatomic, strong) NSString * mobilePhone;


@end
@interface CustomerJsonArray : NSObject
//客户
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString *customerLevel;
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *sourceId;
@property (nonatomic, strong)NSString * telphone;




@end
