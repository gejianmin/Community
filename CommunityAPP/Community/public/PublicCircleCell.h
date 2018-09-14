//
//  PublicCircleCell.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InForPublicCirCleList_Model.h"
@interface PublicCircleCell : UICollectionViewCell
    
@property (nonatomic, strong)CustomLab * descripe_lbl;
@property (nonatomic, strong)UIImageView * descripe_View;

@property(nonatomic,strong)InForPublicCirCleList_Model * model;

@end
@interface PublicCircleView : UICollectionReusableView
    
+ (CGFloat)heightDefault;
    
@end
