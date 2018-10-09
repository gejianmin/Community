//
//  GSAPublishCell.h
//  GreenShoesActionClient
//
//  Created by tongda ju on 2018/4/16.
//  Copyright © 2018年 赵东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSAPublishModel.h"

static NSString *const kNormalCellReuseIdentifier = @"kNormalCellReuseIdentifier";
static NSString *const kButtonCellReuseIdentifier = @"kButtonCellReuseIdentifier";
static NSString *const kButtonCellAgreeActionReuseIdentifier = @"kButtonCellAgreeActionReuseIdentifier";
static NSString *const kImageCellReuseIdentifier = @"kImageCellReuseIdentifier";
@protocol GSAPublishButtonDelegate <NSObject>
@optional

- (void)GSAPublishButton:(CustomBtn *)sender indexPath:(NSIndexPath *)currentIndexPath;
- (void)GSAPublishAgreeActionButton:(CustomBtn *)sender indexPath:(NSIndexPath *)currentIndexPath;


@end
@interface GSAPublishCell : UITableViewCell

@property(nonatomic,strong)CustomLab * title_lbl;
@property(nonatomic,strong)CustomLab * detailTitle_lbl;

@property(nonatomic,strong)UIImageView * pull_ima;
@property(nonatomic,strong)CustomBtn * descripte_btn;
@property (nonatomic,strong) UITextField * textfield;//单行输入框

@property(nonatomic,strong)UIImageView * frontcover_ima;
@property(nonatomic,strong)GSAPublishModel * model;
@property(nonatomic,weak)id <GSAPublishButtonDelegate> delegate;


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath;
typedef void(^GSAPublishCellCellCallBack)(NSString * content,NSIndexPath * indexPath);
- (void)reloadDataWithModel:(GSAPublishModel *)model indexPath:(NSIndexPath *)indexPath callBack:(GSAPublishCellCellCallBack )callback;

@property (nonatomic,copy) GSAPublishCellCellCallBack  callBack;
@property (nonatomic,strong) NSIndexPath * currentIndexPath;

@end
