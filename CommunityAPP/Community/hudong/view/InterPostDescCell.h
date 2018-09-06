//
//  InterPostDescCell.h
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InterPostDescCellDelagate <NSObject>

@optional
- (void)endEditPostMessage:(NSString *)message;
- (void)endEditPostTitle:(NSString *)title;
- (void)endEditPostPics:(NSString *)array;
- (void)addButtonDidTap:(NSInteger)picCount;
@end

@interface InterPostDescCell : UITableViewCell

@property (nonatomic,weak) id<InterPostDescCellDelagate>delegate;
@property (nonatomic, strong) NSMutableArray *picArray;
@end
