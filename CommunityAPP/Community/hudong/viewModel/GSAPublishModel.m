//
//  GSAPublishModel.m
//  GreenShoesActionClient
//
//  Created by tongda ju on 2018/4/16.
//  Copyright © 2018年 赵东. All rights reserved.
//

#import "GSAPublishModel.h"

@implementation GSAPublishModel


- (instancetype)initWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle reuseIdentifier:(NSString *)reuseIdentifier buttonTitle:(NSString *)buttonTitle isHeidenMark:(BOOL )isHeidenMark selectorStatu:(NSInteger )selectorStatu content:(NSString *)content contentID:(NSString * )contentID titleName:(NSString * )titleName selecStyle:(NSInteger )selecStyle{
    if (self = [super init]) {
        self.title = title;
        self.detailTitle = detailTitle;
        self.reuseIdentifier = reuseIdentifier;
        self.buttonTitle = buttonTitle;
        self.isHeidenMark = isHeidenMark;
        self.selectorStatu = selectorStatu;
        self.content = content;
        self.contentID = contentID;
        self.titleName = titleName;
        self.selecStyle = selecStyle;
    }
    return self;
}

@end
