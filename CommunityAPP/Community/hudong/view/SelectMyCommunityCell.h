//
//  SelectMyCommunityCell.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/28.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearCommunityModel.h"
@interface SelectMyCommunityCell : UITableViewCell

@property(nonatomic,strong)CustomLab * title_lbl;
@property(nonatomic,strong)CustomLab * detailTitle_lbl;
//- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
@end

@interface MyCommunityCell : UITableViewCell

@property(nonatomic,strong)CustomLab * title_lbl;
@property(nonatomic,strong)CustomLab * detailTitle_lbl;
@property(nonatomic,strong)CustomLab * mark_lbl;
@property(nonatomic,strong)GetCommunityModel * model;


@end
