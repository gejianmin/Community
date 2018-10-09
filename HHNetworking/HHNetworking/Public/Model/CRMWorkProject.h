//
//  CRMWorkProject.h
//  HHNetworking
//
//  Created by tongda ju on 2017/5/27.
//  Copyright © 2017年 HHAuto. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ClueModel,WorkSelecteModel,InsertModel,ClueListModel,ClueRraceRecordFile;

@interface CRMWorkProject : NSObject

@property (nonatomic, strong) ClueModel * clueModel;
@property (nonatomic, strong) WorkSelecteModel * workSelecteModel;


@end

@interface WorkProductModelCopy : NSObject

//获取产品列表
//2	id	string	true	产品ID
//2	name	string	true	产品名称
//2	standardPrice	string	true	标准价格
//2	salesUnit	string	true	销售单位
//2	unitCost	string	true	单位成本
//2	productImg	string	true	产品图片地址
//2	productDescription	string	true	产品介绍
//2	grossMargin	string	true	毛利率
//2	createTime	number	true	创建时间
//2	createTimeShow	string	true	创建时间：格式"yyyy-MM-dd HH:mm:ss"

@property (nonatomic,strong) NSString * ZDID;
@property (nonatomic,strong) NSString * name;//产品名称
@property (nonatomic,strong) NSString * standardPrice;//标准价格
@property (nonatomic,strong) NSString * salesUnit;//销售单位( 即公司)
@property (nonatomic,strong) NSString * unitCost;//单位成本
@property (nonatomic,strong) NSString * productImg;//产品图片地址
@property (nonatomic,strong) NSString * productDescription;//产品介绍
@property (nonatomic,strong) NSString * grossMargin;//毛利率
@property (nonatomic,strong) NSString * createTime;//创建时间
@property (nonatomic,strong) NSString * createTimeShow;//创建时间：格式"yyyy-MM-dd HH:mm:ss"

//获取某个商机附属产品列表
//2	productId	string	true	产品ID
//2	name	string	true	产品名称
//2	standardPrice	string	true	标准价格
//2	saleNumber	string	true	销售数量
//2	salesPrice	string	true	销售价格
//2	discount	string	true	折扣
//2	salesTotal	string	true	销售总价
//"productId": "1a1f4eeb1fd8be97f00f77f5c2c1144d",
//"name": "产品1",
//"standardPrice": "125.15",
//"discount": "无折扣",
//"salesPrice": "125.15",
//"saleNumber": "10",
//"salesTotal": "1251.5"


@property (nonatomic,strong) NSString * productId;//产品ID
//@property (nonatomic,strong) NSString * ZDID;
//@property (nonatomic,strong) NSString * name;//产品名称
//@property (nonatomic,strong) NSString * standardPrice;//标准价格
@property (nonatomic,strong) NSString * salesPrice;//销售单价
@property (nonatomic,strong) NSString * saleNumber;//销售数量
@property (nonatomic,strong) NSString * discount;//折扣
@property (nonatomic,strong) NSString * salesTotal;//销售总价

@property (nonatomic,strong) NSString * businessId;//商机ID

@end

@interface ClueModel : NSObject
////////////////////基本信息
@property (nonatomic, strong)NSString * number;//客户编号
@property (nonatomic, strong)NSString * name;//姓名
@property (nonatomic, strong)NSString * companyName;//公司名称
@property (nonatomic, strong)NSString * followStatus;//跟进状态
@property (nonatomic, strong)NSString * cooperativeBusiness;//合作业务
@property (nonatomic, strong)NSString * mobilePhone;//手机号码
@property (nonatomic, strong)NSString * department;//部门
@property (nonatomic, strong)NSString *userDepartmentName;//所属部门
@property (nonatomic, strong)NSString *post;//职务
@property (nonatomic, strong)NSString *sex;//性别
@property (nonatomic, strong)NSString * sourceId;//
@property (nonatomic, strong)NSString * createTime;//
////////////////联系信息
@property (nonatomic, strong)NSString *telePhone;//电话
@property (nonatomic, strong)NSString *email;//电子邮箱
@property (nonatomic, strong)NSString *qq;//个人QQ
@property (nonatomic, strong)NSString *province;
@property (nonatomic, strong)NSString *city;//所在地区
@property (nonatomic, strong)NSString *address;//详细地址
@property (nonatomic, strong)NSString *postcode;//邮政编码
@property (nonatomic, strong)NSString *clueSource;//线索来源
@property (nonatomic, strong)NSString *remarks;//备注
//负责人信息
@property (nonatomic, strong)NSString *userName;//线索负责人 &&（我方签约人）
@property (nonatomic, strong)NSString *userDepartment;//所属部门ID
@property (nonatomic, strong)NSString *userId;//线索负责人 &&（我方签约人）

//ID
@property (nonatomic, strong)NSString *updateUser;//修改人ID
@property (nonatomic, strong)NSString *createUser;//创建人ID
//code
@property (nonatomic, strong)NSString *clueSourceCode;//线索负责人
@property (nonatomic, strong)NSString *countyCode;//所属部门
@property (nonatomic, strong)NSString *followStatusCode;//线索负责人
@property (nonatomic, strong)NSString *cooperativeBusinessCode;//所属部门
@property (nonatomic, strong)NSString *provinceCode;//线索负责人
@property (nonatomic, strong)NSString *sexCode;//所属部门
@property (nonatomic, strong)NSString *cityCode;//线索负责人
@property (nonatomic, strong)NSString *appTimeScopeCode;//所属部门

//ZD 添加(联系人)
@property (nonatomic, strong)NSString *customerCompanyName;//客户名称
/** 已被选择 1.已被选择 2.未被选择 */
@property (nonatomic,strong) NSString * isSelected;
//@property (nonatomic, strong)NSString *sexCode;//性别码
@property (nonatomic, strong)NSString *wechat;//微信
@property (nonatomic, strong)NSString *provinceName;//省名字
@property (nonatomic, strong)NSString *cityName;//市名字
@property (nonatomic, strong)NSString * updateUserName;//负责人名字
#pragma mark - 客户
@property (nonatomic, strong)NSString * telphone;
@property (nonatomic, strong)NSString * customerLevel;//水平
@property (nonatomic, strong)NSString * customerLevelCode;//
@property (nonatomic, strong)NSString *industry;//行业
@property (nonatomic, strong)NSString * industryCode;
@property (nonatomic, strong)NSString * workerTotal;//人数
@property (nonatomic, strong)NSString * salesVolume;//销售额
@property (nonatomic, strong)NSString * phone;//电话
@property (nonatomic, strong)NSString * fax;//传真
@property (nonatomic, strong)NSString * companyWebsite;//网址
#pragma mark - 联系人
#pragma mark - 商机
@property (nonatomic, strong)NSString * salesPhase;//销售阶段
@property (nonatomic, strong)NSString * salesPhaseCode;//
@property (nonatomic, strong)NSString * salesAmount;//销售金额
@property (nonatomic, strong)NSString * businessName;//商机名称
@property (nonatomic, strong)NSString * companyCustomerName;//客户名称
@property (nonatomic, strong)NSString * closingTime;//结单日期
@property (nonatomic, strong)NSString * contactsName;//联系人名称
@property (nonatomic, strong)NSString * contactsId;//联系人ID
@property (nonatomic, strong)NSString * opportunitySource;//商机来源
@property (nonatomic, strong)NSString * opportunitySourceCode;//
@property (nonatomic, strong)NSString * opportunityType;//商机类型
@property (nonatomic, strong)NSString * opportunityTypeCode;

@property (nonatomic, strong) NSString * productNumber;//产品数量


#pragma mark - 合同
@property (nonatomic, strong)NSString * contractName;//
@property (nonatomic, strong)NSString * createTimeShow;//创建时间
@property (nonatomic, strong)NSString * contractAmount;//合同金额
@property (nonatomic, strong)NSString * showCustomerName;//合同的客户名称
@property (nonatomic, strong)NSString * notPaymentAmount;//合同的未回款金额
@property (nonatomic, strong)NSString * opportunityName;//商机名称=销售机会
@property (nonatomic, strong)NSString * opportunityId;//销售机会ID
@property (nonatomic, strong)NSString * startTimeShow;//开始时间
@property (nonatomic, strong)NSString * endTimeShow;//结束时间
@property (nonatomic, strong)NSString * contractTypeShow;//合同类型
@property (nonatomic, strong)NSString * contractType;//合同类型ID
@property (nonatomic, strong)NSString * signingTimeShow;//签约时间
@property (nonatomic, strong)NSString * contractStatusShow;//合同状态
@property (nonatomic, strong)NSString * contractStatus;//合同状态ID
@property (nonatomic, strong)NSString * payTypeShow;//付款方式
@property (nonatomic, strong)NSString * payType;//付款方式ID
@property (nonatomic, strong)NSString * contractCode;//合同编号
@property (nonatomic, strong)NSString * customerName;//客方签约人
//@property (nonatomic, strong)NSString * userName;//我方签约人
@property (nonatomic, strong) NSString * leadingName;


@property (nonatomic, strong) NSMutableArray <WorkProductModelCopy *>* productList;//产品列表

#pragma mark - 合同回款
@property (nonatomic, strong)NSString * paymentAmount;//回款金额
@property (nonatomic, strong)NSString * paymentTimeShow;//回款时间
@property (nonatomic, strong)NSString * payTypeCode;//付款方式
@property (nonatomic, strong)NSString * contractId;//合同ID

@end
@interface WorkSelecteModel : NSObject

//@property (nonatomic, assign)NSInteger code;
@property (nonatomic, strong)NSString * code;
//@property (nonatomic, assign)NSInteger Id;
@property (nonatomic, assign)NSInteger pid;
@property (nonatomic, strong)NSString * vo_name;
@property (nonatomic, strong)NSString * voice;
@property (nonatomic, strong)NSString * Id;


@end
@interface InsertModel : NSObject
//@property (nonatomic, assign)NSInteger code;
@property (nonatomic, strong)NSString * code;
@property (nonatomic, assign)NSInteger Id;
@property (nonatomic, assign)NSInteger pid;
@property (nonatomic, strong)NSString * name;
@property (nonatomic, strong)NSString * remark;

@end

@interface ClueListModel : NSObject

@property (nonatomic, strong) NSString * headUrl;
@property (nonatomic, strong)NSString * userName;//负责人
@property (nonatomic, strong)NSString * recordSourceChinese;//来自
@property (nonatomic, strong)NSString * recordSourceName;//(来自内容)
@property (nonatomic, strong)NSString * recordTypeChinese;//来自类型
@property (nonatomic, strong)NSString * recordText;//内容
@property (nonatomic, strong)NSString * position;//地址
@property (nonatomic, strong)NSString * recordSourceId;//线索ID
@property (nonatomic, strong)NSString * createTimeShow;//创建时间
@property (nonatomic, strong) NSArray *traceRecordFileArray;//图片数组
@property (nonatomic, strong)NSString * traceRecordId;//


@property (nonatomic, strong) NSArray <ClueRraceRecordFile *>*traceRecordFile;//图片数组

@end
@interface ClueRraceRecordFile : NSObject

@property (nonatomic, strong)NSString * fileUrl;//图片名称

@end
