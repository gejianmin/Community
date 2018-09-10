//
//  HHValidateButton.m
//  CRMSystemClient
//
//  Created by tongda ju on 2017/5/12.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import "HHValidateButton.h"

static NSString  * const GSAContent_login_codeGet = @"获取验证码";
@interface HHValidateButton ()


/** 保存倒计时按钮的非倒计时状态的title */
@property (nonatomic, copy) NSString *originalTitle;
/** 保存倒计时的时长 */
@property (nonatomic, assign) NSInteger tempDurationOfCountDown;
/** 定时器对象 */
@property (nonatomic, strong) NSTimer *countDownTimer;

@end
@implementation HHValidateButton
// 重写setter
//title属性的setter
//1）、私有属性originalTitle用来暂存开始计时前button的标题，即用户设置的button的标题，通常是“获取验证码”
//2）、需要屏蔽计时过程中，title更新时改变originalTitle的值
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    // 倒计时过程中title的改变不更新originalTitle
    if (self.tempDurationOfCountDown == self.durationOfCountDown) {
        self.originalTitle = title;
    }
}
//durationOfCountDown属性的setter
//1）、设置tempDurationOfCountDown的值
//2）、tempDurationOfCountDown的作用：倒计时；与durationOfCountDown配合判断当前IDCountDownButton是否具备重新开始倒计时的能力
- (void)setDurationOfCountDown:(NSInteger)durationOfCountDown {
    _durationOfCountDown = durationOfCountDown;
    self.tempDurationOfCountDown = _durationOfCountDown;
}
//初始化
//1）、设置倒计时的默认时长为60妙
//2）、设置IDCountDownButton默认的title为“获取验证码”
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置默认的倒计时时长为60秒
        self.durationOfCountDown = 60;
        // 设置button的默认标题为“获取验证码”
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setTitleColor:kColorWhite forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updatePhoneNub:) name:@"updatePhoneNub" object:nil];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // 设置默认的倒计时时长为60秒
        self.durationOfCountDown = 60;
        // 设置button的默认标题为“获取验证码”
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    return self;
}
//拦截IDCountDownButton的点击事件，判断是否开始倒计时
//1）、若tempDurationOfCountDown等于durationOfCountDown，说明未开始倒计时，响应并传递IDCountDownButton的点击事件；否则，不响应且不传递。
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    if ([self isValiMobile:self.phoneNumber] == NO ) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"showerror" object:nil];
        return NO;
    }
    // 若正在倒计时，不响应点击事件
    if (self.tempDurationOfCountDown != self.durationOfCountDown) {
        return NO;
    }
//    [self getCaptcha];
    // 若未开始倒计时，响应并传递点击事件，开始倒计时
    [self startCountDown];
    
    
    return [super beginTrackingWithTouch:touch withEvent:event];
    
}
//倒计时
//1）、创建定时器，开始倒计时
- (void)startCountDown {
    // 创建定时器
    self.countDownTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateIDCountDownButtonTitle) userInfo:nil repeats:YES];
    // 将定时器添加到当前的RunLoop中（自动开启定时器）
    [[NSRunLoop currentRunLoop] addTimer:self.countDownTimer forMode:NSRunLoopCommonModes];
}
//2）、更新IDCountDownButton的title为倒计时剩余的时间
- (void)updateIDCountDownButtonTitle {
    if (self.tempDurationOfCountDown == 0) {
        // 设置IDCountDownButton的title为开始倒计时前的title
        [self setTitle:self.originalTitle forState:UIControlStateNormal];
        [self setTitleColor:kColorWhite forState:UIControlStateNormal];
        // 恢复IDCountDownButton开始倒计时的能力
        self.tempDurationOfCountDown = self.durationOfCountDown;
        [self.countDownTimer invalidate];
    } else {
        // 设置IDCountDownButton的title为当前倒计时剩余的时间
        [self setTitle:[NSString stringWithFormat:@"%zd秒后重试", self.tempDurationOfCountDown--] forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        //        [self getCaptcha];
    }
}
- (void)updatePhoneNub: (NSNotification *)noti {
    
    self.phoneNumber = noti.object;
}
//3）、移除定时器
- (void)dealloc {
    
    [self.countDownTimer invalidate];
}
//- (void)getCaptcha {
//    
//    [[HHClient sharedInstance].authSession asyncFetchVerifyCodeWithPhone:self.phoneNumber complete:^(id response, HHError *error) {
//        if (error) {
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"showerror" object:nil];
//            
//        }else{
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"showeSuccess" object:nil];
//        }
//    }];
//    
//    
//}

@end



@implementation HHCaptchaButton
#define time 60
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.duration=time;
        self.titleLabel.font=kFont18;
        [self setTitle:GSAContent_login_codeGet forState:UIControlStateNormal];
        [self setTitleColor:kColorWhite forState:UIControlStateNormal];
        [self setTitleColor:kColorWhite forState:UIControlStateDisabled];
        
    }
    return self;
}
-(void)startTimer{
    [self stopTimer];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0/255.0, 0/255.0, 0/255.0, 0 });
    [self.layer setBorderColor:colorref];//边框颜色
//    self.backgroundColor = HEXCOLOR(0x68707e, 1);
    self.backgroundColor = kColorRed;

    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChangeAction:) userInfo:nil repeats:YES];
}
- (void)timerChangeAction:(NSTimer *)timer{
    if (self.duration>0) {//计时中。。。
        [self setTitle:[NSString stringWithFormat:@"%lds",(long)self.duration] forState:UIControlStateDisabled];
        self.duration--;
//        self.backgroundColor = kColorGray7;
        
    }else{//计时结束
        [timer invalidate];
        _timer=nil;
        if ([self.delegate respondsToSelector:@selector(captchaButtonDurationExpire:)]) {
            [self.delegate captchaButtonDurationExpire:self];
        }
        self.duration=time;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 250/255.0, 0/255.0, 0/255.0, 1 });
        [self.layer setBorderColor:colorref];//边框颜色
//        self.backgroundColor = RGBACOLOR(0/255.0, 0/255.0, 0/255.0, 0);

        self.backgroundColor = kColorWhite;
        self.enabled = YES;
        [self setTitle:@"重新发送" forState:UIControlStateNormal];
        [self setTitle:@"重新发送" forState:UIControlStateDisabled];
        
        
 
        
    }
    
}
-(void)stopTimer{
    [_timer invalidate];
    _timer=nil;
    self.duration=time;
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];

}
-(void)removeFromSuperview{
    [super removeFromSuperview];
    [self stopTimer];
}


@end
