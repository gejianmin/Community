//
//  InterPostInfoCell.h
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"

@protocol InterPostInfoCellDelegate <NSObject>

@optional
- (void)endEditPostInfo:(NSString *)message indexPath:(NSIndexPath *)indexPath;

@end

@interface InterPostInfoCell : BaseTableViewCell

@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,copy) NSString *topicText;
@property (nonatomic,weak) id<InterPostInfoCellDelegate>delegate;

@end
