

/**
 *  网络请求的相关宏定义
 */

#define NETWORK_TIMEOUT 20//通用的超时时间，20秒

#define URI_MAIN (@"http://api.sinoyjlm.com/")//主站URL

//注册

#define registerCode @"sms/registerCode"//获取验证码
#define Register       @"members/create"
#define Login       @"auth"
#define NearVillage  @"villages/getNearVillage"

#define resetPasswd @"sms/resetPasswd"//获取验证码
#define forgetPassword @"members/forgetPassword"//忘记密码


//资讯页面
#define InforVillage_AppButton      @"appbtns/getAppBtnByVillage" //首页按钮
#define InforVillage_Carousel       @"advs/getV1cAdvByVillage"//轮播图
#define InforVillage_Notice         @"notices/getTopNotice"//重要资讯
#define InforVillage_ArticleCate    @"articleCates/getArticleCateByVillage" //数据列表
#define InforVillage_List           @"articles/getArticleListByCate" //小区分类数据
#define InforVillage_AD             @"advs/getV1sAdvByVillage" //资讯广告

#define infoArt_categray            @"articleCates/child" //某个文章分类
#define infoArt_categray_list       @"infoArt_categray_list" //某个文章分类的列表
#define infoArt_articles            @"articles"//文章详情

//互动
#define inter_FourmBtn              @"appbtns/getFourmBtnByVillage" //互动按钮
#define inter_Village_Carousel      @"advs/getV3cAdvByVillage"//互动轮播图
#define inter_topics                @"topics"//互动话题列表
#define inter_postList                @"posts/getPosts"//互动帖子列表
#define inter_NearPostList                @"posts/getPostsByKm"//互动附近帖子列表

//code规则（post接口之后加的安全方面的认证协议）
#define kCodeVersion  @"versionkey"
#define kCodeFunction @"functionkey"
#define kCodeUid      @"uidkey"
#define kCodeString   @"stringkey"
#define kCodeDate     @"datekey"

#define RSA_Public_key @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC32+7G3WWNP/BOyMQ9Rw8OBmI0q2LO0jbqQMDugfTnL/R3JNZthIZAi/bIKjeehjTFJrziSgkl6rPgd5ReVn51vl4Kgabb939nncDdqmO+Escw3cARzu+wiR6guHdaEs82Zgc2Unql9MMU4NOpyAaCCLxEy1ktKLdug9P26BzOWwIDAQAB"

//*************************************************************接口函数名称*********************************************************************//

#define URI_LaunchesAd                  (@"newVersionAd")//广告

//-------------------------------------------------------------论坛首页Host--------------------------------------------------------------------//
#define URI_Forum_Host                                (@"bbsForum")//论坛首页--论坛板块
#define URI_Forum_Host_ModularRecommend               (@"bbsRecommend")//论坛首页--推荐模块
#define URI_Forum_Host_BBSRecommend                   (@"bbsThreadsList")///论坛首页--其余帖子模块
//*************************************************************请求回调参数code*********************************************************************//
#define CODE_SUCCESS        1
#define NETWORK_ERROR_NOTREACHABLE      -103//无网络
#define NETWORK_ERROR_CANCELED     -102//用户取消
#define NETWORK_ERROR_FORMAT     -101//JSON格式错误
#define NETWORK_ERROR_DATA     -100//JSON数据不存在
