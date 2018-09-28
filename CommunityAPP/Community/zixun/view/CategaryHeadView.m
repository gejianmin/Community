//
//  CategaryHeadView.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/12.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "CategaryHeadView.h"
@interface CategaryHeadView ()
{
    UIButton *_tempButton;
}

@property(nonatomic, strong) UIView * itemView;/** 下标线*/
@end
@implementation CategaryHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setCategoryArray:(NSArray *)categoryArray{
    if (_categoryArray != categoryArray) {
        [self removeAllSubviews];
        UIView *view = [[UIView alloc]initWithFrame:self.bounds];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        
        
        for (int i = 0; i<categoryArray.count; i++) {
            Village_ArticleCateModel *model = categoryArray[i];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.backgroundColor  = [UIColor orangeColor];
            [button setTitle:model.title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.frame = CGRectMake(SCREEN_WIDTH/categoryArray.count *i, 20, SCREEN_WIDTH/categoryArray.count, 50);
            [self addSubview:button];
            button.tag = 100 + i;
            [button addTarget:self action:@selector(selectCate:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i==0) {
                _tempButton = button;
                button.selected = YES;
                // 用动画搞出下划线跟随滑动效果
                self.itemView = [[UIView alloc]initWithFrame:CGRectMake(_tempButton.left, _tempButton.top+_tempButton.height + 5, _tempButton.width, 2)];
                self.itemView.backgroundColor = [UIColor redColor];
                [self addSubview:_itemView];
            }
            
            
            
            
        }
        
    }
    _categoryArray = categoryArray;
}

- (void)selectCate:(UIButton *)sender{
    
    if (_tempButton == nil) {
        sender.selected = YES;
        _tempButton = sender;
    }else if (_tempButton != nil && sender == _tempButton){
        
    }else if (_tempButton != nil &&sender != _tempButton){
        _tempButton.selected = NO;
        sender.selected = YES;
        _tempButton = sender;
        
        // 移动下标
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:30 options:UIViewAnimationOptionCurveLinear animations:^{
            self.itemView.centerX = _tempButton.centerX;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if ([self.delagate respondsToSelector:@selector(clickInfoCategary:)]) {
        [self.delagate clickInfoCategary:sender.tag - 100];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
