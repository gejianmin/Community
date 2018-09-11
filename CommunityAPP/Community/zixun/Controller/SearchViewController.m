//
//  SearchViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/9.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITextFieldDelegate>

@property(nonatomic, strong) UIView * searchView;//搜索框视图

@end

@implementation SearchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:self.searchView];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.searchView removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:kColorGray4 forState:UIControlStateNormal];
    rightBtn.titleLabel.font = kFont(14);
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = buttonItem;
    
    
}
#pragma mark -- 懒加载

- (UIView *)searchView{
    if (!_searchView) {
        _searchView = [[UIView  alloc]init];
        _searchView.backgroundColor = kColorGray9;
        _searchView.frame = CGRectMake(60, 5, HH_SCREEN_W - 120, 44-10);
        _searchView.layer.cornerRadius = 5;
        _searchView.layer.masksToBounds = YES;
        
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.frame = CGRectMake(5, 10, 14, 14);
        imgV.image = [UIImage imageNamed:@"search_black"];
        [self.searchView addSubview:imgV];
        
        
        UITextField *tf = [[UITextField alloc]init];
        tf.frame = CGRectMake(28, 0, self.searchView.frame.size.width-6, self.searchView.frame.size.height);
        tf.delegate = self;
        tf.placeholder = @"请输入搜索内容";
        [tf setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
        [self.searchView addSubview:tf];
        
        
    }
    return _searchView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
