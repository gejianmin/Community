//
//  CustomPresentation.m
//  LoginAPI
//
//  Created by Lxrent on 16/10/9.
//  Copyright © 2016年 gejianmin. All rights reserved.
//

#import "CustomPresentation.h"

@interface CustomPresentation()

@property (nonatomic,strong)UIView *baffleView;

@end

@implementation CustomPresentation


-(void)containerViewWillLayoutSubviews{
//    [super containerViewWillLayoutSubviews];
    
    self.presentedView.frame = [UIScreen mainScreen].bounds;
    [self.containerView insertSubview:self.baffleView atIndex:0];
    
}



- (UIView *)baffleView{
    
    if (!_baffleView) {
    
    _baffleView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _baffleView.backgroundColor = [UIColor blackColor];
    _baffleView.alpha = 0.5;
        
    }
    return _baffleView;
}

@end
