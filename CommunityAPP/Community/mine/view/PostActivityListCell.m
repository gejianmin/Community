//
//  PostActivityListCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/6.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "PostActivityListCell.h"

@interface PostActivityListCell ()
@property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UIImageView*imgView;
@property (nonatomic ,strong) UILabel *messageLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UIImageView *examineImgView;

@end

@implementation PostActivityListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = RGB(250, 250, 250);
        
        self.backView = [[UIView alloc] init];
        self.backView.layer.cornerRadius = 5.0f;
        self.backView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.backView];
        
        self.imgView = [[UIImageView alloc] init];
        self.imgView.layer.cornerRadius = 5.0f;
        self.imgView.backgroundColor = [UIColor redColor];
        self.imgView.layer.masksToBounds = YES;
        [self.backView addSubview:self.imgView];
        
        self.messageLabel = [[UILabel alloc] init];
        self.messageLabel.font = FONT(14);
        self.messageLabel.textColor = [UIColor blackColor];
        self.messageLabel.text = @"小泡泡";
        [self.backView addSubview:self.messageLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = FONT(13);
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel.text = @"发布时间:2018-03-07 16:44";
        [self.backView addSubview:self.timeLabel];
        
        self.examineImgView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"weishenhe"];
        self.examineImgView.image = image;
        self.examineImgView.size = image.size;
        [self.backView addSubview:self.examineImgView];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.backView.frame = CGRectMake(10, 5, self.contentView.width - 20, self.contentView.height - 10);
    self.imgView.frame = CGRectMake(10, 10, self.backView.height - 20, self.backView.height - 20);
    
    self.messageLabel.width = 200;
    self.messageLabel.height = 15;
    self.messageLabel.left = self.imgView.right + 10;
    self.messageLabel.bottom = self.imgView.centerY - 5;
    
    self.timeLabel.width = 200;
    self.timeLabel.height = 14;
    self.timeLabel.left = self.messageLabel.left;
    self.timeLabel.top = self.imgView.centerY + 5;
    
    self.examineImgView.top = 0;
    self.examineImgView.right = self.backView.width;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
