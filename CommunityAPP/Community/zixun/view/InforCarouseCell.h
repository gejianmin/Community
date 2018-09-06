//
//  InforCarouseCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "FocusScrollView.h"

@interface InforCarouseCell : BaseTableViewCell

@property (nonatomic, copy) NSArray *carouselArray;
@property (nonatomic, strong) FocusScrollView *focusScrollView;
@end
