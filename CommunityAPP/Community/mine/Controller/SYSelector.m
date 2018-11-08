//
//  SYSelector.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/10/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SYSelector.h"

@interface SYSelector()<UIScrollViewDelegate>

@property(nonatomic, strong) UIButton * selectButton;
@property(nonatomic, strong) UIView * lineView;
@property(nonatomic, strong) UIViewController * fatherVC;
@property(nonatomic, strong) NSArray * childrensVCArr;
@property(nonatomic, strong) UIScrollView * contentScrollView;
@property(nonatomic, strong) NSArray * titleArrs;
@property(nonatomic, strong) NSMutableArray *itemButtonArr;
@end
@implementation SYSelector

-(NSMutableArray *)itemButtonArr {
    if (!_itemButtonArr) {
        _itemButtonArr = [[NSMutableArray alloc]init];
    }
    return _itemButtonArr;
    
}

- (instancetype)initWithFatherVC:(UIViewController *)fatherVC childrensVC:(NSArray <UIViewController *>*)childrens frame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.fatherVC = fatherVC;
        self.childrensVCArr = childrens;
        [self createUI];
    }
    return self;
    
}

- (void)createUI {
    self.selectButton = nil;

    self.titleArrs = @[@"体验问题",@"商品、商家投诉"];
    
    //创建scrollView
    UIScrollView *scrollV = [[UIScrollView alloc]init];
    scrollV.frame = self.frame;
    [self addSubview:scrollV];
    //创建按钮
    for (int i = 0; i<self.titleArrs.count; i++) {
        
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            self.selectButton = itemBtn;
            self.selectButton.selected = YES;
        }
        itemBtn.frame = CGRectMake(0 + i*HH_SCREEN_W/2, 0, HH_SCREEN_W/2, self.frame.size.height - 10);
        itemBtn.tag = 1000+i;
        [itemBtn setTitle:self.titleArrs[i] forState:UIControlStateNormal];
        [itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [itemBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        itemBtn.titleLabel.font = [UIFont systemFontOfSize:17.0f];
        [itemBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollV addSubview:itemBtn];
        [self.itemButtonArr addObject:itemBtn];
    }
    //创建下划线
    self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 5, HH_SCREEN_W/2, 2)];
    self.lineView.backgroundColor = [UIColor redColor];
    [scrollV addSubview:_lineView];
    
    
    // 创建视图大scrollView
    
    self.contentScrollView = [[UIScrollView alloc]init];
    self.contentScrollView.frame = CGRectMake(0,self.frame.size.height, HH_SCREEN_W, HH_SCREEN_H - self.frame.size.height);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.contentSize  = CGSizeMake(self.childrensVCArr.count*HH_SCREEN_W, self.contentScrollView.frame.size.height);
    [self.fatherVC.view addSubview:_contentScrollView];
    
    // 把子视图view贴到scrollView上面去
    for (int j= 0; j<self.childrensVCArr.count; j++) {
        UIViewController *vc = self.childrensVCArr[j];
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(0 + j*HH_SCREEN_W, 0, HH_SCREEN_W, HH_SCREEN_H-self.frame.size.height)];
        [pageView addSubview:vc.view];
        [self.contentScrollView addSubview:pageView];
    }
    
}

- (void)itemBtnClick:(UIButton *)sender {
    
    NSInteger index = sender.tag - 1000;
    
//    if (sender != self.selectButton) {
//        sender.selected = YES;
//        self.selectButton.selected = NO;
//        self.selectButton = sender;
//        // 移动动画
//        [UIView animateWithDuration:0.1 animations:^{
//            
//            self.lineView.centerX = sender.centerX;
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//        
//    }
    
    CGPoint position = CGPointMake(index*HH_SCREEN_W, 0);
    [self.contentScrollView setContentOffset:position animated:YES];
    
    
}

- (void) scrollViewDidScroll:(UIScrollView *)sender {
    // 得到每页宽度
    CGFloat pageWidth = sender.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    NSInteger currentPage = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    //当前按钮的下标
    NSInteger index = self.selectButton.tag - 1000;
    if (index != currentPage) {
        
        UIButton *needSelectButton = self.itemButtonArr[currentPage];
        needSelectButton.selected = YES;
        self.selectButton.selected = NO;
        self.selectButton = needSelectButton;
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.lineView.centerX = needSelectButton.centerX;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
