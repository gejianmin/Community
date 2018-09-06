//
//  InterCateCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InterCateCellDelagate <NSObject>

- (void)tapSelect:(UIView *)view;
@end

@interface InterCateCell : UITableViewCell

@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIButton *secondButton;
@property (nonatomic, strong) UIButton *thirdButton;

@property (nonatomic, weak) id<InterCateCellDelagate>delegate;

@end
