//
//  inter_commentCell.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "inter_commentCell.h"

@implementation inter_commentCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath{
    if (self = [ super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
       
    }
    return self;
}

-(void)setupUI{
    if(self.reuseIdentifier == kNormalCellReuseIdentifier){
        [self.contentView addSubview:self.images];
        [self.images mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@200);
            make.height.equalTo(@160);
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    else if (self.reuseIdentifier == kCommentCellFirstReuseIdentifier){
        
        [self.contentView addSubview:self.iconIma];
        [self.iconIma mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.width.height.equalTo(@45);
        }];
        [self.contentView addSubview:self.nickLabel];
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.top.equalTo(self.iconIma.mas_top).offset(0);
        }];
        [self.contentView addSubview:self.VIPLabel];
        [self.VIPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.bottom.equalTo(self.iconIma.mas_bottom).offset(0);
        }];
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(35);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.top.equalTo(self.iconIma.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
        }];
        
    }else if (self.reuseIdentifier == kCommentCellSecondReuseIdentifier){
        [self.contentView addSubview:self.iconIma];
        [self.iconIma mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(45);
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.width.height.equalTo(@45);
        }];
        [self.contentView addSubview:self.nickLabel];
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.top.equalTo(self.iconIma.mas_top).offset(0);
        }];
        [self.contentView addSubview:self.VIPLabel];
        [self.VIPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.bottom.equalTo(self.iconIma.mas_bottom).offset(0);
        }];
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(65);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.top.equalTo(self.iconIma.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
        }];
       
    }else if (self.reuseIdentifier == kCommentCellThirdReuseIdentifier){
        [self.contentView addSubview:self.iconIma];
        [self.iconIma mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(65);
            make.top.equalTo(self.contentView.mas_top).offset(10);
            make.width.height.equalTo(@45);
        }];
        [self.contentView addSubview:self.nickLabel];
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.top.equalTo(self.iconIma.mas_top).offset(0);
        }];
        [self.contentView addSubview:self.VIPLabel];
        [self.VIPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.bottom.equalTo(self.iconIma.mas_bottom).offset(0);
        }];
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(85);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.top.equalTo(self.iconIma.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        }];
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(0);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1);
        }];
    }else{
        
    }
    
}
-(void)setHeaderModel:(interactionDetailImageModel *)headerModel{
    _headerModel = headerModel;
    if(self.reuseIdentifier == kNormalCellReuseIdentifier){
        [self.images sd_setImageWithURL:[NSURL URLWithString:headerModel.img_src] placeholderImage:ImageNamed(@"icon")];
    }
}
-(void)setModel:(inter_commentCellModel *)model{
    _model = model;
    if(self.reuseIdentifier != kNormalCellReuseIdentifier){
        HHLog(@"userFace =%@",model.userFace);
//        if ([[[[HHClient sharedInstance] user] uid] isEqualToString:model.uid]) {
            [self.iconIma sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.userFace]] placeholderImage:ImageNamed(@"icon")];
            self.nickLabel.text = model.userNickname;
//        }else{
//            [self.iconIma sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.toFace]] placeholderImage:ImageNamed(@"icon")];
//            self.nickLabel.text = model.toNickname;
//        }
        self.VIPLabel.text = model.create_time;
        self.leftLabel.text = model.comment;
    }
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero color:kColorGray7];
    }
    return _lineView;
}
-(UIImageView *)images{
    if(!_images){
        _images = [[UIImageView alloc]initWithImage:ImageNamed(@"icon")];
//        [_images makeCornerWithCornerRadius:22.5 borderWidth:0 borderColor:nil];
    }
    return _images;
}
-(UIImageView *)iconIma{
    if(!_iconIma){
        _iconIma = [[UIImageView alloc]initWithImage:ImageNamed(@"icon")];
        [_iconIma makeCornerWithCornerRadius:22.5 borderWidth:0 borderColor:nil];
    }
    return _iconIma;
}
-(CustomLab *)nickLabel{
    if(!_nickLabel){
        _nickLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentRight text:@"" textcolor:[UIColor greenColor]];
    }
    return _nickLabel;
}
-(CustomLab *)VIPLabel{
    if(!_VIPLabel){
        _VIPLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentRight text:@"会员名：" textcolor:kColorGray4];
    }
    return _VIPLabel;
}
-(CustomLab *)leftLabel{
    if(!_leftLabel){
        _leftLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentLeft text:@"wode" textcolor:kColorBlack];
        _leftLabel.numberOfLines = 0;
    }
    return _leftLabel;
}
-(CustomLab *)rightLabel{
    if(!_rightLabel){
        _rightLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:14 aligment:NSTextAlignmentRight text:@"hside" textcolor:kColorGray4];
    }
    return _rightLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
