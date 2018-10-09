//
//  MPServerConfig.h
//  Networking
//
//  Created by tongda ju on 2017/8/10.
//  Copyright © 2017年 Auto. All rights reserved.
//

#ifndef MPServerConfig_h
#define MPServerConfig_h

#pragma mark - server
/**
 *  用于切换服务器环境，只需修改此处宏值即可
 *  如果新增服务器环境，需要添加环境定义，并且在下面宏条件语句中添加条件分支，并且修改主机域名值
 *  如果修改服务器环境，则只在宏条件里面修改具体对应环境的值
 */

#define MP_CUR_SERVER_CONFIG   MP_SERVER_DEV /* 当前服务器环境,如需切换则改 */


/**
 *  服务器环境类型值
 *  新增或删除的同时也需同步修改条件判断
 */

#define MP_SERVER_DEV      1001 //开发环境

#define MP_SERVER_QA       1002 //测试环境

#define MP_SERVER_UAT      1003 //UAT

#define MP_SERVER_RELEASE  2001 //正式环境


/**
 *  根据 CUR_SERVER_CONFIG 判断当前服务器该选择哪一主机
 *  具体根据服务器类型值判断，需要和服务器类型值一一对应
 */
#   if (MP_CUR_SERVER_CONFIG == MP_SERVER_DEV) /* 开发环境服务器 */
//http://oaapp-api.rmw001.com
static NSString * const kDefaultBaseURLString = @"http://api.sinoyjlm.com/";/*!< BASEURL*/

#define kDefaultBaseURL  kDefaultBaseURLString /*BASEURL*/

#define kDefaultBaseURL_HTML5  @"http://oa-test.rmw001.com/dist/#/pages/home" /*针对H5*/

#define kDefaultBaseURL_HTML5_B  @"http://oa-test.rmw001.com/dist/" /*针对H5*/

#define kOABridgingTelephone_URL  @"http://callcenter.rmw001.cn/" /*桥接电话*/
//http://freeswitch.dial.weiyingjia.org/


#   elif (MP_CUR_SERVER_CONFIG == MP_SERVER_QA) /* 测试环境 */


#   elif (MP_CUR_SERVER_CONFIG == MP_SERVER_UAT)/* UAT */


#   else /* 正式线上版本 */

static NSString * const kDefaultBaseURLString = @"https://api.qc600.cn";
static NSString * const ALiYunUrlPath = @"hhttp://oss-cn-beijing.aliyuncs.com/";
#define kDefaultBaseURL_HTML5  @"http://pet.weiyingjia.org"/*针对H5*/
#define kDefaultWebTestURLString  @"https://api.qc600.cn"/*除支付外其他web接口*/



static NSString *JPush_appKey = @"e53bf9e55e83822c47c4bc0f";


#   endif

#endif /* MPServerConfig_h */


/** 配置信息
主机域名
图片域名
部分页面的web链接域名
账号 涉及到开发和线上环境有区别的
 */


