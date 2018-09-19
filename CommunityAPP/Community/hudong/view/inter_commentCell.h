//
//  inter_commentCell.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "interactionDetailModel.h"
#import "inter_commentModel.h"
static NSString *const kNormalCellReuseIdentifier = @"kNormalCellReuseIdentifier";
static NSString *const kCommentCellFirstReuseIdentifier = @"kCommentCellFirstReuseIdentifier";
static NSString *const kCommentCellSecondReuseIdentifier = @"kCommentCellSecondReuseIdentifier";
static NSString *const kCommentCellThirdReuseIdentifier = @"kCommentCellThirdReuseIdentifier";


@interface inter_commentCell : UITableViewCell

@property (nonatomic ,strong) UIImageView*imgView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) CustomLab *leftLabel;
@property (nonatomic ,strong) CustomLab *rightLabel;
@property (nonatomic ,strong) CustomLab *nickLabel;
@property (nonatomic ,strong) CustomLab *VIPLabel;
@property(nonatomic,strong) UIImageView  * iconIma;
@property(nonatomic,strong) UIImageView  * images;
@property(nonatomic,strong) UIView  * lineView;

@property(nonatomic,strong) interactionDetailImageModel  * headerModel;
@property(nonatomic,strong) inter_commentCellModel  * model;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;

@end
