//
//  InforAppButtonCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforAppButtonCell.h"
#import "LayerButton.h"
#import "InforVillage_AppButtonModel.h"

@interface InforAppButtonCell ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation InforAppButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:self.scrollView];
        self.scrollView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)setInfoArray:(NSArray *)infoArray{
    
    if (infoArray != _infoArray) {
        
        [self.scrollView removeAllSubviews];
        
        CGFloat w = 55;
        CGFloat h = 85;
        
        

        CGFloat left = (SCREEN_WIDTH - 55*5)/6;
        CGFloat current_left = left;
        for (int i = 0; i<infoArray.count; i++) {
            LayerButton *button = [LayerButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(current_left, 8, w, h);
            [self.scrollView addSubview:button];
            current_left = current_left + w + left;
            
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
        
        self.scrollView.contentSize = CGSizeMake(left + 60 + 10, 100);
    }
    _infoArray = infoArray;
}
- (void)selectButton:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(clickInfoAppButton:)]) {
        [self.delegate clickInfoAppButton:sender.tag-100];
    }
}
@end
