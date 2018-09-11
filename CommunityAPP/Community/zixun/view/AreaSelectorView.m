//
//  AreaSelectorView.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "AreaSelectorView.h"
#import "UserObjModel.h"
@implementation AreaSelectorView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        // 添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        [self addGestureRecognizer:tap];
        
        [self createUI];
        
    }
    
    return self;
}

// 点击事件
- (void)tapClick {
    
    self.clickBlock();
    
}


- (void)createUI {
    // 右上方和右下方角度弧度
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(10,10)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    
    // 位置图标
    self.localImageV = [[UIImageView alloc]init];
    self.localImageV.image = [UIImage imageNamed:@"dangqiandingwei"];
    [self addSubview:_localImageV];
    [self.localImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(@20);
        
    }];
    
   
    // 下箭头
    self.subImageV = [[UIImageView alloc]init];
    self.subImageV.image = [UIImage imageNamed:@"xuanze"];
    [self addSubview:_subImageV];
    [self.subImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.mas_right).offset(-8);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(@20);
    }];
    
    // 区域内容
    self.localNameL = [[UILabel alloc]init];
//    self.localNameL.text = [UserObjModel shareIntance].org_name;
    self.localNameL.text = [HHClient sharedInstance].user.org_name;
    self.localNameL.font = FONT(14);
    self.localNameL.textColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
    [self addSubview:_localNameL];
    
    [self.localNameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.localImageV.mas_right).offset(8);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.subImageV.mas_left).offset(-8);
    }];
    
    
    
}


@end
