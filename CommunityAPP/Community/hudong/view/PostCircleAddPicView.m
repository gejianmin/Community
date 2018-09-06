//
//  PostCircleAddPicView.m
//  AppFor55BBS
//
//  Created by KepenJ on 15/10/21.
//  Copyright © 2015年 55BBS. All rights reserved.
//
#import "PostCircleAddPicView.h"
#import "PostCircleAddPicImageView.h"
@interface PostCircleAddPicView () <PostCircleAddPicImageViewDelegate>
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) UIButton * addPicBtn;
@property (nonatomic,strong) NSMutableArray * picArray;
@property (nonatomic,strong) PostCircleAddPicImageView * tapView;
@property (nonatomic,assign) CGRect tapViewOriginRect;
@end

@implementation PostCircleAddPicView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareViews];
        _picArray = [NSMutableArray array];
    }
    return self;
}
#pragma mark -
#pragma mark -PrepareViews
- (void)prepareViews {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
}

#pragma mark -
#pragma mark -逻辑方法
- (void)setImgArray:(NSArray *)imgArray {
    _imgArray = imgArray;
    [self updatePicViews];
}
- (void)updatePicViews {
    for (UIView * view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    if (_picArray) {
        [_picArray removeAllObjects];
    }
    for (UIView * view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    UIImage * addBtnImage = [UIImage imageNamed:@"PostCircleAddPicBtnImage"];
    if (_imgArray && (_imgArray.count > 0 && _imgArray.count < 9)) {
        for (int i = 0; i < _imgArray.count; i++) {
            PostCircleAddPicImageView *imageView = [[PostCircleAddPicImageView alloc]initWithFrame:CGRectMake(i*(addBtnImage.size.width +10)+ 10, (self.height-addBtnImage.size.height)/2.0f+8, addBtnImage.size.width, addBtnImage.size.height)];
            imageView.delegate = self;
            imageView.index = i;
            imageView.image = _imgArray[i];
            [_scrollView addSubview:imageView];
            [_picArray addObject:imageView];
        }
        if (!_addPicBtn) {
            _addPicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_addPicBtn setBackgroundImage:addBtnImage forState:UIControlStateNormal];
            [_addPicBtn addTarget:self action:@selector(tapAddBtn) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            _addPicBtn.hidden = NO;
        }
        _addPicBtn.frame = CGRectMake(_imgArray.count*(addBtnImage.size.width+10)+10, (self.height-addBtnImage.size.height)/2.0f+8, addBtnImage.size.width, addBtnImage.size.height);
        [_scrollView addSubview:_addPicBtn];
        [_scrollView setContentSize:CGSizeMake((_imgArray.count + 1)*(_addPicBtn.width + 10), self.height)];
    }
    else if (_imgArray && _imgArray.count == 9) {
        for (int i = 0; i < _imgArray.count; i++) {
            PostCircleAddPicImageView * imageView = [[PostCircleAddPicImageView alloc] initWithFrame:CGRectMake(i*(addBtnImage.size.width+10), (self.height-addBtnImage.size.height)/2.0f+8, addBtnImage.size.width, addBtnImage.size.height)];
            imageView.delegate = self;
            imageView.index = i;
            imageView.image = _imgArray[i];
            [_scrollView addSubview:imageView];
            [_picArray addObject:imageView];
        }
        if (_addPicBtn) {
            _addPicBtn.hidden = YES;
        }
        [_scrollView setContentSize:CGSizeMake((_imgArray.count)*(addBtnImage.size.width+10), self.height)];
    }
    else {
        if (!_addPicBtn) {
            _addPicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_addPicBtn setBackgroundImage:addBtnImage forState:UIControlStateNormal];
            [_addPicBtn addTarget:self action:@selector(tapAddBtn) forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            _addPicBtn.hidden = NO;
        }
        _addPicBtn.frame = CGRectMake(10, (self.height-addBtnImage.size.height)/2.0f+8, addBtnImage.size.width, addBtnImage.size.height);
        [_scrollView addSubview:_addPicBtn];
        [_scrollView setContentSize:CGSizeMake(_addPicBtn.width+10, self.height)];
    }
}
- (void)tapAddBtn {
    if ([self.delegate respondsToSelector:@selector(postCircleAddPicViewDidTapAddPicBtn)]) {
        [self.delegate postCircleAddPicViewDidTapAddPicBtn];
    }
}
- (void)updatePostCircleAddPicImageViewFrame {
    if (_picArray && _picArray.count != 0) {
        for (int i = 0;i < _picArray.count;i++) {
            __weak PostCircleAddPicImageView * view = _picArray[i];
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.25 animations:^{
                view.frame = CGRectMake(i*(view.width+10)+10, view.top, view.width, view.height);
                weakSelf.addPicBtn.frame = CGRectMake(_picArray.count *(weakSelf.addPicBtn.height+10)+10,_addPicBtn.top, _addPicBtn.width, _addPicBtn.height);
            } completion:^(BOOL finished) {
                ;
            }];
        }
    }
    else {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.addPicBtn.frame = CGRectMake(10, _addPicBtn.top,_addPicBtn.width, _addPicBtn.height);
        } completion:^(BOOL finished) {
            ;
        }];
    }
}
#pragma mark -
#pragma mark -PostCircleAddPicImageViewDelegate
- (void)postCircleDeletePicImageView:(PostCircleAddPicImageView *)view {
    [view removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(postCircleAddPicVIewDidDeleteImageAtIndex:)]) {
        [self.delegate postCircleAddPicVIewDidDeleteImageAtIndex:[_picArray indexOfObject:view]];
    }
    [_picArray removeObject:view];
    [self updatePostCircleAddPicImageViewFrame];

}
- (void)PostCircleAddPicImageView:(PostCircleAddPicImageView *)view didSelectedIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(postCircleAddPicVIewDidSelectedImageAtIndex:)]) {
        [self.delegate postCircleAddPicVIewDidSelectedImageAtIndex:index];
    }
}
@end
