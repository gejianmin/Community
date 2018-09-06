//
//  FocusScrollView.h
//  AppFor55BBS
//
//  Created by 夏银 on 14-7-4.
//  Copyright (c) 2014年 zol. All rights reserved.
//

/*********************************
 * 作者		:xiayin
 * 版本号		:4.0.4
 * 描述		:自动循环轮播ScrollView
 **********************************/
#import <UIKit/UIKit.h>
#import "PageControl.h"

@protocol FocusScrollViewDelegate;
@interface FocusScrollView : UIView <UIScrollViewDelegate>
{
    CGRect _viewSize;
    CGFloat _targetX;
    UIScrollView *_scrollView;
    NSMutableArray * _titleArr;
    NSArray * _imagesArr;
    PageControl *_pageControl;
    int _currentPageIndex;
    UILabel *_noteTitle;
    UIView * _maskView;
    NSArray *_hotToppicArr;
}
@property (nonatomic,strong) NSArray *imagesArr;
@property (nonatomic,weak) id <FocusScrollViewDelegate> delegate;
@property (nonatomic,assign) BOOL scrollViewBounces;
/**
 *  创建自动循环轮播ScrollView
 *
 *  @author xiayin
 *  @version v4.0.4
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (id)initWithFrameRect:(CGRect)rect ContentSize:(CGSize)contentSize;
/**
 *  完成创建后调用数据更新
 *
 *  @author xiayin
 *  @version v4.0.4
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (void)updataImagesWithArray:(NSArray *)hotToppicArr;
- (void)startAnimation;
- (void)endAnimation;
@end

@protocol FocusScrollViewDelegate <NSObject>
@optional
- (void)fScrollViewDidClicked:(NSInteger)index;


@end
