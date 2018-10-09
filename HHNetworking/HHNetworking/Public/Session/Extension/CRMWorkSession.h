//
//  CRMWorkSession.h
//  HHNetworking
//
//  Created by tongda ju on 2017/5/27.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CRMWorkSession <NSObject>

@optional
#pragma mark 线索相关--------------------------------------------
/*! @method 线索 筛选
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetClueListwithpramas:(NSMutableDictionary*)pramas
                                           complete:(HHSessionCompleteBlock)complete;
/*! @method 线索选项卡
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkCodesWithPramas:(NSString *)codeStr complete:(HHSessionCompleteBlock)complete;

/*! @method 线索创建人，负责人选项卡
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetUserCodesWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 线索部门选项卡
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetDepartmentCodesWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 线索写跟进记录
 *  traceRecord/addTraceRecord
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkaddTraceRecordWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 销售动态
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetListTraceRecordWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 单个线索信息
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetClueListInformationWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除跟进记录
 *traceRecord/deleteTraceRecord
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetCluedeleteTraceRecordWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除线索
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetCluedeleteWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 搜索线索
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetClueSearchdWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 修改线索
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetClueUpdateWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 线索转客户
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetClueBecomeCustomerWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 线索转他人
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetClueBecomeOthersWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

#pragma mark 客户相关--------------------------------------------
/*! @method 客户列表
 *  @phone
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncGetWorkCustomerlistWithpramas:(NSMutableDictionary*)pramas
                                            complete:(HHSessionCompleteBlock)complete;
/*! @method 单个客户信息
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetCustomerListInformationWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 客户转他人
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetCustomerBecomeOthersWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除客户
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetCustomerdeleteWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 搜索客户
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetCustomerSearchWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
#pragma mark 联系人相关--------------------------------------------
/*! @method 联系人列表
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetContactsListContactsWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除联系人
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkContactsDeleteContactsWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 搜索联系人
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetContactsSearchContactsWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
#pragma mark 销售动态相关--------------------------------------------
/*! @method 商机列表
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetGetBusinessOpportunityListWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除商机
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkDeleteBusinessOpportunityWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 单个商机信息
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetBusinessOpportunityWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 商机转他人
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetBusinessOpportunityTransferToOthersWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 搜索商机
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetSearchBusinessOpportunityWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
#pragma mark 合同相关--------------------------------------------
/*! @method 合同列表
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkGetContractListContractWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除合同
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkContractDeleteContractWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 合同转移给他人
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkContractTransferToOthersWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 单个合同信息
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkkCRMGetContractInformationWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 搜索合同
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkkCRMGetContractSearchContractWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 合同回款列表
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictGetWorkGetlistContractPaymentWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除回款信息
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictDeleteContractPaymentWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除回款信息
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataUpdateContractPaymentWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
#pragma mark 工作公海相关--------------------------------------------

/*! @method 搜索公海
 *
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataOpenResourceSearchOpenResourceWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

#pragma mark 工作公共相关--------------------------------------------
/*! @method 负责人列表
 *  sys/getUser
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkCommonGetUserWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 新增提醒
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkCommonAddRemindWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 公共模块个数
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictWorkCommonCommongetNumberWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

#pragma mark 任务相关--------------------------------------------
/*! @method 获取任务列表、任务搜索接口
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationTaskSearchWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

/*! @method 获取任务数量
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationGetTaskNumberWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

/*! @method 获取单个任务的详情
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationGetTaskDetailInfomationWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

/*! @method 改变任务的状态（接收，拒绝，完成）
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationChangeTaskTypeWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 重新分配任务、修改任务
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationUpdateTaskTypeWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;

/*! @method 新增回复
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationAddReplayWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
/*! @method 删除回复
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationdeleteReplayWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;


/*! @method 删除某个任务
 *  AddRemind
 *  @pwd
 *  @reponse HHUser
 */
- (NSURLSessionDataTask *)asyncdataDictInfomationDeleteTaskWithPramas:(NSDictionary *)pramas complete:(HHSessionCompleteBlock)complete;
@end
