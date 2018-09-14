//
//  SetUpTableViewCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"

static NSString *const kNormalCellReuseIdentifier = @"kNormalCellReuseIdentifier";
static NSString *const kImageCellReuseIdentifier = @"kImageCellReuseIdentifier";
static NSString *const kSwichCellReuseIdentifier = @"kSwichCellReuseIdentifier";

@interface SetUpTableViewCell : BaseTableViewCell
    
@property (nonatomic ,strong) UIImageView*imgView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) CustomLab *leftLabel;
@property (nonatomic ,strong) CustomLab *rightLabel;
@property (nonatomic ,strong) CustomLab *nickLabel;
@property (nonatomic ,strong) CustomLab *VIPLabel;
@property(nonatomic,strong) UIImageView  * iconIma;
-(BOOL)isMessageNotificationServiceOpen;
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
    @end
