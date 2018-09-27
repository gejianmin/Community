//
//  QRCodeViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/19.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "QRCodeViewController.h"
#import "CDZQRScanView.h"
#import <Photos/Photos.h>
@interface QRCodeViewController ()<CDZQRScanDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic ,strong) CDZQRScanView *scanView;
@property (nonatomic ,strong) UIImagePickerController *imagePicker;
@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码";
    [self setupViews];
    [self.scanView startScanning];

    
}
- (void)setupViews{
    self.view.backgroundColor = [UIColor blackColor];
//    UIBarButtonItem *libaryItem = [[UIBarButtonItem alloc]initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(openLibary)];
//    self.navigationItem.rightBarButtonItem = libaryItem;
    [self.view addSubview:self.scanView];
    
    // 选项按钮
    [self selectItem];
}

- (void)selectItem {
    
    NSArray *textArr = @[@"商品条形码",@"二维码",@"Logo图片",@"图像"];
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake( ((SCREEN_WIDTH - 4*40)/5) * (i+1) + i * 40, 35, 50, 50);
        btn.tag = 100 + i;
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"qrcode%d",i]] forState:UIControlStateNormal];
        [btn setTitle:textArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexStr:@"FF1493"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnItemSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

- (void)btnItemSelect:(UIButton*)sender {
    
    if (sender.tag == 103) {/** 图像*/
        [self openLibary];
    }
}

- (void)openLibary{
    if (![self isLibaryAuthStatusCorrect]) {
        [self showAlert:@"需要相册权限" action:nil];
        return;
    }
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (NSString *)messageFromQRCodeImage:(UIImage *)image{
    if (!image) {
        return nil;
    }
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    NSArray *features = [detector featuresInImage:ciImage];
    if (features.count == 0) {
        return nil;
    }
    CIQRCodeFeature *feature = features.firstObject;
    return feature.messageString;
}

- (BOOL)isLibaryAuthStatusCorrect{
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if (authStatus == PHAuthorizationStatusNotDetermined || authStatus == PHAuthorizationStatusAuthorized) {
        return YES;
    }
    return NO;
}

#pragma mark - imagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSString *result = [self messageFromQRCodeImage:image];
    if (result.length == 0) {
        [self showAlert:@"未识别到二维码" action:nil];
        return;
    }
    [self showAlert:result action:nil];
}

#pragma mark - scanViewDelegate
- (void)scanView:(CDZQRScanView *)scanView pickUpMessage:(NSString *)message{
    
    [scanView stopScanning];
    [self showAlert:message action:^{
        [scanView startScanning];
    }];
}
- (void)showAlert:(NSString *)message action:(void(^)())action{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描结果" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:action];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -- LazyLoad

- (CDZQRScanView *)scanView{
    if (!_scanView) {
        _scanView = [[CDZQRScanView alloc]initWithFrame:self.view.bounds];
        _scanView.delegate = self;
        _scanView.showBorderLine = YES;
    }
    return _scanView;
}
- (UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc]init];
        _imagePicker.delegate = self;
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    return _imagePicker;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
