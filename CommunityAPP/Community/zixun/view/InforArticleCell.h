//
//  InforArticleCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "InforVillage_ArticleCateModel.h"

@interface InforArticleCell : BaseTableViewCell

@property (nonatomic ,strong) UIView *backView;
@property (nonatomic ,strong) UIImageView *imgView;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UILabel *fromLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *watchLabel;
@property (nonatomic ,strong) UIImageView *watchImgView;
@property (nonatomic ,strong) UILabel *zanLabel;
@property (nonatomic ,strong) UIImageView *zanImgView;

@property (nonatomic, strong) Village_ArticleListModel *model;
@end
