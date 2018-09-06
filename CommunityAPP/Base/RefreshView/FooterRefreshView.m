//
//  FooterRefreshView.m
//  KOShow
//
//  Created by llg on 16/7/26.
//
//

#import "FooterRefreshView.h"

@implementation FooterRefreshView
#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    
    // 禁止自动加载
    self.automaticallyHidden = YES;
    
    // 隐藏状态
    self.stateLabel.hidden = YES;
    
    // 隐藏刷新状态的文字
//    self.refreshingTitleHidden = YES;
    
    // 设置idle状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    
    UIImage *image = [UIImage imageNamed:@"refresh_idle"];
    [idleImages addObject:image];
    
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_%zd", i]];
        [refreshingImages addObject:image];
    }
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}
@end
