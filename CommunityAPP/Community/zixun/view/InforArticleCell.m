//
//  InforArticleCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforArticleCell.h"

@interface InforArticleCell ()

@end
@implementation InforArticleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.imgView = [[UIImageView alloc] init];
        self.imgView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.imgView];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.numberOfLines = 2;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping | NSLineBreakByWordWrapping;
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.font = FONT(14);
        [self.contentView addSubview:self.contentLabel];
        
        self.fromLabel = [[UILabel alloc] init];
        self.fromLabel.text = @"社区新闻";
        self.fromLabel.textColor = RGB(150, 150, 150);
        self.fromLabel.font = FONT(13);
        [self.contentView addSubview:self.fromLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textColor = RGB(150, 150, 150);
        self.timeLabel.font = FONT(13);
        [self.contentView addSubview:self.timeLabel];
        
        self.watchImgView = [[UIImageView alloc] init];
        UIImage *watchImg = [UIImage imageNamed:@"watch"];
        self.watchImgView.image = watchImg;
        self.watchImgView.contentMode = UIViewContentModeCenter;
        self.watchImgView.width = 20;
        self.watchImgView.height = 20;
        [self.contentView addSubview:self.watchImgView];
        
        self.zanImgView = [[UIImageView alloc] init];
        UIImage *zanImg = [UIImage imageNamed:@"weidianzan"];
        self.zanImgView.image = zanImg;
        self.zanImgView.contentMode = UIViewContentModeCenter;
        self.zanImgView.width = 20;
        self.zanImgView.height = 20;
//        self.zanImgView.size = zanImg.size;
        [self.contentView addSubview:self.zanImgView];
        
        self.watchLabel = [[UILabel alloc] init];
        self.watchLabel.textColor = RGB(150, 150, 150);
        self.watchLabel.font = FONT(13);
        [self.contentView addSubview:self.watchLabel];
        
        self.zanLabel = [[UILabel alloc] init];
        self.zanLabel.textColor = RGB(150, 150, 150);
        self.zanLabel.font = FONT(13);
        [self.contentView addSubview:self.zanLabel];
        
    }
    return self;
}
- (void)setModel:(Village_ArticleListModel *)model{
    _model = model;
    
    __weak typeof(self) tyself = self;
    NSString *imgUrl = [NSString stringWithFormat:@"%@/%@",model.path,model.filename];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"moren"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

    }];
    self.contentLabel.text = model.title;
    CGSize size =  [self.contentLabel sizeForString:@"1\n1" font:self.contentLabel.font constrainedToSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
    CGSize currentSize =  [self.contentLabel sizeForString:model.title font:self.contentLabel.font constrainedToSize:CGSizeMake(SCREEN_WIDTH - 140, MAXFLOAT)];
    
    if (currentSize.height>=size.height) {
        self.contentLabel.height = size.height;
    }else{
        self.contentLabel.height = currentSize.height;
    }
    self.timeLabel.text = model.create_time;

    self.watchLabel.text = model.views;
    CGSize watchSize =  [self.watchLabel sizeForString:self.watchLabel.text font:self.watchLabel.font constrainedToSize:CGSizeMake(SCREEN_WIDTH - 140, MAXFLOAT)];
    self.watchLabel.width = watchSize.width;
    self.watchLabel.height = 14;
    
    self.zanLabel.text = model.favorites;
    CGSize zanSize =  [self.zanLabel sizeForString:self.zanLabel.text font:self.zanLabel.font constrainedToSize:CGSizeMake(SCREEN_WIDTH - 140, MAXFLOAT)];
    self.zanLabel.width = zanSize.width;
    self.zanLabel.height = 14;

    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imgView.left = 10;
    self.imgView.top = 15;
    self.imgView.height = self.height - 30;
    self.imgView.width = 110;
    
    self.contentLabel.left = self.imgView.right + 10;
    self.contentLabel.top = self.imgView.top;
    self.contentLabel.width = SCREEN_WIDTH - 140;
    
    self.fromLabel.left = self.imgView.right + 10;
    self.fromLabel.width = 150;
    self.fromLabel.height = 15;
    self.fromLabel.top = self.height/2;
    
    self.timeLabel.left = self.imgView.right + 10;
    self.timeLabel.width = 150;
    self.timeLabel.height = 14;
    self.timeLabel.bottom = self.imgView.bottom;
    
    self.zanLabel.right = SCREEN_WIDTH - 10;
    self.zanLabel.bottom = self.imgView.bottom;
    
    self.zanImgView.right = self.zanLabel.left - 2;
    self.zanImgView.centerY = self.zanLabel.centerY;
    
    self.watchLabel.right = self.zanImgView.left - 10;
    self.watchLabel.bottom = self.imgView.bottom;
    
    self.watchImgView.right = self.watchLabel.left - 2;
    self.watchImgView.centerY = self.zanLabel.centerY;

    self.lineView.backgroundColor = RGB(240, 240, 240);
    self.lineView.frame = CGRectMake(.0f, CGRectGetHeight(self.contentView.frame)-2, CGRectGetWidth(self.contentView.frame), 2);
}
@end
