//
//  PostCircleAddPicImageView.m
//  AppFor55BBS
//
//  Created by KepenJ on 15/10/21.
//  Copyright © 2015年 55BBS. All rights reserved.
//

#import "PostCircleAddPicImageView.h"
@interface PostCircleAddPicImageView ()
@property (nonatomic,strong) UIButton * delBtn;
@property (nonatomic,assign) CGRect originRect;
@property (nonatomic,strong) UIImageView * imageView;
@end

@implementation PostCircleAddPicImageView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _originRect = frame;
        _isBigPicStatue = NO;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToBigPic)];
        [self addGestureRecognizer:tap];
        [self prepareViews];
    }
    return self;
}

- (void)prepareViews {
    UIImage * delImage = [UIImage imageNamed:@"PostCircleDelBtnImage"];
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width ,self.height)];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        
    }
//    if (!_editedLabel) {
//        _editedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, RectH(self.frame)-25, RectW(self.frame), 25)];
//        _editedLabel.alpha = 0.7;
//        _editedLabel.backgroundColor = [UIColor blackColor];
//        _editedLabel.text = @"编辑";
//        _editedLabel.font = Font_14;
//        _editedLabel.textAlignment = NSTextAlignmentCenter;
//        _editedLabel.userInteractionEnabled = YES;
//        _editedLabel.textColor = [UIColor whiteColor];
//        [self addSubview:_editedLabel];
//    }
    if (!_delBtn) {
        _delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _delBtn.frame = CGRectMake(self.width - delImage.size.width-3, 3, delImage.size.width, delImage.size.height);
        [_delBtn setBackgroundImage:delImage forState:UIControlStateNormal];
        [_delBtn addTarget:self action:@selector(delPic) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_delBtn];
    }
}
- (void)delPic {
    if ([self.delegate respondsToSelector:@selector(postCircleDeletePicImageView:)]) {
        [self.delegate postCircleDeletePicImageView:self];
    }
}
- (void)goToBigPic {
    if ([self.delegate respondsToSelector:@selector(PostCircleAddPicImageView:didSelectedIndex:)]) {
        [self.delegate PostCircleAddPicImageView:self didSelectedIndex:self.index];
    }
}
- (void)setImage:(UIImage *)image {
    _image = image;
    _imageView.image = image;
}
@end
