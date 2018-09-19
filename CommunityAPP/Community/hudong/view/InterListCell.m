//
//  InterListCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterListCell.h"

@implementation InterListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.imgView = [[UIImageView alloc] init];
        self.imgView.layer.cornerRadius = 25.0;
        self.imgView.layer.masksToBounds = YES;
        self.imgView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.imgView];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = FONT(14);
        [self.contentView addSubview:self.nameLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.numberOfLines = 2;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping | NSLineBreakByWordWrapping;
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.font = FONT(14);
        [self.contentView addSubview:self.contentLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.textColor = RGB(150, 150, 150);
        self.timeLabel.font = FONT(13);
        [self.contentView addSubview:self.timeLabel];
        
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.textColor = [UIColor redColor];
        self.priceLabel.font = FONT(16);
        [self.contentView addSubview:self.priceLabel];
        
        self.firstImgView = [[UIImageView alloc] init];
        self.firstImgView.backgroundColor = [UIColor grayColor];
        self.firstImgView.contentMode = UIViewContentModeScaleAspectFill;
        self.firstImgView.clipsToBounds = YES;
        [self.contentView addSubview:self.firstImgView];
        
        self.secondImgView = [[UIImageView alloc] init];
        self.secondImgView.backgroundColor = [UIColor grayColor];
        self.secondImgView.contentMode = UIViewContentModeScaleAspectFill;
        self.secondImgView.clipsToBounds = YES;
        [self.contentView addSubview:self.secondImgView];
        
        self.thirdImgView = [[UIImageView alloc] init];
        self.thirdImgView.backgroundColor = [UIColor grayColor];
        self.thirdImgView.contentMode = UIViewContentModeScaleAspectFill;
        self.thirdImgView.clipsToBounds = YES;
        [self.contentView addSubview:self.thirdImgView];
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor grayColor];
        self.line.alpha = 0.6;
        [self.contentView addSubview:self.line];
        
        self.watchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.watchButton.width = SCREEN_WIDTH/3;
        [self.watchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.watchButton.titleLabel.font = FONT(13);
        [self.watchButton setImage:[UIImage imageNamed:@"guankan"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.watchButton];
        
        self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.commentButton.width = SCREEN_WIDTH/3;
        [self.commentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.commentButton.titleLabel.font = FONT(13);
        [self.commentButton setImage:[UIImage imageNamed:@"liuyan"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.commentButton];
        
        self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.starButton.width = SCREEN_WIDTH/3;
        [self.starButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.starButton.titleLabel.font = FONT(13);
        [self.starButton setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.starButton];
    }
    return self;
}
- (void)setModel:(PostListModel *)model{
    _model = model;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.face]];
    self.nameLabel.text = model.nickname;
    self.timeLabel.text = model.price;
    
    if (model.price) {
        self.priceLabel.hidden = NO;
        self.priceLabel.text = model.price;
    }else{
        self.priceLabel.hidden = YES;
    }
    //默认两行高度
    CGSize size =  [self.contentLabel sizeForString:@"1\n1" font:self.contentLabel.font constrainedToSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT)];

    CGSize contentSize = [self.contentLabel sizeForString:model.p_title font:self.contentLabel.font constrainedToSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT)];
    
    if (contentSize.height>=size.height) {
        self.contentLabel.height = size.height;
    }else{
        self.contentLabel.height = contentSize.height;
    }
    self.contentLabel.text = model.p_title;
//    if (model.images.count>0) {
//
//
//
//    }else{
//        _firstImgView.hidden = YES;
//        _secondImgView.hidden = YES;
//        _thirdImgView.hidden = YES;
//    }
    if (model.images.count == 0) {
        _firstImgView.hidden = YES;
        _secondImgView.hidden = YES;
        _thirdImgView.hidden = YES;
    }else if (model.images.count <= 1) {
        _firstImgView.hidden = NO;
        _secondImgView.hidden = YES;
        _thirdImgView.hidden = YES;
        
        PostImagesListModel *imageModel = model.images[0];
        [_firstImgView sd_setImageWithURL:[NSURL URLWithString:imageModel.img_src]];
    }else if (model.images.count <= 2){
        _firstImgView.hidden = NO;
        _secondImgView.hidden = NO;
        _thirdImgView.hidden = YES;
        PostImagesListModel *imageModel1 = model.images[0];
        [_firstImgView sd_setImageWithURL:[NSURL URLWithString:imageModel1.img_src]];
        PostImagesListModel *imageModel2 = model.images[1];
        [_secondImgView sd_setImageWithURL:[NSURL URLWithString:imageModel2.img_src]];
    }else if (model.images.count >= 3){
        _firstImgView.hidden = NO;
        _secondImgView.hidden = NO;
        _thirdImgView.hidden = NO;
        
        PostImagesListModel *imageModel1 = model.images[0];
        [_firstImgView sd_setImageWithURL:[NSURL URLWithString:imageModel1.img_src]];
        PostImagesListModel *imageModel2 = model.images[1];
        [_secondImgView sd_setImageWithURL:[NSURL URLWithString:imageModel2.img_src]];
        
        PostImagesListModel *imageModel3 = model.images[2];
        [_thirdImgView sd_setImageWithURL:[NSURL URLWithString:imageModel3.img_src]];
    }
    
    [self.watchButton setTitle:model.views forState:UIControlStateNormal];
    [self.commentButton setTitle:model.comments forState:UIControlStateNormal];
    [self.starButton setTitle:model.favorites forState:UIControlStateNormal];
    
    self.watchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    self.watchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);


    [self setNeedsLayout];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(10, 10, 50, 50);
    
    self.nameLabel.size = CGSizeMake(200, 15);
    self.nameLabel.left = self.imgView.right + 5;
    self.nameLabel.top = self.imgView.centerY - 15;
//    self.nameLabel.frame = CGRectMake(self.imgView.right + 5,self.imgView.centerY - 5, 200, 15);
    self.timeLabel.frame = CGRectMake(self.nameLabel.left, self.imgView.centerY + 5, 200, 14);
    
    self.priceLabel.right = self.width - 10;
    self.priceLabel.centerY = self.imgView.centerY;
    
    self.contentLabel.left = 10;
    self.contentLabel.width = self.width -20;
    self.contentLabel.top = self.imgView.bottom + 10;
    
    self.firstImgView.left = 10;
    self.firstImgView.top = self.contentLabel.bottom + 10;
    self.firstImgView.width = (SCREEN_WIDTH -40)/3;
    self.firstImgView.height = (SCREEN_WIDTH -40)/3;

    self.secondImgView.left = self.firstImgView.right + 10;
    self.secondImgView.top = self.contentLabel.bottom + 10;
    self.secondImgView.width = (SCREEN_WIDTH -40)/3;
    self.secondImgView.height = (SCREEN_WIDTH -40)/3;
    
    self.thirdImgView.left = self.secondImgView.right + 10;
    self.thirdImgView.top = self.contentLabel.bottom + 10;
    self.thirdImgView.width = (SCREEN_WIDTH -40)/3;
    self.thirdImgView.height = (SCREEN_WIDTH -40)/3;
    
    CGFloat y = 0;
    if(_model.images.count == 0) {
        y = self.contentLabel.bottom + 10;
    }else{
        y = self.firstImgView.bottom + 10;
    }
    self.line.frame = CGRectMake(10, y, SCREEN_WIDTH -20, 0.5);
    
    self.watchButton.frame = CGRectMake(0, self.line.bottom, SCREEN_WIDTH/3, 50);
    self.commentButton.frame = CGRectMake(SCREEN_WIDTH/3, self.line.bottom, SCREEN_WIDTH/3, 50);
    self.starButton.frame = CGRectMake(SCREEN_WIDTH/3*2, self.line.bottom, SCREEN_WIDTH/3, 50);
}
+ (CGFloat)getHeight:(PostListModel *)model{
    
    CGFloat h = 0;
    h = 10 + 10 + 50;
    
    //默认两行高度
    CGSize size =  [[UIApplication sharedApplication].keyWindow sizeForString:@"1\n1" font:FONT(14) constrainedToSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT)];
    
    CGSize contentSize = [[UIApplication sharedApplication].keyWindow sizeForString:model.p_title font:FONT(14) constrainedToSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT)];
    
    if (contentSize.height>=size.height) {
        h += size.height;
    }else{
        h += contentSize.height;
    }
    if (model.images.count != 0) {
        h = h+ (SCREEN_WIDTH -40)/3 + 10;
    }
    h = h + 10 + 50 + 5;
    return h;
}
@end
