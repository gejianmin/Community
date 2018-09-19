//
//  InteractionAppButtonCell.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/14.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "InforVillage_AppButtonModel.h"
@protocol InforAppButtonCellDelegate <NSObject>

- (void)clickInfoAppButton:(NSInteger)index;
@end
@interface InteractionAppButtonCell : BaseTableViewCell

@property (nonatomic, copy) NSArray *infoArray;
@property (nonatomic, weak) id <InforAppButtonCellDelegate>delegate;
+ (CGFloat)getHeight:(NSInteger )count;
@end
