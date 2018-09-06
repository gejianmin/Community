//
//  InforCarouseCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforCarouseCell.h"

@interface InforCarouseCell ()
@end

@implementation InforCarouseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.focusScrollView = [[FocusScrollView alloc] initWithFrameRect:CGRectMake(0, 0, SCREEN_WIDTH, 200) ContentSize:self.focusScrollView.frame.size];
        [self.contentView addSubview:self.focusScrollView];
    }
    return self;
}
- (void)setCarouselArray:(NSArray *)carouselArray{
    _carouselArray = carouselArray;
    [self.focusScrollView updataImagesWithArray:carouselArray];
}
@end
