//
//  InterListCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "InterPostListModel.h"

@interface InterListCell : BaseTableViewCell
@property (nonatomic ,strong) UIImageView *imgView;
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
@property (nonatomic ,strong) UIImageView *firstImgView;
@property (nonatomic ,strong) UIImageView *secondImgView;
@property (nonatomic ,strong) UIImageView *thirdImgView;
@property (nonatomic ,strong) UIView *line;
@property (nonatomic ,strong) UIButton *watchButton;
@property (nonatomic ,strong) UIButton *commentButton;
@property (nonatomic ,strong) UIButton *starButton;

@property (nonatomic ,strong) PostListModel *model;

+ (CGFloat)getHeight:(PostListModel *)model;
@end
