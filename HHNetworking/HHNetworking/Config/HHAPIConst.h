//
//  HHAPIConst.h
//  HHNetworking
//
//  Created by gejianmin on 16/7/11.
//  Copyright © 2016年 HHAuto. All rights reserved.
//

#ifndef HHAPIConst_h
#define HHAPIConst_h

#if DEBUG

#   define FMWLog(id, ...) NSLog((@"%s [Line %d] " id),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else

#   define FMWLog(id, ...)

#endif

#define HH_RESPONSE_CODE [response[@"Header"][@"StatusCode"] integerValue]
#define HH_RESPONSE_CODE_ERROR response[@"Header"][@"Message"] 

#define HH_RESPONSE_DATA response[@"Data"]

#define HH_RESPONSE_DATA_ERROR response[@"Data"][@"Message"]
#define HH_RESPONSE_DATA_CODE [response[@"Data"][@"Result"] boolValue]

#define HH_JSONSERIALIZER_ERROR @"数据解析出错"

#define HH_AUTH_TOKEN @"HHFinancialServiceToken"

#define RESPONSE_SUCCESS_CODE 200



static NSTimeInterval const kRequestTimeOut=30.f;

////////////////////////////////////////////////////////////
//MARK:OCR
static NSString * const kFaceID_APP_KEY=@"GFby91zhWmr4kV_NbXv4--ghTLpuzR3S";
static NSString * const kFaceID_APP_SECRET=@"a6UbU7dDdZFzXUFaPg7Rin-VLPn5rWOS";
static NSString * const kFacePlusOCRIDCard=@"https://api.faceid.com/faceid/v1/ocridcard";


static NSString * const kEditUserInfo = @"sys/editUserInfo";//个人信息编辑

#endif /* HHAPIConst_h */
