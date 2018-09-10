//
//  AreaSelectorView.h
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/7.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(void);

@interface AreaSelectorView : UIView

@property(nonatomic, copy)  ClickBlock clickBlock;//回调
@property(nonatomic, strong) UIImageView * localImageV;//位置图标
@property(nonatomic, strong) UILabel * localNameL;// 内容
@property(nonatomic, strong) UIImageView * subImageV;// 下箭头

@end
