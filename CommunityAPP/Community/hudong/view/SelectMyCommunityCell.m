//
//  SelectMyCommunityCell.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SelectMyCommunityCell.h"

@implementation SelectMyCommunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        [self setContentView];
    }
    return self;
}
-(void)setContentView{
    [self.contentView addSubview:self.title_lbl];
    [self.title_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.contentView.mas_top).offset(10);

    }];
    [self.contentView addSubview:self.detailTitle_lbl];
    [self.detailTitle_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.title_lbl.mas_bottom).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);

    }];
}
-(CustomLab *)title_lbl{
    if (_title_lbl == nil) {
        _title_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"总时间" textcolor:kColorBlack];
    }
    return _title_lbl;
}
-(CustomLab *)detailTitle_lbl{
    if (_detailTitle_lbl == nil) {
        _detailTitle_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"总时间总时间总时间" textcolor:kColorGray7];
    }
    return _detailTitle_lbl;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation MyCommunityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        [self setContentView];
    }
    return self;
}
-(void)setContentView{
    [self.contentView addSubview:self.title_lbl];
    [self.title_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
//        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        
    }];
    [self.contentView addSubview:self.mark_lbl];
    [self.mark_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title_lbl.mas_right).offset(10);
        make.width.equalTo(@45);
        make.height.equalTo(@25);
        make.centerY.equalTo(self.title_lbl.mas_centerY);
        
    }];
    [self.contentView addSubview:self.detailTitle_lbl];
    [self.detailTitle_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.title_lbl.mas_bottom).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        
    }];
}
-(void)setModel:(GetCommunityModel *)model{
    _model = model;
    self.title_lbl.text = model.org_name;
    self.detailTitle_lbl.text = [NSString stringWithFormat:@"%@栋 %@单元 %@号",model.building,model.entrance,model.house_number];
    
}
-(CustomLab *)title_lbl{
    if (_title_lbl == nil) {
        _title_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"总时间" textcolor:kColorBlack];
    }
    return _title_lbl;
}
-(CustomLab *)mark_lbl{
    if (_mark_lbl == nil) {
        _mark_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:12.0 aligment:NSTextAlignmentCenter text:@"已认证" textcolor:kColorWhite];
        [_mark_lbl setBackgroundColor:kColorOrange];
        [_mark_lbl makeCornerWithCornerRadius:3 borderWidth:0 borderColor:nil];
    }
    return _mark_lbl;
}
-(CustomLab *)detailTitle_lbl{
    if (_detailTitle_lbl == nil) {
        _detailTitle_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"总时间总时间总时间" textcolor:kColorRed];
    }
    return _detailTitle_lbl;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
