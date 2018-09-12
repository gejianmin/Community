//
//  SetUpTableViewCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpTableViewCell.h"

@interface SetUpTableViewCell ()
@property (nonatomic ,strong) UIImageView*imgView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) CustomLab *leftLabel;
@property (nonatomic ,strong) CustomLab *rightLabel;


@end
@implementation SetUpTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [ super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        [self setupUI];
        if(self.reuseIdentifier){
            
        }
    }
    return self;
}
-(void)setupUI{
    [self.contentView addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.contentView addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-5);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
        
}
-(CustomLab *)leftLabel{
    if(!_leftLabel){
        _leftLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentLeft text:@"wode" textcolor:kColorBlack];
    }
    return _leftLabel;
}
-(CustomLab *)rightLabel{
        if(!_rightLabel){
            _rightLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:14 aligment:NSTextAlignmentRight text:@"hside" textcolor:kColorGray1];
        }
        return _rightLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
