//
//  InforADCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InforADView.h"

@protocol InforADCellDelegate <NSObject>

- (void)clickAD:(NSInteger)index;
@end

@interface InforADCell : UITableViewCell

@property (nonatomic, strong) NSArray *adArray;
@property (nonatomic, weak) id<InforADCellDelegate>delegate;
@end
