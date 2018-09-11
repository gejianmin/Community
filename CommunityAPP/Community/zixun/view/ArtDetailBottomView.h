//
//  ArtDetailBottomView.h
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoArt_DetailModel;
@interface ArtDetailBottomView : UIView
@property (weak, nonatomic) IBOutlet UILabel *fenxiangL;
@property (weak, nonatomic) IBOutlet UILabel *browseNumL;
@property (weak, nonatomic) IBOutlet UILabel *zanNumL;
@property (weak, nonatomic) IBOutlet UIImageView *zanImageV;
@property (weak, nonatomic) IBOutlet UIImageView *browseImageV;

@property(nonatomic, strong) InfoArt_DetailModel * model;
+ (instancetype)bottomView;

@end
