//
//  PaletteColorModel.m
//  iOSPalette
//
//  Created by 凡铁 on 17/6/6.
//  Copyright © 2017年 DylanTang. All rights reserved.
//

#import "PaletteColorModel.h"

@implementation PaletteColorModel

- (NSString *)imageColorValue {
    NSString * reslult = [self.imageColorString substringFromIndex:1];
    NSString * resultTemp = [NSString stringWithFormat:@"0x%@",reslult];
    return resultTemp;
}
@end
