//
//  JTDSocialShare.m
//  SwishChargeClient
//
//  Created by tongda ju on 2017/11/7.
//  Copyright © 2017年 JianMin Ge. All rights reserved.
//

#import "JTDSocialShare.h"
#import <UMShare/UMShare.h>    // 分享组件
#import <UShareUI/UShareUI.h>

@implementation JTDSocialShare

+(instancetype)ShareUMSocial{
    
    static JTDSocialShare *socia;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        socia = [[JTDSocialShare alloc]init];
        
    });
    return socia;
}
-(void)setShareContentModel:(JTDShareContent *)shareContentModel{
    _shareContentModel = shareContentModel;
    shareContentModel.shareURL=[NSString stringWithFormat:@"%@",@"www.baidu.com"];
    shareContentModel.shareTitle=[NSString stringWithFormat:@"%@",shareContentModel.name];
    shareContentModel.shareContent = shareContentModel.centent?:@" ";
    UIImageView * simage = [[UIImageView alloc]init];
    [simage sd_setImageWithURL:nil placeholderImage:ImageNamed(@"icon")];
    shareContentModel.shareImage=simage.image;
}
#pragma mark--分享
- (void)showSocialWithTag:(NSInteger)tag{
    
    if (self.shareContentModel==nil) {
        
        //        self.shareContentModel=[HHShareContent fualCardShareMode];
    }
    NSArray *snsArray = @[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Qzone),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)];
    
    UMShareWebpageObject *shareObject=[UMShareWebpageObject shareObjectWithTitle:self.shareContentModel.shareTitle descr:self.shareContentModel.shareContent thumImage:self.shareContentModel.shareImage];
    
    shareObject.webpageUrl=self.shareContentModel.shareURL;
    
    
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    messageObject.shareObject = shareObject;
    
    [[UMSocialManager defaultManager] shareToPlatform:[snsArray[tag - 1000] integerValue] messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        if (!error) {
            if ([result isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = result;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                [self sharedSuccessHandle];
                
            }else{
                UMSocialLogInfo(@"response data is %@",result);
            }
        }else{
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }
    }];
}
#pragma mark--登录
- (void)getUserInfoWithController:(UIViewController *)controller withTag:(NSInteger)tag callBack:(UMGetUserInfoCompleteBlock)callBack{
    self.callBack = callBack;
    NSArray *snsArray = @[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_Sina)];
    JTDWeakSelf
    [[UMSocialManager defaultManager]getUserInfoWithPlatform:[snsArray[tag - 1000] integerValue] currentViewController:controller completion:^(id result, NSError *error) {
        HHLog(@"error====%@",error);
        if (error) {
            UMSocialLogInfo(@"************ fail with error %@*********",error);
            if (WeakSelf.callBack) {
                WeakSelf.callBack(NO,nil);
            }
        }else{
            HHLog(@"回调成功!!!!");
            if ([result isKindOfClass:[UMSocialUserInfoResponse class]]) {
                UMSocialUserInfoResponse *resp = result;
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                JTDUserInfoModel * model = [[JTDUserInfoModel alloc]init];
                model = (JTDUserInfoModel *)resp;
                
                if (WeakSelf.callBack) {
                    WeakSelf.callBack(YES,model);
                }
            }else{
                if (WeakSelf.callBack) {
                    WeakSelf.callBack(NO,nil);
                }
                UMSocialLogInfo(@"response data is %@",result);
            }
        }
    }];
}

- (void)sharedSuccessHandle{
    
    //    NSNotification * share = [NSNotification notificationWithName:kUMengShareNotification object:nil userInfo:nil];
    //    [[NSNotificationCenter defaultCenter]postNotification:share];
    [[NSNotificationCenter defaultCenter] postNotificationName:kUMengShareNotification object:nil];
    
}

@end

@implementation JTDShareContent


//+(JTDShareContent *)newShareModel{
//    JTDShareContent *model=[[JTDShareContent alloc] init];
//        model.shareURL=[NSString stringWithFormat:@"%@?uid=%@&d_id=%@",kDefaultBaseURL,[[[HHClient sharedInstance]user]userId],model.d_Id];
////    model.shareURL=[NSString stringWithFormat:@"=%@",@"www.baidu.com"];
//    model.shareTitle=@"蜜糖折扣-给你意想不到的甜蜜折扣";
//    model.shareContent=@"亲爱的，我一直在使用蜜糖折扣，有好多物美价廉的商品，充值话费流量也有折扣哦，快去看看吧～";
//    model.shareImage=ImageNamed(@"logo");
//    return model;
//}
@end

@implementation JTDUserInfoModel



@end
