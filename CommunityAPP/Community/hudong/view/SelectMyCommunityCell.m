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
