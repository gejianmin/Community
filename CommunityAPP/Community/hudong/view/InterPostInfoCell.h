//
//  InterPostInfoCell.h
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "GSAPublishModel.h"

static NSString *const kInputCellReuseIdentifier = @"kInterCellReuseIdentifier";
static NSString *const kSelectCellReuseIdentifier = @"kSelectCellReuseIdentifier";

@protocol InterPostInfoCellDelegate <NSObject>

@optional
- (void)endEditPostInfo:(NSString *)message indexPath:(NSIndexPath *)indexPath;

@end

@interface InterPostInfoCell : BaseTableViewCell

@property (nonatomic,copy) GSAPublishModel *model;

@property (nonatomic,copy) NSString *topicText;
@property (nonatomic,weak) id<InterPostInfoCellDelegate>delegate;
typedef void(^cellCallBack)(NSString * content,NSIndexPath * indexPath);
@property (nonatomic,copy) cellCallBack  callBack;
@property (nonatomic,strong) NSIndexPath * currentIndexPath;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
- (void)reloadDataWithModel:(GSAPublishModel *)model indexPath:(NSIndexPath *)indexPath callBack:(cellCallBack )callback;

@end
