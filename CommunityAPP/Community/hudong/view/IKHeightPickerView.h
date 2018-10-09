//
//  WYHeightPickerView.h
//  WYChangeInfoDemo
//
//  Created by 意一yiyi on 2017/3/6.
//  Copyright © 2017年 意一yiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InterTopicListModel.h"

typedef void(^WYHeightPickerViewBlock)(TopicListModel * model);

@interface IKHeightPickerView : UIView

@property (strong, nonatomic) WYHeightPickerViewBlock confirmBlock;

- (void)initialRowTitle:(NSString *)title dataSource:(NSArray *)dataSource;


- (void)positionPickerRow;

@end
