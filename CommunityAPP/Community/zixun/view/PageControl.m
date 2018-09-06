//
//  PageControl.m
//  AppFor55BBS
//
//  Created by 周宇 on 13-11-12.
//  Copyright (c) 2013年 zol. All rights reserved.
//

#import "PageControl.h"

@implementation PageControl

- (void)dealloc
{
    
}

- (id)initWithFrame:(CGRect)frame {

    self= [super initWithFrame:frame];
    if ([self respondsToSelector:@selector(setCurrentPageIndicatorTintColor:)] && [self respondsToSelector:@selector(setPageIndicatorTintColor:)]) {
        [self setCurrentPageIndicatorTintColor:[UIColor clearColor]];
        [self setPageIndicatorTintColor:[UIColor clearColor]];
    }
    
    [self setBackgroundColor:[UIColor clearColor]];
    self.activeImage = [UIImage imageNamed:@"PlazaPageControlNormalImage"];
    self.inactiveImage = [UIImage imageNamed:@"PlazaPageControlSelectedImage"];
    _kSpacing = 10.0f;

    self.usedToRetainOriginalSubview = [NSArray arrayWithArray:self.subviews];
    for (UIView *su in self.subviews) {
        [su removeFromSuperview];
    }
    self.contentMode = UIViewContentModeRedraw;
    return self;
}
- (void)setActiveImage:(UIImage *)activeImage {
    if (activeImage && _activeImage != activeImage) {
        _activeImage = activeImage;
    }
}
- (void)setInactiveImage:(UIImage *)inactiveImage {
    if (inactiveImage && _inactiveImage != inactiveImage) {
        _inactiveImage = inactiveImage;
    }
}
- (void)updateDots {
    for (int i = 0; i< [self.subviews count]; i++) {
        UIImageView* dot =[self.subviews objectAtIndex:i];
        if (i == self.currentPage) {
            if ([dot respondsToSelector:@selector(setImage:)]) {
                dot.image=_activeImage;
            }
        } else {
            if ([dot respondsToSelector:@selector(setImage:)]) {
                dot.image=_inactiveImage;
            }
        }
    }
}

- (void)setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    if ([[[UIDevice currentDevice]systemVersion]floatValue] <=7.0) {
        [self updateDots];
    }
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    [super setNumberOfPages:numberOfPages];
    if ([[[UIDevice currentDevice]systemVersion]floatValue] <=7.0) {
        [self updateDots];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)iRect {
    if (_activeImage && _inactiveImage){//加个判断
        int i;
        CGRect rect;
        UIImage *image;
        if ( self.hidesForSinglePage && self.numberOfPages == 1 ) return;
        rect.origin.x = (self.bounds.size.width - (_activeImage.size.width+(self.numberOfPages-1)*(_inactiveImage.size.width+_kSpacing)))/2.0;
        iRect.origin.y = (self.bounds.size.height - ((_activeImage.size.height > _inactiveImage.size.height)?_activeImage.size.height:_inactiveImage.size.height))/2.0;
        float offlist = fabs(_inactiveImage.size.width - _activeImage.size.width)/2.0;
        for ( i = 0; i < self.numberOfPages; ++i ) {
            image = i == self.currentPage ? _activeImage : _inactiveImage;
            if (_activeImage.size.height > _inactiveImage.size.height) {
                rect = CGRectMake(rect.origin.x, (i == self.currentPage)?iRect.origin.y:(iRect.origin.y+offlist), image.size.width, image.size.height);
            }
            else {
                rect = CGRectMake(rect.origin.x, (i == self.currentPage)?(iRect.origin.y+offlist):iRect.origin.y, image.size.width, image.size.height);
            }
            [image drawInRect: rect];
            rect.origin.x += image.size.width + _kSpacing;
        }
    } else {
        [super drawRect:iRect];
    }    
}

@end
