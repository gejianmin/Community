//
//  InterCateView.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/14.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InterCateCellDelagate <NSObject>

- (void)tapSelect:(UIView *)view;

@end

@interface InterCateView : UIView

@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIButton *secondButton;
@property (nonatomic, strong) UIButton *thirdButton;

@property (nonatomic, weak) id<InterCateCellDelagate>delegate;

@end
