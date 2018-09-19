//
//  inter_commentHeaderView.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/18.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "interactionDetailModel.h"
@interface inter_commentHeaderView : UIView
@property (nonatomic ,strong) UIImageView * iconIma;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) CustomLab *leftLabel;
@property (nonatomic ,strong) CustomLab *VIPLabel;
@property (nonatomic ,strong) CustomLab *nickLabel;
@property (nonatomic ,strong) CustomBtn *postBtn;
@property(nonatomic,strong) interactionDetailModel  * model;
@end
