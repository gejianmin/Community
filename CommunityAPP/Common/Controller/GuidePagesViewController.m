//
//  GuidePagesViewController.m
//  CRMSystemClient
//
//  Created by 王帅宇 on 2017/6/20.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import "GuidePagesViewController.h"
#define WIDTH (NSInteger)self.view.bounds.size.width
#define HEIGHT (NSInteger)self.view.bounds.size.height

@interface GuidePagesViewController ()<UIScrollViewDelegate>
{
    // 创建页码控制器
    UIPageControl *pageControl;
    // 判断是否是第一次进入应用
    BOOL flag;
}
@end

@implementation GuidePagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    for (int i=0; i<4; i++) {
            UIImage *image;
            if (GSA_SCREEN_5_8) {
                image = [UIImage imageNamed:[NSString stringWithFormat:@"Guide_X_%d",i+1]];
            }else{
                image = [UIImage imageNamed:[NSString stringWithFormat:@"Guide_%d",i+1]];
            }
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT)];
        // 在最后一页创建按钮
        if (i == 3) {
            // 必须设置用户交互 否则按键无法操作
            imageView.userInteractionEnabled = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//            button.frame = CGRectMake(WIDTH / 3, HEIGHT * 5 / 6, WIDTH / 3, HEIGHT / 16);
//            [button setTitle:@"点击进入" forState:UIControlStateNormal];
//            [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
//            button.layer.borderWidth = 2;
//            button.layer.cornerRadius = 5;
//            button.clipsToBounds = YES;
//            button.layer.borderColor = [UIColor whiteColor].CGColor;
            button.frame = Frame(0, 0, HH_SCREEN_W, HH_SCREEN_H);
            [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
        imageView.image = image;
        [myScrollView addSubview:imageView];
    }
    myScrollView.bounces = NO;
    myScrollView.pagingEnabled = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.contentSize = CGSizeMake(WIDTH * 3, HEIGHT);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(WIDTH / 4, HEIGHT * 15 / 16, WIDTH / 4, HEIGHT / 16)];
    // 设置页数
    pageControl.numberOfPages = 4;
    // 设置页码的点的颜色
    pageControl.pageIndicatorTintColor = [UIColor clearColor];
    // 设置当前页码的点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor clearColor];
    
    [self.view addSubview:pageControl];
    
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算当前在第几页
    pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
}

// 点击按钮保存数据并切换根视图控制器
- (void) go:(UIButton *)sender{
    flag = YES;
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    // 保存用户数据
    [useDef setBool:flag forKey:@"notFirst"];
    [useDef synchronize];
    // 切换根视图控制器
//    CRMLoginViewController *login = [[CRMLoginViewController alloc]init];
//    JDNavigationController *navi = [[JDNavigationController alloc]initWithRootViewController:login];
//    navi.navigationBar.hidden = YES;
//    self.view.window.rootViewController = navi;
}




@end
