//
//  UIViewController+OA_Nav.m
//  JTDOASystem
//
//  Created by 王帅宇 on 2018/7/6.
//  Copyright © 2018年 JuTongDa Technology. All rights reserved.
//

#import "UIViewController+OA_Nav.h"

@implementation UIViewController (OA_Nav)


#pragma mark - touch
- (void)addLeftBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)selector {
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc] initWithImage: [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:target action:selector];
    
    self.navigationItem.leftBarButtonItem = leftBarItem;
}
- (void)addRightBarItemWithImage:(UIImage *)image target:(id)target action:(SEL)selector {
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithImage: [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:target action:selector];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
- (void)addRightBarItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)selector {
    
    UIBarButtonItem * rightbutton =[[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
    [rightbutton setTintColor:tintColor];
    
    self.navigationItem.rightBarButtonItem = rightbutton;
}

- (void)addRightDefaultBarItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector {
    [self addRightBarItemWithTitle:title tintColor:kColorBlue backgroudColor:kColorWhite target:target action:selector];
}
- (void)addRightBarItemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor backgroudColor:(UIColor *)bgcolor target:(id)target action:(SEL)selector {
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,55,30)];
    rightButton.backgroundColor = bgcolor;
    [rightButton setTitle:title forState:UIControlStateNormal];
    rightButton.titleLabel.font = kFont14;
    [rightButton setTitleColor:tintColor forState:UIControlStateNormal];
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [rightButton makeCornerWithCornerRadius:3.0 borderWidth:0 borderColor:nil];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}
- (void)addRightTwoBarItemWithImage:(UIImage *)image image2:(UIImage *)image2 target:(id)target target2:(id)target2 action:(SEL)selector action2:(SEL)selector2{
    
    UIView * viewBackInNavi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    viewBackInNavi.backgroundColor=[UIColor clearColor];
    viewBackInNavi.userInteractionEnabled=YES;
    //右一
    UIButton *myRightRePaintBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [myRightRePaintBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [myRightRePaintBtn setBackgroundColor:[UIColor clearColor]];
    [myRightRePaintBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [myRightRePaintBtn setImage:image forState:UIControlStateNormal];
    [myRightRePaintBtn setTitle:[NSString stringWithFormat:@" %@",NSLocalizedString(@"local_paintAgain", nil)] forState:UIControlStateNormal];
    myRightRePaintBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [viewBackInNavi addSubview:myRightRePaintBtn];
    
    //右二
    UIButton *myRightSubmitBtn=[[UIButton alloc]initWithFrame:CGRectMake(35, 0, 22, 22)];
    [myRightSubmitBtn addTarget:target2 action:selector2 forControlEvents:UIControlEventTouchUpInside];
    [myRightSubmitBtn setBackgroundColor:[UIColor clearColor]];
    [myRightSubmitBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [myRightSubmitBtn setImage:image2 forState:UIControlStateNormal];
    [myRightSubmitBtn setTitle:[NSString stringWithFormat:@" %@",NSLocalizedString(@"local_card", nil)] forState:UIControlStateNormal];
    myRightSubmitBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [viewBackInNavi addSubview:myRightSubmitBtn];
    
    UIBarButtonItem * right=[[UIBarButtonItem alloc]initWithCustomView:viewBackInNavi];
    //将整个viewBackInNavi右移10
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    negativeSpacer.width =-10;//负数为右移，正数为左移
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,right,nil];
}

- (void)setupLeftBarButton {
    // 自定义 leftBarButtonItem ，UIImageRenderingModeAlwaysOriginal 防止图片被渲染
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[[UIImage imageNamed:@"nav_cacel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                             style:UIBarButtonItemStylePlain
                                             target:self
                                             action:@selector(leftBarButtonClick)];
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}
#pragma mark - 返回按钮的点击事件
- (void)leftBarButtonClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
