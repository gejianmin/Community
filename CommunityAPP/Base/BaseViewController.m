//
//  BaseViewController.m
//  55BBS
//
//  Created by KepenJ on 2017/3/3.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //     判断是否有上级页面，有的话再调用
    if ([self.navigationController.viewControllers indexOfObject:self] > 0) {
        [self setupLeftBarButton];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)navBarBackItem{
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    UIImage *image = [UIImage imageNamed:@"back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    navigationBar.backItem.backBarButtonItem.title = @"";
    navigationBar.tintColor = [UIColor blackColor];
}
- (void)setLeftItemWithImageTarget:(id)target{
}
- (void)setLeftItemWithTitle:(NSString *)title Target:(id)target{
}
- (void)back{
}
- (void)setRightItemWithImageTarget:(id)target{
}
- (void)setRightItemWithTitle:(NSString *)title Target:(id)target{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
