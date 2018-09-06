//
//  MessageTableViewCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/8.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "MessageTableViewCell.h"

@interface MessageTableViewCell ()
@property (nonatomic ,strong) UIImageView*imgView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *messageLabel;
@property (nonatomic ,strong) UIImageView *examineImgView;
@end
@implementation MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [ super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        self.imgView.layer.cornerRadius = 30.0f;
        self.imgView.backgroundColor = [UIColor redColor];
        self.imgView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imgView];
        
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.font = FONT(14);
        self.messageLabel.textColor = [UIColor blackColor];
        self.messageLabel.text = @"您好，这个是没有优惠的";
        [self.contentView addSubview:self.messageLabel];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FONT(13);
        self.titleLabel.textColor = [UIColor grayColor];
        self.titleLabel.text = @"小泡泡";
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(10, 10, 60, 60);
    
    self.titleLabel.width = 200;
    self.titleLabel.height = 14;
    self.titleLabel.left = self.imgView.right + 10;
    self.titleLabel.bottom = self.imgView.centerY - 5;
    
    self.messageLabel.width = 200;
    self.messageLabel.height = 15;
    self.messageLabel.left = self.titleLabel.left;
    self.messageLabel.top = self.imgView.centerY + 5;
    
    
//    self.examineImgView.top = 0;
//    self.examineImgView.right = self.backView.width;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
