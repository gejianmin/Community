//
//  MLPhotoBrowserViewController.h
//  MLPhotoLib
//
//  Created by leisuro on 16/8/10.
//  Copyright © 2016年 Free. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLPhoto.h"
typedef void(^MLcallBack)(NSMutableArray<MLPhoto *> * photosArray,NSMutableArray * picArray,NSMutableArray * picPathArray);

@class MLPhotoBrowserViewController;
@protocol MLPhotoBrowserViewControllerDelegate <NSObject>
@optional
- (void)photoBrowser:(MLPhotoBrowserViewController *)photoBrowser didScrollToPage:(NSInteger)page;
@end

@interface MLPhotoBrowserViewController : UIViewController
@property (weak, nonatomic) id<MLPhotoBrowserViewControllerDelegate>delegate;
/// CurPage
@property (assign, nonatomic) NSInteger curPage;
/// DataSource
@property (strong, nonatomic) NSMutableArray<MLPhoto *>*photos;//图片模型
@property (strong, nonatomic) NSMutableArray * picArray;//原图数组
@property (strong, nonatomic) NSMutableArray * picPathArray;//网络原图数组

/// Can Delete Photo
@property (assign, nonatomic) BOOL editMode;
/// Show && CallBlock.
- (void)displayForVC:(__weak UIViewController *)viewController;
@property (strong, nonatomic) MLcallBack  callBack;

- (void)reloadData;
- (void)reloadDataForIndex:(NSInteger)index;
@property (assign, nonatomic) BOOL isSimpleSacnViewCotroller;/*!< 单独浏览照片*/

@end
