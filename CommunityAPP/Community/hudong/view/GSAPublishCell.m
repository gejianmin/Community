//
//  GSAPublishCell.m
//  GreenShoesActionClient
//
//  Created by tongda ju on 2018/4/16.
//  Copyright © 2018年 赵东. All rights reserved.
//

#import "GSAPublishCell.h"

@interface GSAPublishCell () <UITextFieldDelegate>

@end
@implementation GSAPublishCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath{
    if (self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
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
        make.width.equalTo(@60);
        make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
    }];
    if (self.reuseIdentifier == kNormalCellReuseIdentifier ) {
        [self.contentView addSubview:self.pull_ima];
        [self.contentView addSubview:self.textfield];
        [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title_lbl.mas_right).offset(15);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
            make.top.equalTo(self.title_lbl.mas_top).offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
            
        }];
    }else if (self.reuseIdentifier == kButtonCellReuseIdentifier){
        [self.contentView addSubview:self.detailTitle_lbl];
        [self.detailTitle_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title_lbl.mas_right).offset(15);
            make.right.equalTo(self.contentView.mas_right).offset(-30);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);
        }];
//
    }else if (self.reuseIdentifier == kImageCellReuseIdentifier){
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.detailTitle_lbl];
        [self.detailTitle_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title_lbl.mas_right).offset(15);
            make.right.equalTo(self.contentView.mas_right).offset(-30);
            make.centerY.equalTo(self.contentView.mas_centerY).offset(0);

            
        }];
    }
}
-(void)reloadDataWithModel:(GSAPublishModel *)model indexPath:(NSIndexPath *)indexPath callBack:(GSAPublishCellCellCallBack )callback{
    _callBack = callback;
    _currentIndexPath = indexPath;
    [_textfield setText:model.content];
}
-(void)setModel:(GSAPublishModel *)model{
    _model = model;
    self.title_lbl.text = model.title;
//    if ([model.title isEqualToString:@"攻略封面图"]) {
//        self.title_lbl.textColor = kColorGray11;
//    }
    self.textfield.placeholder = model.detailTitle;
    self.pull_ima.hidden = model.isHeidenMark;
    if(model.selectorStatu == segmentShowCustomStyle || model.selectorStatu == selectorSelectStatu){
    self.detailTitle_lbl.text = model.content;
    }
    self.textfield.text = model.content;
    [self.descripte_btn setTitle:model.buttonTitle forState:UIControlStateNormal];
    [self.descripte_btn setImage:ImageNamed(@"action_add") forState:UIControlStateNormal];

}
-(CustomLab *)title_lbl{
    if (_title_lbl == nil) {
        _title_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"总时间" textcolor:kColorBlack];
    }
    return _title_lbl;
}
-(CustomLab *)detailTitle_lbl{
    if (_detailTitle_lbl == nil) {
        _detailTitle_lbl =[[CustomLab alloc]initWithFrame:CGRectZero font:15.0 aligment:NSTextAlignmentLeft text:@"总时间" textcolor:kColorGray7];
    }
    return _detailTitle_lbl;
}
-(UITextField *)textfield{
    if (_textfield == nil) {
        _textfield = [[UITextField alloc]init];
        [_textfield setFont:kFont15];
        [_textfield setTextColor:kColorGray11];
        [_textfield setClearButtonMode:UITextFieldViewModeWhileEditing];
        _textfield.delegate = self;
        [_textfield setTextAlignment:NSTextAlignmentLeft];
        [_textfield addTarget:self action:@selector(edit:) forControlEvents:UIControlEventAllEditingEvents];
        _textfield.keyboardType = UIKeyboardTypeDefault;
    }
    return _textfield;
}
-(UIImageView *)pull_ima{
    if (!_pull_ima) {
        _pull_ima = [[UIImageView alloc]initWithImage:ImageNamed(@"action_pull")];
    }
    return _pull_ima;
}
-(CustomBtn *)descripte_btn{
    if (_descripte_btn == nil) {
        _descripte_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:1000 Title:nil backgroundColor:kColorWhite TitleTextColor:kColorBlack2 Font:14.0 Image:nil];
        [_descripte_btn makeCornerWithCornerRadius:3.0 borderWidth:0.5 borderColor:COLORHEX(0xe6e6e6)];
    }
    return _descripte_btn;
}
-(UIImageView *)frontcover_ima{
    if (!_frontcover_ima) {
        _frontcover_ima = [[UIImageView alloc]initWithImage:ImageNamed(@"action_addimage")];
    }
    return _frontcover_ima;
}
- (void)edit:(UITextField *)textfield {
    
    if (self.callBack) {
        self.callBack(textfield.text,_currentIndexPath);
    }
}
-(void)descripteBtnEvent:(CustomBtn *)sender{
    if ([self.delegate respondsToSelector:@selector(GSAPublishButton:indexPath:)]) {
        [self.delegate GSAPublishButton:sender indexPath:_currentIndexPath];
    }
}
-(void)descripteAgreeActionBtnEvent:(CustomBtn *)sender{
    if ([self.delegate respondsToSelector:@selector(GSAPublishAgreeActionButton:indexPath:)]) {
        [self.delegate GSAPublishAgreeActionButton:sender indexPath:_currentIndexPath];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];    
}

@end
