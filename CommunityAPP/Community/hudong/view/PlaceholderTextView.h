//
//  PlaceholderTextView.h
//  AppFor55BBS
//
//  Created by 周宇 on 14-1-2.
//  Copyright (c) 2014年 zol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView
@property (nonatomic, assign) BOOL isAtName;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;
@end
