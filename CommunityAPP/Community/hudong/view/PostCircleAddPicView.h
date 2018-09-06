//
//  PostCircleAddPicView.h
//  AppFor55BBS
//
//  Created by KepenJ on 15/10/21.
//  Copyright © 2015年 55BBS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PostCircleAddPicViewDelegate;
@interface PostCircleAddPicView : UIView
@property (nonatomic,strong) NSArray * imgArray;
@property (nonatomic,weak) id <PostCircleAddPicViewDelegate> delegate;

@end

@protocol PostCircleAddPicViewDelegate <NSObject>
- (void)postCircleAddPicViewDidTapAddPicBtn;
- (void)postCircleAddPicVIewDidDeleteImageAtIndex:(NSInteger)index;
- (void)postCircleAddPicVIewDidSelectedImageAtIndex:(NSInteger)index;

@end