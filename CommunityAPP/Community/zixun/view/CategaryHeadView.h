//
//  CategaryHeadView.h
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InforVillage_ArticleCateModel.h"
@protocol InfoCategaryCellDelegate <NSObject>

- (void)clickInfoCategary:(NSInteger)index;
@end
@interface CategaryHeadView : UITableViewHeaderFooterView

@property (nonatomic ,copy) NSArray *categoryArray;
@property (nonatomic, weak) id<InfoCategaryCellDelegate>delagate;

@end
