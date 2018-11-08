//
//  InterPostViewDataSource.m
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InterPostViewDataSource.h"
#import <UIKit/UIKit.h>
#import "InterPostDescCell.h"
#import "InterPostInfoCell.h"
#import "IKHeightPickerView.h"
#import "InterTopicListModel.h"
#import "AppDelegateTool.h"
#import "ELCImagePickerController.h"
#import "GSAPublishModel.h"
#import "MLPhotoBrowserViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
@interface InterPostViewDataSource ()<UITableViewDelegate,UITableViewDataSource,InterPostInfoCellDelegate,InterPostDescCellDelagate,ELCImagePickerControllerDelegate>
{
    NSString * _titleText;
    NSString * _contentText;
    NSString * _priceText;
    NSString * _contactText;
    NSString * _phoneText;
    NSString * _topicText;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *postDic;
@property (nonatomic, strong) NSMutableArray *picArray;
@property (nonatomic, strong) NSMutableArray *picPathArray;
@property (nonatomic, strong)NSMutableArray<MLPhoto *> *photosArray;


@end

@implementation InterPostViewDataSource

- (instancetype)initWithType:(PostType )controllerType{
    
    if (self = [super init]) {
        self.controllerType = controllerType;
        if (controllerType == PostType_LinLiQuan) {
            self.dataSourceArray = [NSMutableArray arrayWithArray:@[
                                                                    [[GSAPublishModel alloc] initWithTitle:@"邻里分类" detailTitle:@"请选择分类" reuseIdentifier:kSelectCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorSelectStatu content:@"" contentID:@"" titleName:@"" selecStyle:selectDateStyle],
                                                                    ]];
        }else if (controllerType == PostType_ErShou) {
            self.dataSourceArray = [NSMutableArray arrayWithArray:@[[[GSAPublishModel alloc] initWithTitle:@"价格" detailTitle:@"¥0.00" reuseIdentifier:kInputCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"price" selecStyle:selectDateStyle]]];
        }
        
    }
    return self;
}

- (void)registerTableViewCell:(UITableView *)tableView{
    _tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[InterPostDescCell class] forCellReuseIdentifier:NSStringFromClass([InterPostDescCell class])];
    [tableView registerClass:[InterPostInfoCell class] forCellReuseIdentifier:NSStringFromClass([InterPostInfoCell class])];
    [tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.dataSourceArray.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 10.0f;
    }else{
        return 0.0f;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        InterPostDescCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InterPostDescCell"];
        if (self.controllerType == PostType_ErShou) {
            cell.messageView.placeholder = @"描述您的宝贝";
        }
        cell.delegate = self;
        cell.picArray = self.picArray;
        return cell;
    }else{
        GSAPublishModel * model = self.dataSourceArray[indexPath.row];
        InterPostInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:model.reuseIdentifier];
        if (cell==nil) {
            cell=[[InterPostInfoCell alloc] initWithReuseIdentifier:model.reuseIdentifier indexPath:indexPath];
        }
        cell.delegate = self;
        cell.model = model;
        [cell reloadDataWithModel:model indexPath:indexPath callBack:^(NSString *content, NSIndexPath *indexPath) {
            [self reloadDataWithContent:content andContentID:content indexPath:indexPath];
        }];
        return cell;
    }
    return nil;
}
- (void)reloadDataWithContent:(NSString * )content andContentID:(NSString *)contentID indexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0) {
        GSAPublishModel * model = self.dataSourceArray[indexPath.row];
        model.content = content;
        model.contentID = contentID;
        [self.dataSourceArray replaceObjectAtIndex:indexPath.row withObject:model];
        if (model.selectorStatu == selectorSelectStatu) {
            if (!kStringIsEmpty(content)) {
                if (self.dataSourceArray.count >1) {
                    [self.dataSourceArray removeObjectAtIndex:0];
                }
                if ([content isEqualToString:@"二手市场"]) {
                    NSArray * array = @[[[GSAPublishModel alloc] initWithTitle:@"价格" detailTitle:@"¥0.00" reuseIdentifier:kInputCellReuseIdentifier buttonTitle:@"" isHeidenMark:0 selectorStatu:selectorInputStatu content:@"" contentID:@"" titleName:@"price" selecStyle:selectDateStyle]];
                    NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,[array count])];
                    [self.dataSourceArray insertObjects:array atIndexes:indexes];
                    NSIndexSet *indexSet=[[NSIndexSet alloc] initWithIndex:indexPath.section];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }else{
                    NSIndexSet *indexSet=[[NSIndexSet alloc] initWithIndex:indexPath.section];
                    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                }
            }
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 62.5;
}
#pragma mark-真实高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section != 0) {
        GSAPublishModel * model = self.dataSourceArray[indexPath.row];
        if (model.reuseIdentifier == kSelectCellReuseIdentifier) {
            IKHeightPickerView *pickView = [[IKHeightPickerView alloc] initWithFrame:_tableView.bounds];
            __weak typeof(self) weak_self = self;
            pickView.confirmBlock = ^(TopicListModel * model) {
                _topicText = model.topic_name;
                [weak_self reloadDataWithContent:_topicText andContentID:model.topic_id indexPath:indexPath];
            };
            [pickView initialRowTitle:_topicText dataSource:self.topicListArray];
            [pickView positionPickerRow];
            [_tableView.superview addSubview:pickView];
        }
    }
}
-(void)editImageBtn:(NSInteger)index withImage:(UIImage *)image{
    [self.photosArray removeAllObjects];
    for (int i = 0 ; i< self.picPathArray.count; i++) {
        MLPhoto *photo = [[MLPhoto alloc]init];
        photo.thumbImageUrl = [NSURL URLWithString:self.picPathArray[i]];
        photo.originalImageUrl = [NSURL URLWithString:self.picPathArray[i]];
        photo.assetUrl = [NSURL URLWithString:self.picPathArray[i]];
        [self.photosArray addObject:photo];
    }
    UIViewController *vc = [AppDelegateTool topViewController];
    MLPhotoBrowserViewController *browserVC = [[MLPhotoBrowserViewController alloc] init];
    //    browserVC.isSimpleSacnViewCotroller = YES;
    browserVC.curPage = index;/** 点击的第几张图片*/
    browserVC.editMode = YES;
    browserVC.photos = self.photosArray; //存的是myphoto的对象
    browserVC.picArray = self.picArray;//存原图
    browserVC.picPathArray = self.picPathArray;//存网络地址
    browserVC.hidesBottomBarWhenPushed = YES;
    [browserVC displayForVC:vc];
    JTDWeakSelf
    browserVC.callBack = ^(NSMutableArray<MLPhoto *> *photosArray,NSMutableArray *picArray,NSMutableArray * picPathArray) {
        WeakSelf.photosArray = photosArray;
        WeakSelf.picArray = picArray;
        WeakSelf.picPathArray = picPathArray;
        NSString *string = [WeakSelf.picPathArray componentsJoinedByString:@","];
        [WeakSelf.dataSourceDictionary setValue:string forKey:@"photos"];
        [WeakSelf.tableView reloadData];
    };
}
- (BOOL)isPhotoAlbumNotDetermined
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusNotDetermined)
    {
        return YES;
    }
    return NO;
}
- (BOOL)isPhotoAlbumDenied
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied)
    {
        return YES;
    }
    return NO;
}
- (void)addButtonDidTap:(NSInteger)picCount{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        // 第一次安装App，还未确定权限，调用这里
        if ([self isPhotoAlbumNotDetermined])
        {
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
            {
                // 该API从iOS8.0开始支持
                // 系统弹出授权对话框
                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
                        {// 用户拒绝，跳转到自定义提示页面
                        }
                        else if (status == PHAuthorizationStatusAuthorized)
                        {
                            // 用户授权，弹出相册对话框
                            UIViewController *vc = [AppDelegateTool topViewController];
                            ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
                            elcPicker.imagePickerDelegate  = self;
                            elcPicker.currentCount         = picCount;
                            [vc presentViewController:elcPicker animated:YES completion:nil];
                        }
                    });
                }];
            }
            else
            {// 以上requestAuthorization接口只支持8.0以上，如果App支持7.0及以下，就只能调用这里。
                //[vc presentToImagePickerController:UIImagePickerControllerSourceTypePhotoLibrary];
            }
        }
        //        else if ([YFKit isPhotoAlbumDenied])
        //        {
        //            // 如果已经拒绝，则弹出对话框
        //            [vc showAlertController:@"提示" message:@"拒绝访问相册，可去设置隐私里开启"];
        //        }
        else
        {
            // 已经授权，跳转到相册页面
            UIViewController *vc = [AppDelegateTool topViewController];
            ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
            elcPicker.imagePickerDelegate  = self;
            elcPicker.currentCount         = picCount;
            [vc presentViewController:elcPicker animated:YES completion:nil];
        }
    }
    //    else
    //    {
    //        // 当前设备不支持打开相册
    //        [self showAlertController:@"提示" message:@"当前设备不支持相册"];
    //    }
   
}
#pragma mark - ELCImagePickerController Delegate
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    UIViewController *vc = [AppDelegateTool topViewController];
    [vc showHUDText:nil];
    [vc dismissViewControllerAnimated:YES completion:^{
        for (NSDictionary *dic in info) {
            UIImage *image = dic[UIImagePickerControllerOriginalImage];
            [self.picArray addObject:image];
//            NSString * url = [NSString stringWithFormat:@"%@%@",URI_MAIN,inter_path_postPicture];
//            [PPNetworkHelper uploadImagesWithURL:url parameters:nil name:@"upload" images:@[image] fileNames:@[image] imageScale:0.1 imageType:@"png" progress:^(NSProgress *progress) {
//            } success:^(id responseObject) {
//                if (responseObject) {
//                    NSString * imagePath = responseObject[@"data"][@"img_url"];
//                    [self.picPathArray addObject:imagePath];
//                    NSString *string = [self.picPathArray componentsJoinedByString:@","];
//                    [self.dataSourceDictionary setValue:string forKey:@"photos"];
//                }
//            } failure:^(NSError *error) {
//                HHLog(@"error==%@",error);
//            }];
            [vc hideHUD];
        }
        [self.tableView reloadData];
    }];
}
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    UIViewController *vc = [AppDelegateTool topViewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
}
- (void)endEditPostMessage:(NSString *)message{
    [self.dataSourceDictionary setValue:message forKey:@"p_content"];
}
- (void)endEditPostTitle:(NSString *)title{
    [self.dataSourceDictionary setValue:title forKey:@"p_title"];
}
- (NSMutableArray *)picArray {
    if (!_picArray) {
        _picArray = [NSMutableArray array];
    }
    return _picArray;
}
- (NSMutableArray *)picPathArray {
    if (!_picPathArray) {
        _picPathArray = [NSMutableArray array];
    }
    return _picPathArray;
}

- (NSMutableArray *)dataSourceArray {
    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}
- (NSMutableArray<MLPhoto *> *)photosArray {
    
    if (!_photosArray) {
        _photosArray = [[NSMutableArray alloc ] init];
    }
    return _photosArray;
}

- (NSMutableDictionary *)dataSourceDictionary {
    if (!_dataSourceDictionary) {
        _dataSourceDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
        [self.dataSourceDictionary setObject:@"" forKey:@"p_content"];
        [self.dataSourceDictionary setObject:@"" forKey:@"p_title"];
        [self.dataSourceDictionary setObject:@"" forKey:@"photos"];
    }
    return _dataSourceDictionary;
}
@end
