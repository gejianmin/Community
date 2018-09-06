//
//  HeaderRefreshView.m
//  KOShow
//
//  Created by llg on 16/7/26.
//
//

#import "HeaderRefreshView.h"

@implementation HeaderRefreshView

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    // 隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    self.stateLabel.hidden = YES;
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    UIImage *image = [UIImage imageNamed:@"refresh_idle"];
    [idleImages addObject:image];
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [self setImages:idleImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshingImages1 = [NSMutableArray array];
    for (NSUInteger i = 1; i<=8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_%lu", (unsigned long)i]];
        [refreshingImages1 addObject:image];
    }
    [self setImages:refreshingImages1 forState:MJRefreshStateRefreshing];
}

@end
