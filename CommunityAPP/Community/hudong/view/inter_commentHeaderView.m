//
//  inter_commentHeaderView.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "inter_commentHeaderView.h"

@implementation inter_commentHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
    [self addSubview:self.iconIma];
    [self.iconIma mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.width.height.equalTo(@60);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconIma.mas_right).offset(10);
        make.top.equalTo(self.iconIma.mas_top).offset(5);
    }];
    
    [self addSubview:self.nickLabel];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconIma.mas_right).offset(10);
        make.bottom.equalTo(self.iconIma.mas_bottom).offset(-5);
    }];
    [self addSubview:self.VIPLabel];
    [self.VIPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
//    [self addSubview:self.postBtn];
//    [self.postBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.mas_right).offset(-15);
//        make.width.equalTo(@80);
//        make.height.equalTo(@40);
//
//        make.centerY.equalTo(self.iconIma.mas_centerY);
//    }];
}
-(void)setModel:(interactionDetailModel *)model{
    self.leftLabel.text = model.nickname;
    self.nickLabel.text = model.create_time;
    self.VIPLabel.text = model.p_title;
    [self.iconIma sd_setImageWithURL:[NSURL URLWithString:model.face] placeholderImage:ImageNamed(@"icon")];
}

-(UIImageView *)iconIma{
    if(!_iconIma){
        _iconIma = [[UIImageView alloc]initWithImage:ImageNamed(@"icon")];
        [_iconIma makeCornerWithCornerRadius:30 borderWidth:0 borderColor:nil];
    }
    return _iconIma;
}
-(CustomLab *)leftLabel{
    if(!_leftLabel){
        _leftLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:18 aligment:NSTextAlignmentLeft text:@"二手市场" textcolor:kColorBlack];
    }
    return _leftLabel;
}
-(CustomLab *)nickLabel{
    if(!_nickLabel){
        _nickLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentRight text:@"10 人关注" textcolor:kColorGray7];
    }
    return _nickLabel;
}
-(CustomLab *)VIPLabel{
    if(!_VIPLabel){
        _VIPLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:16 aligment:NSTextAlignmentRight text:@"二手市场交流圈" textcolor:kColorGray4];
    }
    return _VIPLabel;
}
//-(CustomBtn *)postBtn{
//    
//    if (!_postBtn) {
//        _postBtn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:1000 Title:@"+已关注" backgroundColor:kColorClear TitleTextColor:kColorRed Font:17 Image:nil];
//        [_postBtn makeCornerWithCornerRadius:5 borderWidth:0 borderColor:nil];
//        [_postBtn addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    return _postBtn;
//}
@end
