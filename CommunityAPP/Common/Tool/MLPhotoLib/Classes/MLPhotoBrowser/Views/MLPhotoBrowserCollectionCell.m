//
//  MLPhotoBrowserCollectionCell.m
//  MLPhotoLib
//
//  Created by leisuro on 16/8/16.
//  Copyright © 2016年 Free. All rights reserved.
//

#import "MLPhotoBrowserCollectionCell.h"
#import "MLPhotoPickerBrowserPhotoScrollView.h"
#import "MLPhotoPickerManager.h"
#import "MLImagePickerHUD.h"
#import "MLPhotoRect.h"
#import "MLPhoto.h"

@interface MLPhotoBrowserCollectionCell () <MLPhotoPickerPhotoScrollViewDelegate>
@property (weak, nonatomic) IBOutlet MLPhotoPickerBrowserPhotoScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
//@property(nonatomic,strong)CustomBtn * rightButton;
@property(nonatomic,strong)CustomBtn * deleteButton;
@property(nonatomic,strong)CustomBtn * cancelButton;
@property(nonatomic,strong)CustomBtn * sureButton;

@end

@implementation MLPhotoBrowserCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.rightButton = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:nil backgroundColor:kColorClear TitleTextColor:nil Font:0.0 Image:nil];
//    [self.scrollView addSubview:self.rightButton];
//    self.userInteractionEnabled = YES;
//    [self.rightButton setImage:[UIImage imageNamed:@"MLImagePickerController.bundle/zl_icon_image_no"] forState:UIControlStateNormal];
//    [self.rightButton setImage:[UIImage imageNamed:@"MLImagePickerController.bundle/zl_icon_image_yes"] forState:UIControlStateSelected];
//    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(GSANavHeight+10);
//        make.right.equalTo(self.mas_right).offset(-10);
//        make.width.height.equalTo(@30);
//    }];
//    [self.rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.scrollView.photoScrollViewDelegate = self;
}
-(void)setupUI{
    UIView * bgAlphaView = [[UIView alloc] init];
    bgAlphaView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4f];
    [self.scrollView addSubview:bgAlphaView];
    [bgAlphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@60);
    }];
    self.cancelButton = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:nil backgroundColor:kColorClear TitleTextColor:nil Font:0.0 Image:nil];
    [bgAlphaView addSubview:self.cancelButton];
    self.userInteractionEnabled = YES;
    [self.cancelButton setImage:ImageNamed(@"icon_quxiao_focused") forState:UIControlStateNormal];
    [self.cancelButton setImage:ImageNamed(@"icon_quxiao_unfocused") forState:UIControlStateSelected];
    [self.cancelButton addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.cancelButton.tag = 1001;
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgAlphaView.mas_centerY);
        make.left.equalTo(self.mas_left).offset(15);
        make.width.height.equalTo(@50);
    }];
    self.deleteButton = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:nil backgroundColor:kColorClear TitleTextColor:nil Font:0.0 Image:nil];
    [bgAlphaView addSubview:self.deleteButton];
    self.userInteractionEnabled = YES;
    [self.deleteButton setImage:ImageNamed(@"icon_shanchu_focused") forState:UIControlStateNormal];
    [self.deleteButton setImage:ImageNamed(@"icon_shanchu_unfocused") forState:UIControlStateSelected];
    [self.deleteButton addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.deleteButton.tag = 1000;
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgAlphaView.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.width.height.equalTo(@50);
    }];
    self.sureButton = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:nil backgroundColor:kColorClear TitleTextColor:nil Font:0.0 Image:nil];
    [bgAlphaView addSubview:self.sureButton];
    self.userInteractionEnabled = YES;
    [self.sureButton setImage:ImageNamed(@"icon_queding_focused") forState:UIControlStateNormal];
    [self.sureButton setImage:ImageNamed(@"icon_queding_unfocused") forState:UIControlStateSelected];
    [self.sureButton addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.sureButton.tag = 1001;
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgAlphaView.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-15);
        make.width.height.equalTo(@50);
    }];
}
-(void)deleteBtnClick:(CustomBtn *)sender{
    if ([self.delegate respondsToSelector:@selector(MLPhotoPickerEditdelegateWithIndexpathItem: buttonType:)]) {
        [self.delegate MLPhotoPickerEditdelegateWithIndexpathItem:self.indexPathItem buttonType:sender.tag];
    }
}
- (void)setPhoto:(MLPhoto *)photo
{
    _photo = photo;

    self.scrollView.photo = photo;
    
    [self updateRightButtonStatus];
}

- (void)setEditMode:(BOOL)editMode
{
    _editMode = editMode;
    if (_editMode) {
        [self setupUI];
    }
    [self.rightButton setHidden:!editMode];
}

- (void)updateRightButtonStatus
{
    [self.rightButton setSelected:[self whetherRecordAsset:self.photo.assetUrl]];
}

- (BOOL)whetherRecordAsset:(NSURL *)assetUrl
{
    return [[MLPhotoPickerManager manager].selectsUrls containsObject:assetUrl];
}

//- (IBAction)rightBtnClick
////- (void)rightBtnClick
//
//{
//    if (self.photo.assetUrl) {
//        if ([[MLPhotoPickerManager manager].selectsUrls containsObject:self.photo.assetUrl]) {
//            // Remove
//            [[MLPhotoPickerManager manager].selectsUrls removeObject:self.photo.assetUrl];
//            [[MLPhotoPickerManager manager] removeThumbAssetUrl:self.photo.assetUrl];
//            [[MLPhotoPickerManager manager] removeOriginalAssetUrl:self.photo.assetUrl];
//            
//        } else {
//            // Insert
//            if ([MLPhotoPickerManager manager].isBeyondMaxCount)
//            {
//                [MLImagePickerHUD showMessage:MLMaxCountMessage];
//                return;
//            }
//            [[MLPhotoPickerManager manager].selectsUrls addObject:self.photo.assetUrl];
//            [[MLPhotoPickerManager manager].selectsThumbImages addObject:@{self.photo.assetUrl:self.photo.thumbImage}];
//            [[MLPhotoPickerManager manager].selectsOriginalImage addObject:@{self.photo.assetUrl:self.photo.origianlImage}];
//        }
//        [self updateRightButtonStatus];
//        [[NSNotificationCenter defaultCenter] postNotificationName:MLNotificationPhotoBrowserDidChangeSelectUrl object:nil];
//    }
//}

- (void) pickerPhotoScrollViewDidSingleClick:(MLPhotoPickerBrowserPhotoScrollView *)photoScrollView
{
    // Single Recognizer.
    if (self.didTapBlock) {
        self.didTapBlock();
    }
}

@end
