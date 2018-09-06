//
//  PlaceholderTextView.m
//  AppFor55BBS
//
//  Created by 周宇 on 14-1-2.
//  Copyright (c) 2014年 zol. All rights reserved.
//

#import "PlaceholderTextView.h"
@interface PlaceholderTextView ()
@property (nonatomic, retain) UIColor *realTextColor;
@property (nonatomic, weak, readonly) NSString *realText;
- (void)beginEditing:(NSNotification *)notification;
- (void)endEditing:(NSNotification *)notification;
@end

@implementation PlaceholderTextView
@synthesize realTextColor;
@synthesize placeholder;
@synthesize placeholderColor;

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //    RELEASE_SAFELY(placeholder);
    //    RELEASE_SAFELY(placeholderColor);
    //    RELEASE_SAFELY(realTextColor);
    //    [super dealloc];
}

#pragma mark -
#pragma mark Initialisation
- (id) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(beginEditing:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(endEditing:)
                                                 name:UITextViewTextDidEndEditingNotification
                                               object:self];
    self.realTextColor = self.textColor;
    self.placeholderColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.7];
}

#pragma mark -
#pragma mark Setter/Getters
- (void)setPlaceholder:(NSString *)aPlaceholder {
    if ([self.realText isEqualToString:placeholder] && ![self isFirstResponder]) {
        self.text = aPlaceholder;
    }
    if (aPlaceholder != placeholder) {
        placeholder = aPlaceholder;
    }
    [self endEditing:nil];
}

- (void)setPlaceholderColor:(UIColor *)aPlaceholderColor {
    placeholderColor = aPlaceholderColor;
    if ([super.text isEqualToString:self.placeholder]) {
        self.textColor = self.placeholderColor;
    }
}

- (NSString *)text {
    NSString *text = [super text];
    if ([text isEqualToString:self.placeholder]) return @"";
    return text;
}

- (void)setText:(NSString *)text {
    if (([text isEqualToString:@""] || text == nil) && ![self isFirstResponder]) {
        super.text = self.placeholder;
    } else {
        super.text = text;
    }
    if ([text isEqualToString:self.placeholder] || text == nil || [text isEqualToString:@""]) {
        self.textColor = self.placeholderColor;
    } else {
        self.textColor = self.realTextColor;
    }
}

- (NSString *)realText {
    return [super text];
}

- (void)beginEditing:(NSNotification *)notification {
    if ([self.realText isEqualToString:self.placeholder]) {
        super.text = nil;
        self.textColor = self.realTextColor;
    }
}

- (void)endEditing:(NSNotification *)notification {
    if ([self.realText isEqualToString:@""] || self.realText == nil) {
        super.text = self.placeholder;
        self.textColor = self.placeholderColor;
    }
}

- (void)setTextColor:(UIColor *)textColor {
    if ([self.realText isEqualToString:self.placeholder]) {
        if ([textColor isEqual:self.placeholderColor]){
            [super setTextColor:textColor];
        } else {
            self.realTextColor = textColor;
        }
    } else {
        self.realTextColor = textColor;
        [super setTextColor:textColor];
    }
}
@end
