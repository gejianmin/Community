//
//  ListTableView.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListTableViewDelegate <NSObject>

- (void)close;
- (void)selectIndex:(NSInteger)index;
@end

@interface ListTableView : UIView

@property (nonatomic, assign) CGRect superRect;
@property (nonatomic, copy) NSArray *titleArray;

@property (nonatomic, weak) id<ListTableViewDelegate>delegate;
@end
