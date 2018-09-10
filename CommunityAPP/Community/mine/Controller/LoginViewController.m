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
@interface LoginViewController ()<LoginViewDelegate>

@property (nonatomic, strong) LoginView *logView;

@property (nonatomic,copy) LoginViewControllerCallBack  callback;

@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =RGB(250, 250, 250);
    self.logView = [[LoginView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
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
    LoginRequest * request = [[LoginRequest alloc]init];
    [request setUserLoignWith:nil password:nil];
    [request setFinishedBlock:^(id object, id responseData) {
        
        NSLog(@"%@",object);
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
                RegisterVC * VC = [[RegisterVC alloc]init];
                [self.navigationController pushViewController:VC animated:YES];
            }
            break;
        case 1002://忘记密码
        {
            ForgotPasswordVC * VC = [[ForgotPasswordVC alloc]init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 1003://微信登录
        {
            [[JTDSocialShare ShareUMSocial] getUserInfoWithController:self withTag:weChatLoginType callBack:^(BOOL success, JTDUserInfoModel *model) {
                if(success){
                    [self thirdLoginWith:model loginType:weChatLoginType];
                }else{
                    //                    [self showToastHUD:@"登录异常" complete:nil];
                }
            }];
            
        }
            break;
        default:
            break;
    }
    
    
}
-(void)thirdLoginWith:(JTDUserInfoModel *)model loginType:(NSInteger )loginType{
    
    [self showToastHUD:nil];
    NSString * sex;
    NSString * openid;
    if ([model.unionGender isEqualToString:@"男"]) {
        sex = @"2";
    }else{
        sex = @"1";
    }
    if (loginType == sinaLoginType) {
        openid = model.uid;
    }else{
        openid = model.openid;
    }
    NSDictionary * params = @{@"openid":openid,
                              @"identifies":[self getIdentifiesSting],
                              @"unionid":model.unionId?:@"",
                              @"name": model.name,
                              @"sex": sex,
                              @"img": model.iconurl
                              };
    JTDWeakSelf
//    [[[HHClient sharedInstance] sessionManager] IC_Post:ICPath_ThirdLogin params:params complete:^(id response, HHError *error) {
//        [WeakSelf hideHUD];
//        if (error) {
//            [WeakSelf showToastHUD:error.errorDescription complete:nil];
//        }else{
//            HHUserInfo * model = [HHUserInfo mj_objectWithKeyValues:response[@"arr"]];
//            [[HHClient sharedInstance] setUser:model];
//            [[HHClient sharedInstance] setUserId:model.userId];
//            [[NSUserDefaults standardUserDefaults] setObject:model.access_token forKey:@"ACCESSTOKEN"];
//            [[NSUserDefaults standardUserDefaults] setObject:model.userId forKey:@"userID"];
//            [WeakSelf login];
//
//        }
//    }];
    [self login];
    
}
-(NSString *)getIdentifiesSting{
    
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString * adis = [adId stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return adis;
}
- (void)login {
    [self hideHUD];
    HHLog(@"登录成功");
    if (self.callback) {
        self.callback(self);
    }
    
}
+ (instancetype)showWithCallBack:(LoginViewControllerCallBack)callback {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    for (UIView * view  in window.subviews) {
        [view removeAllSubviews];
    }
    LoginViewController * vc = [[LoginViewController alloc] init];
    window.rootViewController = vc;
    vc.callback = callback;
    return vc;
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
