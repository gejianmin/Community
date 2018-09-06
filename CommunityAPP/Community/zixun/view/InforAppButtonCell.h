//
//  InforAppButtonCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"

@protocol InforAppButtonCellDelegate <NSObject>

- (void)clickInfoAppButton:(NSInteger)index;
@end

@interface InforAppButtonCell : BaseTableViewCell

@property (nonatomic, copy) NSArray *infoArray;
@property (nonatomic, weak) id <InforAppButtonCellDelegate>delegate;
@end
