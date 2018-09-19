//
//  InteractionAppButtonCell.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/14.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InteractionAppButtonCell.h"

#import "LayerButton.h"

@interface InteractionAppButtonCell ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation InteractionAppButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)setInfoArray:(NSArray *)infoArray{
    
    if (infoArray != _infoArray) {
        CGFloat w = 55;
        CGFloat h = 85;
        NSInteger COL_COUNT = 5;
        NSInteger count = infoArray.count;
        for (int i = 0; i<count; i++) {
            NSInteger row = i / COL_COUNT;
            
            NSInteger col = i % COL_COUNT;
            CGFloat margin = (self.bounds.size.width - (w * COL_COUNT)) / (COL_COUNT + 1);
            CGFloat picX = margin + (w + margin) * col;
            CGFloat picY = margin + (h + margin) * row;
            LayerButton *button = [LayerButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(picX, picY, w, h);
            [self addSubview:button];
            
            Village_AppButtonModel *model = infoArray[i];
            [button setTitle:model.title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = FONT(12);
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button.imageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
                [button setImage:image forState:UIControlStateNormal];
                
            }];
            [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100 +i;
        }
        
    }
    _infoArray = infoArray;
}
+ (CGFloat)getHeight:(NSInteger )count{
    NSInteger COL_COUNT = 5;
    CGFloat w = 55;
    CGFloat h = 85;
    for (int i = 0; i<count; i++) {
        NSInteger row = i / COL_COUNT;
    CGFloat margin = (HH_SCREEN_W - (w * COL_COUNT)) / (COL_COUNT + 1);
    CGFloat picY = margin + (h + margin) * row;
        h = picY + 80;
    }
    return h;
}
- (void)selectButton:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(clickInfoAppButton:)]) {
        [self.delegate clickInfoAppButton:sender.tag-100];
    }
}
@end
