//
//  PostCircleAddPicImageView.h
//  AppFor55BBS
//
//  Created by KepenJ on 15/10/21.
//  Copyright © 2015年 55BBS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PostCircleAddPicImageViewDelegate;
@interface PostCircleAddPicImageView : UIView
@property (nonatomic,weak) id <PostCircleAddPicImageViewDelegate> delegate;
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,strong,readonly) UIButton * delBtn;
@property (nonatomic,assign) BOOL isBigPicStatue;
@property (nonatomic,assign) NSInteger index;
@end

@protocol PostCircleAddPicImageViewDelegate <NSObject>
- (void)postCircleDeletePicImageView:(PostCircleAddPicImageView *)view;
- (void)PostCircleAddPicImageView:(PostCircleAddPicImageView *)view didSelectedIndex:(NSInteger)index;
@end