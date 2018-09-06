//
//  NoticeTableViewCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/8.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "NoticeTableViewCell.h"

@interface NoticeTableViewCell ()
@property (nonatomic ,strong) UIImageView*imgView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *messageLabel;
@property (nonatomic ,strong) UILabel *timeLabel;

@end

@implementation NoticeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [ super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
        self.imgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.imgView];
        
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.font = FONT(14);
        self.messageLabel.textColor = [UIColor blackColor];
        self.messageLabel.text = @"您的订单（编号：1284）超时未支付，订单自动取消，哈哈哈哈哈哈哈哈哈哈哈哈哈哈2";
        [self.contentView addSubview:self.messageLabel];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FONT(13);
        self.titleLabel.textColor = [UIColor grayColor];
        self.titleLabel.text = @"超时未支付订单";
        [self.contentView addSubview:self.titleLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = FONT(13);
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel.text = @"2018-03-07 16:44";
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imgView.centerY = self.contentView.height/2;
    self.imgView.left = 10;
    
    
    self.messageLabel.width = 200;
    self.messageLabel.height = 14;
    self.messageLabel.left = self.imgView.right + 10;
    self.messageLabel.centerY = self.contentView.height/2;
    
    self.titleLabel.width = 200;
    self.titleLabel.height = 14;
    self.titleLabel.left = self.imgView.right + 10;
    self.titleLabel.bottom = self.messageLabel.top - 5;
    
    self.timeLabel.width = 200;
    self.timeLabel.height = 15;
    self.timeLabel.left = self.titleLabel.left;
    self.timeLabel.top = self.messageLabel.bottom + 5;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
