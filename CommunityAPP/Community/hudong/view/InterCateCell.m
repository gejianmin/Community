//
//  InterCateCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InterCateCell.h"

@implementation InterCateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.contentView.backgroundColor = RGB(250, 250, 250);
        
        UILabel *firstLabel = [[UILabel alloc] init];
        firstLabel.backgroundColor = [UIColor whiteColor];
        firstLabel.frame = CGRectMake(0, 0, (SCREEN_WIDTH - 10)/3, 50);
        firstLabel.textAlignment = NSTextAlignmentCenter;
        firstLabel.numberOfLines = 2;
        [self.contentView addSubview:firstLabel];
        firstLabel.text = @"邻里";
        firstLabel.font =FONT(16);
        firstLabel.textColor = [UIColor redColor];
        self.firstLabel = firstLabel;
        firstLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self.firstLabel addGestureRecognizer:tap];
        firstLabel.tag = 100;
        
        self.arrowImageView = [[UIImageView alloc] init];
        self.arrowImageView.image = [UIImage imageNamed:@"xiala"];
        [self.contentView addSubview:self.arrowImageView];
        self.arrowImageView.frame = CGRectMake(firstLabel.right, 0, 10, 10);
        self.arrowImageView.centerY = firstLabel.centerY;
        
        UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
        secondButton.tag = 101;
        secondButton.backgroundColor = [UIColor whiteColor];
        secondButton.frame = CGRectMake((SCREEN_WIDTH - 10)/3 + 5, 0, (SCREEN_WIDTH - 10)/3, 50);
        [self.contentView addSubview:secondButton];
        secondButton.titleLabel.font =FONT(16);
        [secondButton setTitle:@"最新" forState:UIControlStateNormal];
        [secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.secondButton =secondButton;

        UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        thirdButton.tag = 102;
        thirdButton.backgroundColor = [UIColor whiteColor];
        thirdButton.frame = CGRectMake(SCREEN_WIDTH - (SCREEN_WIDTH - 10)/3, 0, (SCREEN_WIDTH - 10)/3, 50);
        [self.contentView addSubview:thirdButton];
        thirdButton.titleLabel.font =FONT(16);
        [thirdButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [thirdButton setTitle:@"范围" forState:UIControlStateNormal];
        self.thirdButton =thirdButton;

    }
    return self;
}

- (void)tap{
    if ([self.delegate respondsToSelector:@selector(tapSelect:)]) {
        [self.delegate tapSelect:self.firstLabel];
    }
}
@end
