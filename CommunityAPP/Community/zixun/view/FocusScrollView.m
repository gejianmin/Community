//
//  FocusScrollView.m
//  AppFor55BBS
//
//  Created by 夏银 on 14-7-4.
//  Copyright (c) 2014年 zol. All rights reserved.
//

#import "FocusScrollView.h"
#import "UIView+Common.h"
#import "InforVillage_CarouselModel.h"
#import "UIImage+Helper.h"

#define kTitleLabelHeigh 33
#define kTitleLabelBGColor [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5]
#define kSwitchFocisPicTime 3
@implementation FocusScrollView
#pragma mark -
#pragma mark --Init--
- (void)dealloc {
    
}
- (id)initWithFrameRect:(CGRect)rect ContentSize:(CGSize)contentSize{
    if ((self=[super initWithFrame:rect])) {
        self.userInteractionEnabled = YES;
        _titleArr = [[NSMutableArray alloc]initWithCapacity:0];
        [self configTheViewsWithFrame:rect ContentSize:contentSize];
    }
    return self;
}
#pragma mark -
#pragma mark --Public method--
- (void)modelHandle:(NSArray *)hotToppicArr {
    _hotToppicArr = hotToppicArr;
    //导入数据处理，随其进行相关需要的数据封装
    NSMutableArray * tempImagesArr = [NSMutableArray arrayWithCapacity:hotToppicArr.count];
    if (_titleArr.count != 0) {
        [_titleArr removeAllObjects];
    }
    for (Village_CarouselModel * model in hotToppicArr) {
        [tempImagesArr addObject:model.ad_thumb];
        [_titleArr addObject:model.ad_name];
    }
    NSMutableArray *tempArray=[NSMutableArray arrayWithArray:tempImagesArr];
    [tempArray insertObject:[tempImagesArr objectAtIndex:([tempImagesArr count]-1)] atIndex:0];
    [tempArray addObject:[tempImagesArr objectAtIndex:0]];
    self.imagesArr = [NSArray arrayWithArray:tempArray];
    
}

- (void)configTheViewsWithFrame:(CGRect)rect ContentSize:(CGSize)contentSize {
    _viewSize = rect;
    if (!_scrollView) {
        //焦点背景scrollview
        UIScrollView * scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0,
                                                                                  0,
                                                                                  _viewSize.size.width,
                                                                                  _viewSize.size.height)];
        _scrollView = scrollview;
        _scrollView.bounces = self.scrollViewBounces;
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = contentSize;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
    }
    // 焦点图PageControl
    _pageControl = [[PageControl alloc] initWithFrame:CGRectMake((self.width-100)/2.0f,
                                                                 self.height-20,
                                                                 100,
                                                                 20)];
    _pageControl.backgroundColor = [UIColor clearColor];
    
    _pageControl.numberOfPages = 0;
    [_pageControl setCurrentPage:0];
    _pageControl.userInteractionEnabled = NO;
    [self addSubview:_pageControl];
    
}
- (void)updataImagesWithArray:(NSArray *)hotToppicArr {
    _hotToppicArr = hotToppicArr;
    if (hotToppicArr.count != 0)
    {
        [self modelHandle:hotToppicArr];
        if (_scrollView) {
            // 移除子视图
            NSArray *scrollSubViewArray = [_scrollView  subviews];
            for (UIView *actView  in scrollSubViewArray) {
                if ([actView isKindOfClass:[UIImageView class]]) {
                    [actView removeFromSuperview];
                }
            }
            NSInteger pageCounts = self.imagesArr.count;
            _scrollView.bounces = self.scrollViewBounces;
            [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*pageCounts,
                                                   _scrollView.frame.size.height)];
            
            if (pageCounts > 0) {
                //添加子视图
                for (int i=0; i<pageCounts; i++) {
                    UIImageView *topicImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*i,
                                                                                                0,
                                                                                                _scrollView.frame.size.width,
                                                                                                _scrollView.frame.size.height)];
                    topicImageView.backgroundColor = [UIColor colorWithHexStr:@"dfdfdf"];
                    topicImageView.userInteractionEnabled = YES;
                    topicImageView.contentMode = UIViewContentModeScaleAspectFill;
                    [topicImageView sd_setImageWithURL:[self.imagesArr objectAtIndex:i] placeholderImage:[UIImage createRandomColorImage]];
                    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                 action:@selector(imagePressed:)];
                    [topicImageView addGestureRecognizer:tapGesture];
                    [_scrollView addSubview:topicImageView];
                }
            }
            [self resetPageControl];
            [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:kSwitchFocisPicTime];
        } else {
            
        }
    }
}
/** 更新PageControl控件 */
- (void)resetPageControl {
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width,
                                              0)];
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = self.imagesArr.count - 2 ;
    _pageControl.currentPage = 0;
}
/** 更新pageControll */
- (void)changeThePageControll {
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _currentPageIndex = page;
    long titleIndex = page - 1;
    if (titleIndex >= [self.imagesArr count]) {
        titleIndex = 0;
    }
    if (titleIndex < 0) {
        titleIndex = [_imagesArr count] - 1;
    }
    _pageControl.currentPage = titleIndex;
}

#pragma mark -
#pragma mark --AutoScroll--
/** 自动播放 */
- (void)switchFocusImageItems {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];
    _targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
    [self scrollViewIsBouncesNow];
    [self moveToTargetPosition:_targetX];
    
    [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:kSwitchFocisPicTime];
}
- (void)moveToTargetPosition:(CGFloat)targetX {
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES];
}
#pragma mark -
#pragma mark --UIScrollViewDelegate--
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    [self changeThePageControll];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewIsBouncesNow];
}
#pragma mark -
#pragma mark --FScrollViewDelegate--
- (void)imagePressed:(UITapGestureRecognizer *)sender {
    if ([_delegate respondsToSelector:@selector(fScrollViewDidClicked:)]) {
        [_delegate fScrollViewDidClicked:_pageControl.currentPage];
    }
}
#pragma mark -
#pragma mark --逻辑方法
/** 检测是否到头 */
- (void)scrollViewIsBouncesNow {
    if (_currentPageIndex == 0) {
        
        [_scrollView setContentOffset:CGPointMake(([self.imagesArr count] - 2)*_viewSize.size.width,
                                                  0)];
    }
    if (_currentPageIndex == ([self.imagesArr count] - 1)) {
        
        [_scrollView setContentOffset:CGPointMake(_viewSize.size.width,
                                                  0)];
        _targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
    }
}
- (void)endAnimation {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];
}
- (void)startAnimation {
    [self performSelector:@selector(switchFocusImageItems) withObject:nil afterDelay:kSwitchFocisPicTime];
}
@end

