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
#import <AVFoundation/AVFoundation.h>//调用闪光灯需要导入该框架

@interface QRCodeViewController ()<CDZQRScanDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic ,strong) CDZQRScanView *scanView;
@property (nonatomic ,strong) UIImagePickerController *imagePicker;
@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码";
    [self setupViews];
    // 开始扫码
    [self.scanView startScanning];

    
}

#pragma mark --- UI ---

- (void)setupViews{
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scanView];
    
    // 选项按钮
    [self selectItem];
    // 闪光灯
    [self changeFlesh];
}

// 扫码类型UI
- (void)selectItem {
    
    NSArray *textArr = @[@"商品条形码",@"二维码",@"Logo图片",@"图像"];
    
    for (int i = 0; i < 4; i++) {
        
        HHButton *btn = [[HHButton alloc]initWithStyle:HHButtonSubviewLayoutStyleVertical];
        btn.frame = CGRectMake( ((SCREEN_WIDTH - 4*40)/5) * (i+1) + i * 40, 35, 60, 60);
        btn.tag = 100 + i;
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"qrcode%d",i]] forState:UIControlStateNormal];
        [btn setTitle:textArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexStr:@"FF1493"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnItemSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

// 闪光灯UI
- (void)changeFlesh {
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"打开闪光灯" forState:UIControlStateNormal];
    button.titleLabel.font = kFont(15);
    button.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.5];
    [button addTarget:self action:@selector(openFlesh:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
}


#pragma mark --- 事件 ---

// 选择类型点击事件
- (void)btnItemSelect:(UIButton*)sender {
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = (UIButton *)[[sender superview]viewWithTag:100 + i];
        [btn setSelected:NO];
        
    }
    
    UIButton *button = (UIButton *)sender;
    [button setSelected:YES];
    
    if (sender.tag == 103) {/** 图像*/
        [self openLibary];
    }
}

// 打开相册
- (void)openLibary{
    if (![self isLibaryAuthStatusCorrect]) {
        [self showAlert:@"需要相册权限" action:nil];
        return;
    }
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

// 解码
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

// 打开闪光灯
- (void)openFlesh:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (!sender.selected) {// 打开
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        NSError *error = nil;
        if ([captureDevice hasTorch]) {
            BOOL locked = [captureDevice lockForConfiguration:&error];
            if (locked) {
                captureDevice.torchMode = AVCaptureTorchModeOn;
                [captureDevice unlockForConfiguration];
                
            }
            
        }
       
    }else{ // 关闭
        
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOff];
            [device unlockForConfiguration];
            
        }
        
    }
    
}

#pragma mark --- 回调 ---

// 图片回调
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

// 扫码回调
- (void)scanView:(CDZQRScanView *)scanView pickUpMessage:(NSString *)message{
    
    [scanView stopScanning];
    [self showAlert:message action:^{
        [scanView startScanning];
    }];
}
- (void)showAlert:(NSString *)message action:(void(^)())action{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描结果"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好"
                                                           style:UIAlertActionStyleCancel
                                                         handler:action];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark --- 懒加载 ---

- (CDZQRScanView *)scanView{
    if (!_scanView) {
        _scanView = [[CDZQRScanView alloc]initWithFrame:self.view.bounds];
        _scanView.scanLineColor = [UIColor greenColor];
        _scanView.cornerLineColor = [UIColor greenColor];
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
