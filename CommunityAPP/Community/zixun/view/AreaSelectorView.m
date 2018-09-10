//
//  AreaSelectorView.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "AreaSelectorView.h"

@implementation AreaSelectorView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        [self createUI];
        
    }
    
    return self;
}

- (void)createUI {
    
    self.localImageV = [[UIImageView alloc]init];
    self.localImageV.image = [UIImage imageNamed:@"dangqiandingwei"];
    [self addSubview:_localImageV];
    [self.localImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(@20);
        
    }];
    
   
    
    self.subImageV = [[UIImageView alloc]init];
    self.subImageV.image = [UIImage imageNamed:@"xuanze"];
    [self addSubview:_subImageV];
    [self.subImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self.mas_right).offset(-8);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.equalTo(@20);
    }];
    
    self.localNameL = [[UILabel alloc]init];
    self.localNameL.text = @"这是随便一个区域";
    self.localNameL.font = FONT(14);
    self.localNameL.textColor = [UIColor whiteColor];
    [self addSubview:_localNameL];
    
    [self.localNameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.localImageV.mas_right).offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.subImageV.mas_left).offset(-8);
    }];
    
    
    
}


@end
