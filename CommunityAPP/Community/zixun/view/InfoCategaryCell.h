//
//  InfoCategaryCell.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/14.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InforVillage_ArticleCateModel.h"

@protocol InfoCategaryCellDelegate <NSObject>

- (void)clickInfoCategary:(NSInteger)index;
@end

@interface InfoCategaryCell : UITableViewCell

@property (nonatomic ,copy) NSArray *categoryArray;

@property (nonatomic, weak) id<InfoCategaryCellDelegate>delagate;

@end
