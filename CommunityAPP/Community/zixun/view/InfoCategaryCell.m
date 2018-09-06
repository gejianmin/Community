//
//  InfoCategaryCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/14.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InfoCategaryCell.h"

@interface InfoCategaryCell ()
{
    UIButton *_tempButton;
}
@end

@implementation InfoCategaryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)setCategoryArray:(NSArray *)categoryArray{
    if (_categoryArray != categoryArray) {
        
        [self.contentView removeAllSubviews];
     
        for (int i = 0; i<categoryArray.count; i++) {
            Village_ArticleCateModel *model = categoryArray[i];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:model.title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.frame = CGRectMake(SCREEN_WIDTH/categoryArray.count *i, 0, SCREEN_WIDTH/categoryArray.count, 50);
            [self.contentView addSubview:button];
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
@end
