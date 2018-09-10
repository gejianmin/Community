//
//  JTDShareVC.m
//  PetSocialClient
//
//  Created by tongda ju on 2018/3/20.
//  Copyright © 2018年 JianMin Ge. All rights reserved.
//

#import "JTDShareVC.h"
#import "PresentTransition.h"
#import "UIButton+LXMImagePosition.h"
@interface JTDShareVC ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) PresentTransition *transtionDelegate;
@property (nonatomic,strong) UIView *successView;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIButton *closeBtn;

@end

@implementation JTDShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self setUpUI];
}
-(void)setUpUI{
    [self.view addSubview:self.backView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, HH_SCREEN_W, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"分享至";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame) + 20, _backView.frame.size.width, 0.5)];
    line.backgroundColor = kColorWhite1;
    
    NSArray *title = @[@"QQ",@"微信好友",@"朋友圈",@"微博",];
    NSArray *image = @[@"qq_icon",@"wechat_icon",@"wechatTimeline_icon",@"sina_icon"];
    CGFloat width = 60;
    CGFloat height = 80;
    CGFloat spacing = (_backView.frame.size.width - width *4) / 5;
    for (int i = 0; i <title.count ; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.frame = CGRectMake(spacing + (spacing + width)*i, CGRectGetMaxY(line.frame)+ 40, width, height);
        btn.tag = 1000 + i;
        [btn setTitle:title[i] forState:UIControlStateNormal];
        [btn setTitleColor:kColorGray5 forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:image[i]] forState:UIControlStateNormal];
        [btn setImagePosition:LXMImagePositionTop spacing:10];
        [btn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:btn];
    }
    
    [_backView addSubview:label];
    [_backView addSubview:line];
    [self.backView addSubview:self.closeBtn];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.top.mas_equalTo(self.backView.mas_bottom).offset(-49);
        make.height.equalTo(@49);
    }];
}

- (void)shareBtnClick:(UIButton *)btn{
    
    [JTDSocialShare ShareUMSocial].shareContentModel=self.shareContentModel;
    [[JTDSocialShare ShareUMSocial] showSocialWithTag:btn.tag];
    [self dissMiss:nil];
    
}
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, HH_SCREEN_H-235-49, HH_SCREEN_W,235+49)];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
-(PresentTransition *)transtionDelegate{
    if (!_transtionDelegate) {
        _transtionDelegate = [[PresentTransition alloc]init];
    }
    return _transtionDelegate;
}

- (void)showPaySuccessWithResult:(StateEnum)result andController:(UIViewController *)controller{
    
//    self.payState = result;
    self.transitioningDelegate = self.transtionDelegate;
    self.modalPresentationStyle = UIModalPresentationCustom;
    [controller presentViewController:self animated:YES completion:nil];
}
-(UIButton *)closeBtn{
    
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(removeView:) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_closeBtn.titleLabel setFont:kFont17];
        [_closeBtn setTitleColor:kColorWhite forState:UIControlStateNormal];
        [_closeBtn setBackgroundColor:COLORHEX(0x222730)];
    }
    return _closeBtn;
}
- (void)removeView:(UIButton *)btn{
    
    [self dissMiss:nil];
}
- (void)dissMiss:(NSString *)str{
    
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
