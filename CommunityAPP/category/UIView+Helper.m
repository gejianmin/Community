//
//  UIView+Helper.m
//  AppFor55BBS
//
//  Created by 周宇 on 13-11-21.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import "UIView+Helper.h"
#define kShadowViewTag 2132
#define kValidDirections [NSArray arrayWithObjects: @"top", @"bottom", @"left", @"right",nil]

@implementation UIView (Helper)

- (void)addAlpaDisplayAnimation {
    self.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
    }];
}

- (void)removeHiddenAlpaAnimation {
    self.alpha = 1.0;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
    }];
}

- (void)makeInsetShadow {
    NSArray *shadowDirections = [NSArray arrayWithObjects:@"top", @"bottom", @"left" , @"right" , nil];
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5];
    UIView *shadowView = [self createShadowViewWithRadius:3 Color:color Directions:shadowDirections];
    shadowView.tag = kShadowViewTag;
    [self addSubview:shadowView];
}

- (void)makeInsetShadowWithRadius:(float)radius Alpha:(float)alpha {
    NSArray *shadowDirections = [NSArray arrayWithObjects:@"top", @"bottom", @"left" , @"right" , nil];
//    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:alpha];
    UIColor *color = [UIColor colorWithHexStr:@"d7d7d7"];
    UIView *shadowView = [self createShadowViewWithRadius:radius Color:color Directions:shadowDirections];
    shadowView.tag = kShadowViewTag;
    [self addSubview:shadowView];
}

- (void)makeInsetShadowWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions {
    UIView *shadowView = [self createShadowViewWithRadius:radius Color:color Directions:directions];
    shadowView.tag = kShadowViewTag;
    [self addSubview:shadowView];
}

- (UIView *)createShadowViewWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions {
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    shadowView.backgroundColor = [UIColor clearColor];
    // Ignore duplicate direction
    NSMutableDictionary *directionDict = [[NSMutableDictionary alloc] init];

//    NSMutableDictionary *directionDict = [[[NSMutableDictionary alloc] init] autorelease];
    for (NSString *direction in directions)
        [directionDict setObject:@"1" forKey:direction];
    for (NSString *direction in directionDict) {
        // Ignore invalid direction
        if ([kValidDirections containsObject:direction]) {
            CAGradientLayer *shadow = [CAGradientLayer layer];
            if ([direction isEqualToString:@"top"]) {
                [shadow setStartPoint:CGPointMake(0.5, 0.0)];
                [shadow setEndPoint:CGPointMake(0.5, 1.0)];
                shadow.frame = CGRectMake(0, 0, self.bounds.size.width, radius);
            } else if ([direction isEqualToString:@"bottom"]) {
                [shadow setStartPoint:CGPointMake(0.5, 1.0)];
                [shadow setEndPoint:CGPointMake(0.5, 0.0)];
                shadow.frame = CGRectMake(0, self.bounds.size.height - radius, self.bounds.size.width, radius);
            } else if ([direction isEqualToString:@"left"]) {
                shadow.frame = CGRectMake(0, 0, radius, self.bounds.size.height);
                [shadow setStartPoint:CGPointMake(0.0, 0.5)];
                [shadow setEndPoint:CGPointMake(1.0, 0.5)];
            } else if ([direction isEqualToString:@"right"]) {
                shadow.frame = CGRectMake(self.bounds.size.width - radius, 0, radius, self.bounds.size.height);
                [shadow setStartPoint:CGPointMake(1.0, 0.5)];
                [shadow setEndPoint:CGPointMake(0.0, 0.5)];
            }
            shadow.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
            [shadowView.layer insertSublayer:shadow atIndex:0];
        }
    }
    return shadowView ;

//    return [shadowView autorelease];
}

@end
