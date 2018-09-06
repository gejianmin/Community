//
//  UIImage+Helper.h
//  AppFor55BBS
//
//  Created by 周宇 on 13-12-1.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import <UIKit/UIKit.h>
enum {
    enSvCropClip,               // the image size will be equal to orignal image, some part of image may be cliped
    enSvCropExpand,             // the image size will expand to contain the whole image, remain area will be transparent
};
typedef NSInteger SvCropMode;

@interface UIImage (Helper)

/**
 *  图片压缩
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (UIImage *)compressedImage;
- (CGFloat)compressionQuality;
- (NSData *)compressedData;
- (NSData *)compressedData:(CGFloat)compressionQuality;

/**
 *  图片截圆形
 *
 *  @author zhouyu
 *  @version v4.0.0
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (UIImage *)ellipseWithBorder:(CGFloat)border widthWithInset:(CGFloat)inset;

/**
 *  图片圆角化
 *
 *  @author xiayin
 *  @version v4.0.6
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

/**
 *  图片大小修改
 *
 *  @author xiayin
 *  @version v4.4.0
 *  @修改历史
 *   修改版本    作者名     修改明细
 */
- (UIImage *)scaleImage:(UIImage *)img ToSize:(CGSize)itemSize;

- (UIImage*)fixOrientation;

- (UIImage*)rotateImageWithRadian:(CGFloat)radian cropMode:(SvCropMode)cropMode;

- (UIImage*)getSubImage:(CGRect)rect;
+ (UIImage *)createRandomColorImage;
+ (UIImage *)fixOrientation:(UIImage *)aImage;
@end
