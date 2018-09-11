//
//  LoginViewController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/9.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterVC.h"
#import "ForgotPasswordVC.h"
#import "JTDSocialShare.h"
#import <AdSupport/AdSupport.h>
#import "LoginRequest.h"
#import "NearCommunityController.h"
#import "NavigationViewController.h"
#import "UserObjModel.h"
#import "HHClient.h"
@interface LoginViewController ()<LoginViewDelegate>
    
@property (nonatomic, strong) LoginView *logView;
    
@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =RGB(250, 250, 250);
    self.logView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.logView.delegate = self;
    [self.view addSubview:_logView];
    
    [self setBar];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancle)];
    [self.view addGestureRecognizer:tap];
}
- (void)cancle{
    [_logView.accountField resignFirstResponder];
    [_logView.passwordField resignFirstResponder];
}
#pragma mark--login
-(void)loginViewDidLoginWithAccount:(NSString *)account password:(NSString *)password{
    [self showHUDText:nil];
    LoginRequest * request = [[LoginRequest alloc]init];
    [request setUserLoignWith:account password:password];
    [request setFinishedBlock:^(id object, id responseData) {
        [self hideHUD];
        if(responseData){
            if([responseData[@"status"] isEqualToString:successCode]){
                UserObjModel * model = [UserObjModel yy_modelWithJSON:responseData[@"data"]];
                [[HHClient sharedInstance] setUser:model];
                [self loginSuccessEvent];
            }else if([responseData[@"status"] isEqualToString:failedCode]){
                [self showToastHUD:responseData[@"error"][@"message"] complete:nil];
            }
            
        }
        NSLog(@"responseData%@",responseData);
        //        tyself.model = object;
        //        [tyself fullData:tyself.model.communityArray];
        
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"%ld",error);
    }];
    
}
#pragma mark--注册，忘记密码，第三方登录
-(void)loginViewDidLogin:(UIButton *)loginButton{
    NSInteger  loginTag  = loginButton.tag;
    switch (loginTag) {
        case 1001://注册
        {
            [RegisterVC pushToRegisterViewController:self callBack:^(NSString *phone, NSString *password) {
                JTDWeakSelf
                WeakSelf.logView.accountField.text = phone;
                WeakSelf.logView.passwordField.text = password;
            }];
        }
        break;
        case 1002://忘记密码
        {
            [ForgotPasswordVC pushToForgotPasswordViewController:self callBack:^(NSString *phone, NSString *password){
                JTDWeakSelf
                WeakSelf.logView.accountField.text = phone;
                WeakSelf.logView.passwordField.text = password;
            }];
        }
        break;
        case 1003://微信登录
        {
            [[JTDSocialShare ShareUMSocial] getUserInfoWithController:self withTag:weChatLoginType callBack:^(BOOL success, JTDUserInfoModel *model) {
                if(success){
                    [self thirdLoginWith:model loginType:weChatLoginType];
                }else{
                    [self showToastHUD:@"登录异常" complete:nil];
                }
            }];
            
        }
        break;
        case 1004:
        {
            [self loginCancelEvent];
        }
        default:
        break;
    }
    
    
}
-(void)thirdLoginWith:(JTDUserInfoModel *)model loginType:(NSInteger )loginType{
    [self showHUDText:nil];
    JTDWeakSelf
    LoginRequest * request = [[LoginRequest alloc]init];
    [request setUserLoignWithThirdOpen_id:model.openid union_id:model.unionId];
    [request setFinishedBlock:^(id object, id responseData) {
        [self hideHUD];
        if(responseData){
            if([responseData[@"status"] isEqualToString:successCode]){
                UserObjModel * model = [UserObjModel yy_modelWithJSON:responseData[@"data"]];
                [[HHClient sharedInstance] setUser:model];
                [WeakSelf loginSuccessEvent];
            }else if([responseData[@"status"] isEqualToString:failedCode]){
                [WeakSelf showToastHUD:responseData[@"error"][@"message"] complete:nil];
            }
        }
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"%ld",error);
    }];
}
-(NSString *)getIdentifiesSting{
    
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString * adis = [adId stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return adis;
}

//- (void)goToNearCommunity{
//    NearCommunityController *tabVC = [[NearCommunityController alloc] init];
//    NavigationViewController *navi = [[NavigationViewController alloc]initWithRootViewController:tabVC];
//    navi.navigationBar.hidden = YES;
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    window.rootViewController = navi;
//    [window makeKeyAndVisible];
//}
//- (void)goToLogin{
//    LoginViewController *tabVC = [[LoginViewController alloc] init];
//    NavigationViewController *navi = [[NavigationViewController alloc]initWithRootViewController:tabVC];
//    navi.navigationBar.hidden = YES;
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    window.rootViewController = navi;
//    [window makeKeyAndVisible];
//}
+ (instancetype)showControllerWithSuccess:(LoginSuccess )loginSuccess cancel:(LoginCancel )loginCanel{
    LoginViewController * vc = [[LoginViewController alloc] init];
    vc.loginSuccess = loginSuccess;
    vc.loginCanel = loginCanel;
    NavigationViewController * nav = [[NavigationViewController alloc] initWithRootViewController:vc];
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController presentViewController:nav animated:YES completion:nil];
    return vc;
}
-(void)loginSuccessEvent{
    JTDWeakSelf
    [self dismissViewControllerAnimated:YES completion:^{
        if (WeakSelf.loginSuccess) {
            WeakSelf.loginSuccess();
        }
    }];
    }
- (void)loginCancelEvent{
    JTDWeakSelf
    [self dismissViewControllerAnimated:YES completion:^{
        if (WeakSelf.loginCanel) {
            WeakSelf.loginCanel();
        }
    }];
}
    
- (void)setBar{
    self.title = @"账户登录";
    [self setLeftItemWithImageTarget:self];
    [self setRightItemWithTitle:@"注册" Target:self];
}
- (void)back{
    NSLog(@"1111");
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
