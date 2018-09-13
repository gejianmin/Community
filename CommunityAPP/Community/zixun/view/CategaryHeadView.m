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
@end
@implementation CategaryHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setCategoryArray:(NSArray *)categoryArray{
    if (_categoryArray != categoryArray) {
        
        [self removeAllSubviews];
        
        for (int i = 0; i<categoryArray.count; i++) {
            Village_ArticleCateModel *model = categoryArray[i];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor  = [UIColor whiteColor];
            [button setTitle:model.title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.frame = CGRectMake(SCREEN_WIDTH/categoryArray.count *i, 10, SCREEN_WIDTH/categoryArray.count, 50);
            [self addSubview:button];
            button.tag = 100 + i;
            [button addTarget:self action:@selector(selectCate:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i==0) {
                _tempButton = button;
                button.selected = YES;
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
