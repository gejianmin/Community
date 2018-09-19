//
//  InterCateView.m
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/14.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InterCateView.h"

@implementation InterCateView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
//    self.backgroundColor = RGB(250, 250, 250);
    
    UILabel *firstLabel = [[UILabel alloc] init];
    firstLabel.backgroundColor = [UIColor whiteColor];
    firstLabel.frame = CGRectMake(0, 0, (SCREEN_WIDTH - 2)/3, 50);
    firstLabel.textAlignment = NSTextAlignmentCenter;
    firstLabel.numberOfLines = 2;
    [self addSubview:firstLabel];
    firstLabel.text = @"邻里";
    firstLabel.font =FONT(16);
    firstLabel.textColor = kColorBlack;
    self.firstLabel = firstLabel;
    firstLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.firstLabel addGestureRecognizer:tap];
    firstLabel.tag = 100;
    
    self.arrowImageView = [[UIImageView alloc] init];
    self.arrowImageView.image = [UIImage imageNamed:@"xiala"];
    [self addSubview:self.arrowImageView];
    self.arrowImageView.frame = CGRectMake(firstLabel.right, 0, 10, 10);
    self.arrowImageView.centerY = firstLabel.centerY;
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.tag = 101;
    secondButton.backgroundColor = [UIColor whiteColor];
    secondButton.frame = CGRectMake((SCREEN_WIDTH - 2)/3 + 1, 0, (SCREEN_WIDTH - 2)/3, 50);
    [self addSubview:secondButton];
    secondButton.titleLabel.font =FONT(16);
    [secondButton setTitle:@"最新" forState:UIControlStateNormal];
    [secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.secondButton =secondButton;
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdButton.tag = 102;
    thirdButton.backgroundColor = [UIColor whiteColor];
    thirdButton.frame = CGRectMake(SCREEN_WIDTH - (SCREEN_WIDTH - 2)/3, 0, (SCREEN_WIDTH - 2)/3, 50);
    [self addSubview:thirdButton];
    thirdButton.titleLabel.font =FONT(16);
    [thirdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [thirdButton setTitle:@"范围" forState:UIControlStateNormal];
    self.thirdButton =thirdButton;
//    UIView * topLineView =[[ UIView alloc]initWithFrame:CGRectMake(0, 0, HH_SCREEN_W, 1) color:kColorGray9];
//    [self addSubview:topLineView];
    UIView * lineView =[[ UIView alloc]initWithFrame:CGRectMake(0, self.height-1, HH_SCREEN_W, 1) color:kColorGray9];
    [self addSubview:lineView];
}
- (void)tap{
    if ([self.delegate respondsToSelector:@selector(tapSelect:)]) {
        [self.delegate tapSelect:self.firstLabel];
    }
}
@end
