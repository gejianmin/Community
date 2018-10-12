//
//  MLPhotoBrowserCollectionCell.h
//  MLPhotoLib
//
//  Created by leisuro on 16/8/16.
//  Copyright © 2016年 Free. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MLPhoto;
typedef void(^didTapCellBlock)();

@protocol MLPhotoPickerEditdelegate <NSObject>

-(void)MLPhotoPickerEditdelegateWithIndexpathItem:(NSInteger )indexPath buttonType:(NSInteger )type;

@end

@interface MLPhotoBrowserCollectionCell : UICollectionViewCell
/// Can Delete Photo
@property (assign, nonatomic) BOOL editMode;
@property (nonatomic, strong) MLPhoto *photo;
@property (nonatomic, assign) NSInteger  indexPathItem;
@property (nonatomic, weak) id<MLPhotoPickerEditdelegate>delegate;

@property (nonatomic, copy) didTapCellBlock didTapBlock;
@end
