//
//  WYHeightPickerView.m
//  WYChangeInfoDemo
//
//  Created by 意一yiyi on 2017/3/6.
//  Copyright © 2017年 意一yiyi. All rights reserved.
//

#import "IKHeightPickerView.h"

@interface IKHeightPickerView ()<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIPickerView *pickerView;

@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *confirmButton;
@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) NSString *initialTile;
@property (strong, nonatomic) NSArray *dataSourceArray;
@end

@implementation IKHeightPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.618];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [self addGestureRecognizer:tap];
        [self drawView];
        
        self.bottomView.frame = CGRectMake(0, frame.size.height, frame.size.width, 216 + 44);
        [UIView animateWithDuration:0.25 animations:^{
            
            self.bottomView.frame = CGRectMake(0, frame.size.height - 216 - 44, frame.size.width, 216 + 44);
            [self.bottomView layoutIfNeeded];
        }];
    }
    
    return self;
}

- (void)initialRowTitle:(NSString *)title dataSource:(NSArray *)dataSource{
    _initialTile = title;
    _dataSourceArray = dataSource;
    [_pickerView reloadComponent:0];
}


#pragma mark - drawView

- (void)drawView {
    
    [self addSubview:self.bottomView];
}


#pragma mark - action

- (void)dismiss:(UITapGestureRecognizer *)sender{
    [self cancelButtonAction:nil];
}

- (void)cancelButtonAction:(UIButton *)button {
    
    self.bottomView.frame = CGRectMake(0, self.height - 216 - 44, self.width, 216 + 44);
    [UIView animateWithDuration:0.25 animations:^{
        
        self.bottomView.frame = CGRectMake(0, self.height, self.width, 216 + 44);
        [self.bottomView layoutIfNeeded];
        
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0];
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)confirmButtonAction:(UIButton *)button {
    
    if (self.confirmBlock) {
        self.confirmBlock(self.initialTile);
    }
    
    self.bottomView.frame = CGRectMake(0, self.height - 216 - 44, self.width, 216 + 44);
    [UIView animateWithDuration:0.25 animations:^{
        
        self.bottomView.frame = CGRectMake(0, self.height, self.width, 216 + 44);
        [self.bottomView layoutIfNeeded];
        
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0];
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}


#pragma mark - pickerView 代理方法

// 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

// 行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.dataSourceArray.count;
}

// 显示什么
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.dataSourceArray[row];
}

// 选中时
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.initialTile = self.dataSourceArray[row];
}


#pragma mark - 懒加载

- (UIView *)bottomView {
    
    if (!_bottomView) {
        
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        
        [_bottomView addSubview:self.cancelButton];
        [_bottomView addSubview:self.confirmButton];
        [_bottomView addSubview:self.titleLabel];
        [_bottomView addSubview:self.pickerView];
    }
    
    return _bottomView;
}

- (UIButton *)cancelButton {
    
    if (!_cancelButton) {
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(12, 12, 44, 20)];
        _cancelButton.backgroundColor = [UIColor clearColor];
        
        [_cancelButton setTitle:@"取消" forState:(UIControlStateNormal)];
        _cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16.0f];
        [_cancelButton setTitleColor:[UIColor colorWithHexStr:@"666666"] forState:(UIControlStateNormal)];
        
        [_cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _cancelButton;
}

- (UIButton *)confirmButton {
    
    if (!_confirmButton) {
        
        _confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 44 - 10, 12, 44, 20)];
        _confirmButton.backgroundColor = [UIColor clearColor];
        
        [_confirmButton setTitle:@"保存" forState:(UIControlStateNormal)];
        _confirmButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16.0f];
        [_confirmButton setTitleColor:[UIColor colorWithHexStr:@"04C7B7"] forState:(UIControlStateNormal)];
        
        [_confirmButton addTarget:self action:@selector(confirmButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _confirmButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"行业";
        _titleLabel.textColor = RGB(0, 0, 0);
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18.f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.size = CGSizeMake(60, 20);
        _titleLabel.centerX = self.width/2;
        _titleLabel.centerY = _confirmButton.centerY;
    }
    return _titleLabel;
}

- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, 216)];
        _pickerView.backgroundColor = [UIColor clearColor];        
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

- (void)positionPickerRow{
    BOOL isContains = NO;
    for (int i = 0; i<self.dataSourceArray.count; i++) {
        NSString *title = self.dataSourceArray[i];
        if ([title isEqualToString:self.initialTile]) {
            [UIView animateWithDuration:0.25 animations:^{
                
            } completion:^(BOOL finished) {
                [_pickerView selectRow:i inComponent:0 animated:YES];
            }];
            isContains = YES;
            break;
        }
    }
    if (!isContains && self.dataSourceArray.count>0) {
        self.initialTile = self.dataSourceArray[0];
    }
}

@end
