//
//  BlowClickButton.m
//  AppFor55BBS
//
//  Created by KepenJ on 2016/12/1.
//  Copyright © 2016年 55BBS. All rights reserved.
//

#import "BlowClickButton.h"

@implementation BlowClickButton

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
//
//{
//    
//    CGRect bounds =self.bounds;
//
//    CGFloat widthDelta =44.0- bounds.size.width;
//    
//    CGFloat heightDelta =44.0- bounds.size.height;
//    
//    bounds =CGRectInset(bounds, -0.5* widthDelta, -0.5* heightDelta);//注意这里是负数，扩大了之前的bounds的范围
//    
//    return CGRectContainsPoint(bounds, point);
//    
//}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    CGRect rectBig = CGRectInset(self.bounds, -(44/2), -(44/2));
    
    if (CGRectContainsPoint(rectBig, point)) {
        return self;
    }else{
        return nil;
    }
    
    return self;
}
@end
