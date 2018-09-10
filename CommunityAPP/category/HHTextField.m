//
//  HHTextField.m
//  CRMSystemClient
//
//  Created by tongda ju on 2017/5/11.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import "HHTextField.h"

@implementation HHTextField

-(id)initWithFrame:(CGRect)frame Icon:(UIImageView*)icon{
    
    if (self = [super initWithFrame:frame]) {
        
        self.leftView = icon;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame leftImageName:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.font = [UIFont systemFontOfSize:15];
        
//        self.layer.borderWidth = 2;
//        self.layer.borderColor = RGBACOLOR(228, 228, 228, 1).CGColor;
//        self.cornerRadius = 10;
//        self.background = [UIImage imageNamed:@"Rectangle"];
//        self.borderStyle = UITextBorderStyleRoundedRect;
        UIImageView *leftView =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        self.leftView = leftView;
    }
    return self;
}
-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 0;// 右偏0
    self.leftView.hidden = NO;
    return iconRect;
}
-(CGRect)textRectForBounds:(CGRect)bounds{
    CGRect textRect = [super textRectForBounds:bounds];
    textRect.origin.x += 15;// 右偏21
    return textRect;

}
-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect editingRect = [super editingRectForBounds:bounds];
    editingRect.origin.x += 15;// 右偏21
    return editingRect;
}
@end
