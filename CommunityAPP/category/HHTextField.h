//
//  HHTextField.h
//  CRMSystemClient
//
//  Created by tongda ju on 2017/5/11.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHTextField : UITextField

-(id)initWithFrame:(CGRect)frame Icon:(UIImageView*)icon;

- (instancetype)initWithFrame:(CGRect)frame leftImageName:(NSString *)imageName;
@end
