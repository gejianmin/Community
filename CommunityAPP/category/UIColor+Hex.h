//  Created by Jason Morrissey

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *)colorWithHexStr:(NSString *)colorStr;
+ (UIColor *)hexStringToColor:(NSString *)colorStr alpha:(CGFloat)aAlpha;
@end
