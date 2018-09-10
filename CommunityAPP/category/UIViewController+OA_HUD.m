//
//  UIViewController+OA_HUD.m
//  JTDOASystem
//
//  Created by 王帅宇 on 2018/7/6.
//  Copyright © 2018年 JuTongDa Technology. All rights reserved.
//

#import "UIViewController+OA_HUD.h"
#import <MBProgressHUD.h>
#import <objc/runtime.h>

static NSString *hudWithSetterGetterKey = @"hudWithSetterGetterKey";

@interface UIViewController()

@property (nonatomic,strong) MBProgressHUD * hud;

@end
@implementation UIViewController (OA_HUD)


- (void)setHud:(MBProgressHUD *)hud {
    
    objc_setAssociatedObject(self, &hudWithSetterGetterKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, &hudWithSetterGetterKey);
}


/*!
 *  显示一个带有文字和菊花的HUD,需要手动hide
 */
- (void)showHUDText:(NSString *)text{
    
    if (self.hud==nil) {
        self.hud = [[MBProgressHUD alloc] initWithView:self.view];
        self.hud.mode = MBProgressHUDModeIndeterminate;
        //            self.hud.customView = [[UIImageView alloc]initWithImage:ImageNamed(@"PS_common_loading")];
    }
    self.hud.removeFromSuperViewOnHide=YES;
    self.hud.labelText=text;
    [self.view addSubview:self.hud];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.hud show:YES];
    });
    //    [LoadingView showCircleView:[[UIApplication sharedApplication]keyWindow]];
    
}
/*!
 *  影藏HUD,适用于不能自动影藏的HUD
 */
- (void)hideHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.hud hide:YES];
    });
    
    
}

- (void)showToastHUD:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText=text;
    hud.detailsLabelFont=[UIFont systemFontOfSize:15.0];
    hud.opacity=0.8;
    hud.margin = 15.f;
    [hud hide:YES afterDelay:1];
}
/*!
 *  显示一个不带菊花的提示性HUD,自动hide
 *  如果迭代多个则按队列出现和影藏
 */
- (void)showToastHUD:(NSString *)text complete:(void (^)(void))complete{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText=text;
    hud.detailsLabelFont=[UIFont systemFontOfSize:15.0];
    hud.opacity=0.8;
    hud.margin = 15.f;
    [hud hide:YES afterDelay:2];
    hud.completionBlock=^(){
        if (complete) {
            complete();
        }
    };
    
    
}
- (void)showSuccessToast:(NSString *)text complete:(void (^)(void))complete{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText=text;
    hud.detailsLabelFont=[UIFont systemFontOfSize:15.0];
    hud.opacity=0.8;
    hud.margin = 15.f;
    hud.removeFromSuperViewOnHide = YES;
    
    UIImageView *cusview=[[UIImageView alloc] init];
    cusview.image=[UIImage imageNamed:@"smile_aio_default"];
    cusview.frame=CGRectMake(0, 0, 69, 69);
    hud.customView=cusview;
    [hud hide:YES afterDelay:2];
    
    hud.completionBlock=^(){
        if (complete) {
            complete();
        }
    };
    
    
    
}
- (void)showFailToast:(NSString *)text complete:(void (^)(void))complete{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText=text;
    hud.detailsLabelFont=[UIFont systemFontOfSize:15.0];
    hud.opacity=0.8;
    hud.margin = 15.f;
    hud.removeFromSuperViewOnHide = YES;
    
    UIImageView *cusview=[[UIImageView alloc] init];
    cusview.image=[UIImage imageNamed:@"smile_aio_default_failed"];
    cusview.frame=CGRectMake(0, 0, 69, 69);
    hud.customView=cusview;
    [hud hide:YES afterDelay:2];
    
    hud.completionBlock=^(){
        if (complete) {
            complete();
        }
    };
}

@end
