//
//  LayerButton.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/14.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "LayerButton.h"

@implementation LayerButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, self.frame.size.width,self.frame.size.width);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, self.frame.size.width + 8,self.frame.size.width, 17);
}
@end
