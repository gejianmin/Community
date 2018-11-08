//
//  ChangePasswordVC.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/10.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "ChangePasswordVC.h"
#import "RegisterRequest.h"
@interface ChangePasswordVC ()

@property (weak, nonatomic) IBOutlet UIButton *authCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *theNewPWTF;
@property (weak, nonatomic) IBOutlet UITextField *makeSurePWTF;

@end

@implementation ChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor = kColorGray9;
}

#pragma mark  --- 获取验证码
- (IBAction)authCodeBtnClick:(UIButton *)sender {
   
    // 判断手机号是否填写正确
    BOOL isPhone = [NSObject checkTelNumber:self.phoneNumTF.text];
    if (isPhone) {
        // 可以获取验证码
        RegisterRequest *request = [[RegisterRequest alloc]init];
        [request setUserforgotPasswordGetCodeWith:self.phoneNumTF.text];
        [request setFinishedBlock:^(id object, id responseData) {
            HHLog(@"获取验证码成功");
            
        } failedBlock:^(NSInteger error, id responseData) {
            
        }];
    }
    [self openCountdown];
    
    
}

// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.authCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.authCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.authCodeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.authCodeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.authCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.authCodeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark --- 提交服务器
- (IBAction)conmitBtnClick:(UIButton *)sender {
    
    // 校验四处均不为空
    if (!kStringIsEmpty(self.phoneNumTF.text) &&
        !kStringIsEmpty(self.codeTF.text) &&
        !kStringIsEmpty(self.theNewPWTF.text) &&
        !kStringIsEmpty(self.makeSurePWTF.text)) {
        
        // 新密码和确认密码一致
        if ([self.theNewPWTF.text isEqualToString:self.makeSurePWTF.text]) {
            [self showHUDText:nil];
            RegisterRequest *request = [[RegisterRequest alloc]init];
            [request setUserRegisterWith:self.phoneNumTF.text code:self.codeTF.text password:self.theNewPWTF.text cpassword:self.makeSurePWTF.text];
            [request setFinishedBlock:^(id object, id responseData) {
                [self hideHUD];
                [self showToastHUD:@"修改成功" complete:^{
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                
                
            } failedBlock:^(NSInteger error, id responseData) {
                [self showToastHUD:@"修改失败"];
            }];
            
        }else{
            [self showToastHUD:@"两次密码不一致"];
        }
        
    }else{
        [self showToastHUD:@"请填写完整信息"];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
