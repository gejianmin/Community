//
//  InforADView.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/14.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforADView.h"

@interface InforADView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *imgView;
@end
@implementation InforADView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, frame.size.width - 60,15)];
//        self.titleLabel.textColor = [UIColor blackColor];
//        self.titleLabel.font = FONT(14);
//        [self addSubview:self.titleLabel];
//
//        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, frame.size.width - 60, frame.size.height)];
//        self.contentLabel.textColor = [UIColor grayColor];
//        self.contentLabel.font = FONT(13);
//        [self addSubview:self.contentLabel];
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.imgView.clipsToBounds = YES;
        [self addSubview:self.imgView];
        
    }
    return self;
}
- (void)setModel:(Village_ADModel *)model{
    
    _model = model;
    
    self.titleLabel.text = model.ad_name;
    self.contentLabel.text = @"五月天演唱会";
    
    __weak typeof(self) tyself = self;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.ad_thumb] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
//        CGSize size = image.size;
//        tyself.imgView.size = size;
//        tyself.imgView.right = tyself.width;
//        tyself.imgView.centerY = tyself.height/2;
    }];
}
@end
