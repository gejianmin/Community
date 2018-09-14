//
//  PublicCircleCell.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "PublicCircleCell.h"

@implementation PublicCircleCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}
-(void)setupUI{
    [self.contentView addSubview:self.descripe_View];
    [self.descripe_View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.width.height.equalTo(@50);
    }];
    [self.contentView addSubview:self.descripe_lbl];
    [self.descripe_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
        
        
        
}
- (void)setModel:(InForPublicCirCleList_Model *)model{
    [self.descripe_View sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:ImageNamed(@"icon")];
    self.descripe_lbl.text = model.title;
}
-(UIImageView *)descripe_View{
    if(!_descripe_View){
        _descripe_View = [[UIImageView alloc]initWithImage:ImageNamed(@"icon")];
    }
    return _descripe_View;
}
-(CustomLab *)descripe_lbl{
        if (_descripe_lbl == nil) {
            _descripe_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"会快支援" textcolor:kColorBlack];
        }
        return _descripe_lbl;
    }
@end
@interface PublicCircleView ()
@property (nonatomic, strong)CustomLab * detail_lbl;

@end
@implementation PublicCircleView
    
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        [self setBackgroundColor:kColorGray9];
    }
    return self;
}
-(void)setupView{
    [self addSubview:self.detail_lbl];
    [self.detail_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
}
    -(CustomLab *)detail_lbl{
        if (_detail_lbl == nil) {
            _detail_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:18.0 aligment:NSTextAlignmentLeft text:@"公共服务" textcolor:kColorBlack];
            _detail_lbl.numberOfLines = 0;
        }
        return _detail_lbl;
    }
+ (CGFloat)heightDefault {
        return 50;
}
@end
