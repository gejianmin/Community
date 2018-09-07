//
//  HHValidateButton.h
//  CRMSystemClient
//
//  Created by tongda ju on 2017/5/12.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - HHValidateButton
@interface HHValidateButton : UIButton

@property (nonatomic, assign) NSInteger durationOfCountDown;
@property (nonatomic, copy) NSString *phoneNumber;

@end


#pragma mark - HHCaptchaButtonDelegate
@class HHCaptchaButton;
@protocol HHCaptchaButtonDelegate <NSObject>

@optional
- (void)captchaButtonDurationExpire:(HHCaptchaButton  *)button;

@end


#pragma mark -- HHCaptchaButton
@interface HHCaptchaButton : UIButton{
    NSTimer *_timer;
}
@property (nonatomic, assign) NSInteger duration;//default 60s
@property (nonatomic, weak) id <HHCaptchaButtonDelegate>delegate;
- (void)startTimer;
- (void)stopTimer;

@end
