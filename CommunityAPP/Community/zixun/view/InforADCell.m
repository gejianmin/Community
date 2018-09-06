//
//  InforADCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforADCell.h"

@interface InforADCell ()

@end
@implementation InforADCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = RGB(240, 240, 240);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
- (void)setAdArray:(NSArray *)adArray{
    if (adArray !=_adArray) {
        for (int i = 0; i<adArray.count; i++) {
            Village_ADModel *admodel = adArray[i];
            InforADView *adView = [[InforADView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2 + 2.5 )*(i%2), 82.5*(i/2), SCREEN_WIDTH/2 - 2.5, 77.5)];
            [self.contentView addSubview:adView];
            adView.tag = 100 +i;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [adView addGestureRecognizer:tap];
            adView.model = admodel;
        }
    }
    _adArray = adArray;
}
- (void)tap:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(clickAD:)]) {
        [self.delegate clickAD:tap.view.tag - 100];
    }
}
@end
