//
//  LayoutButton.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/1.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "LayoutButton.h"

@interface LayoutButton ()
{
    NSString *_imageName;
    NSString *_title;
}
@end

@implementation LayoutButton

+ (instancetype)initWithLayoutButton:(NSString *)imageName title:(NSString *)title font:(int)font{

    return [[LayoutButton alloc] initWithLayoutButton:imageName title:title font:font];
    
}

- (instancetype)initWithLayoutButton:(NSString *)imageName title:(NSString *)title font:(int)font{
    
    if (self = [super initWithFrame:CGRectZero]) {
        
        _imageName = imageName;
        _title = title;
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = FONT(font);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        NSLog(@"333");

    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    UIImage *image = [UIImage imageNamed:_imageName];
    return CGRectMake((self.bounds.size.width - image.size.width)/2, 0, image.size.width, image.size.width);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    UIImage *image = [UIImage imageNamed:_imageName];
    return CGRectMake(0, image.size.height + 10, self.bounds.size.width, 15);
}
@end
