//
//  MyHarvestAddressCell.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/20.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "MyHarvestAddressCell.h"
#import "UIButton+LXMImagePosition.h"
@implementation MyHarvestAddressCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [ super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI{

    [self setBackgroundColor:kColorGray9];
    [self.contentView setBackgroundColor:kColorWhite];
    [self.contentView makeCornerWithCornerRadius:8 borderWidth:0 borderColor:nil];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(5);
        make.right.bottom.equalTo(self).offset(-5);
    }];
    [self.contentView addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(15);
    }];
    [self.contentView addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.contentView.mas_top).offset(15);
    }];
    [self.contentView addSubview:self.nickLabel];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.leftLabel.mas_bottom).offset(30);
    }];
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectZero color:kColorGray7];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.nickLabel.mas_bottom).offset(15);
        make.height.equalTo(@0.5);
    }];
    [self.contentView addSubview:self.address_btn];
    [self.address_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.height.equalTo(@39);
        make.width.equalTo(@120);
        make.top.equalTo(lineView.mas_bottom).offset(10);
    }];

    [self.contentView addSubview:self.delete_btn];
    [self.delete_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.height.equalTo(@39);
        make.width.equalTo(@70);
        make.top.equalTo(lineView.mas_bottom).offset(10);
    }];
    [self.contentView addSubview:self.edit_btn];
    [self.edit_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.delete_btn.mas_left).offset(-2);
        make.height.equalTo(@39);
        make.width.equalTo(@100);
        make.top.equalTo(lineView.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);

    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.isMoRen) {
        [_address_btn setImage:ImageNamed(@"fapiao_xuanzhong") forState:UIControlStateNormal];
        [_address_btn setTitle:@"默认地址" forState:UIControlStateNormal];
        [_address_btn setTitleColor:kColorRed forState:UIControlStateNormal];

    }else{
        [_address_btn setImage:ImageNamed(@"fapiao_moren") forState:UIControlStateNormal];
        [_address_btn setTitle:@"设为默认" forState:UIControlStateNormal];
        [_address_btn setTitleColor:kColorBlack forState:UIControlStateNormal];


    }
    [self.address_btn setImagePosition:LXMImagePositionLeft spacing:3];


}
-(CustomLab *)nickLabel{
    if(!_nickLabel){
        _nickLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentLeft text:@"河北省保定市雄安新区" textcolor:kColorBlack];
//        _nickLabel.numberOfLines = 0;
    }
    return _nickLabel;
}
-(CustomLab *)leftLabel{
    if(!_leftLabel){
        _leftLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentLeft text:@"毛志远" textcolor:kColorBlack];
    }
    return _leftLabel;
}
-(CustomLab *)rightLabel{
    if(!_rightLabel){
        _rightLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:14 aligment:NSTextAlignmentRight text:@"15028898855" textcolor:kColorBlack];
    }
    return _rightLabel;
}
-(CustomBtn *)address_btn{
    if (_address_btn == nil) {
        _address_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"默认地址" backgroundColor:kColorClear TitleTextColor:kColorRed Font:15 Image:nil];
        _address_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;


    }
    return _address_btn;
}
-(CustomBtn *)edit_btn{
    if ( _edit_btn== nil) {
        _edit_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"编辑" backgroundColor:kColorClear TitleTextColor:kColorGray4 Font:15 Image:nil];
        [_edit_btn setImage:ImageNamed(@"bianji_set_address") forState:UIControlStateNormal];
        _edit_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_edit_btn setImagePosition:LXMImagePositionLeft spacing:3];
    }
    return _edit_btn;
}
-(CustomBtn *)delete_btn{
    if (_delete_btn == nil) {
        _delete_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"删除" backgroundColor:kColorClear TitleTextColor:kColorGray4 Font:15 Image:nil];
        [_delete_btn setImage:ImageNamed(@"delete_set_address") forState:UIControlStateNormal];
        _delete_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_delete_btn setImagePosition:LXMImagePositionLeft spacing:3];
    }
    return _delete_btn;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
