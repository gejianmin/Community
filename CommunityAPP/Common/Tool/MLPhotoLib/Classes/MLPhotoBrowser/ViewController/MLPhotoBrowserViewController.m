//
//  MLPhotoBrowserViewController.m
//  MLPhotoLib
//
//  Created by leisuro on 16/8/10.
//  Copyright © 2016年 Free. All rights reserved.
//

#import "MLPhotoBrowserViewController.h"
#import "MLPhotoBrowserCollectionCell.h"
#import "MLNavigationViewController.h"
#import "MLPhotoPickerManager.h"
#import "MLImagePickerHUD.h"
#import "MLPhotoRect.h"

@interface MLPhotoBrowserViewController () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MLPhotoPickerEditdelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *titleButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, assign) BOOL statusBarHiddenFlag;
@property (nonatomic, weak) UIViewController *viewController;
@end

@implementation MLPhotoBrowserViewController

- (void)displayForVC:(__weak UIViewController *)viewController
{
    if (self.photos.count == 0 || self.curPage > self.photos.count)
    {
        NSLog(@"photos is empty");
        return;
    }
    
    self.viewController = viewController;
    if (viewController.navigationController == nil) {
        MLNavigationViewController *navigationVC = [[MLNavigationViewController alloc] initWithRootViewController:self];
        [viewController presentViewController:navigationVC animated:YES completion:nil];
    } else {
        [viewController.navigationController pushViewController:self animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [self addNavigationBarRightView];
    [self addCollectionView];
    [self addNotification];
    [self updateTitleView];
    [self addNavigationBarTitleView];
    
}

- (void)dealloc
{
    if ([NSThread isMainThread]) {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] removeObserver:self];
        });
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nextButton.hidden = NO;
    self.titleButton.hidden = NO;
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController setNavigationBarHidden:NO];

    self.nextButton.hidden = YES;
    self.titleButton.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.nextButton removeFromSuperview];
    [self.titleButton removeFromSuperview];
}

- (void)setStatusBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    self.statusBarHiddenFlag = hidden;
    if (gtiOS8) {
        [self prefersStatusBarHidden];
        [UIView animateWithDuration:animated?0.3:0.0 animations:^{
            [self setNeedsStatusBarAppearanceUpdate];
        }];
    } else {
        [[UIApplication sharedApplication] setStatusBarHidden:self.statusBarHiddenFlag withAnimation:UIStatusBarAnimationFade];
    }
}

- (void)setStatusBarHidden:(BOOL)hidden
{
    [self setStatusBarHidden:hidden animated:YES];
}

- (BOOL)prefersStatusBarHidden
{
    return self.statusBarHiddenFlag;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)addCollectionView
{
    ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
        
        collectionView.pagingEnabled = YES;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.bounces = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MLPhotoBrowserCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([MLPhotoBrowserCollectionCell class])];
        [self.view addSubview:_collectionView = collectionView];
        
        [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.curPage inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    });
}

- (void)addNavigationBarRightView
{
    if (!self.editMode) {
        return;
    }
//    ({
//        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
//        [rightButton setTitle:@"下一步" forState:UIControlStateNormal];
//        [rightButton setBackgroundColor:[UIColor orangeColor]];
//        [[rightButton layer] setCornerRadius:2.0];
//        [rightButton setFrame:CGRectMake(self.view.frame.size.width - 75, 8, 60, 30)];
//        [rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
//        [rightButton addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        [self.navigationController.navigationBar addSubview:rightButton];
//        self.nextButton = rightButton;
//    });
}

- (void)addNotification
{
    ({
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNextButton) name:MLNotificationPhotoBrowserDidChangeSelectUrl object:nil];
    });
}

- (void)addNavigationBarTitleView
{
    ({
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [titleButton setFrame:CGRectMake((self.view.frame.size.width - 150)*0.5, 0, 150, 44)];
        [titleButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:16];
        if (_isSimpleSacnViewCotroller) {
            [titleButton setFrame:CGRectMake((self.view.frame.size.width - 50)*0.5, 40, 50, 25)];
            [titleButton makeCornerWithCornerRadius:5 borderWidth:0 borderColor:nil];
            [titleButton setBackgroundColor:COLORHEX(0x676767)];
            NSString *title = [NSString stringWithFormat:@"%@/%@",@(self.curPage+1),@(self.photos.count)];
            [titleButton setTitle:title forState:UIControlStateNormal];
            [titleButton setTitleColor:kColorWhite forState:UIControlStateNormal];

            [self.view addSubview:titleButton];
        }else{
            [self.navigationController.navigationBar addSubview:titleButton];
        }
        self.titleButton = titleButton;
    });
}

- (void)nextBtnClick
{
    
    [self.navigationController popViewControllerAnimated:NO];
    
    if ([self.viewController respondsToSelector:@selector(tappendDoneBtn)]) {
        [self.viewController performSelector:@selector(tappendDoneBtn)];
    }
}

#pragma mark - <UICollectionViewDataSource/UICollectionViewDelegate>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (MLPhotoBrowserCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MLPhotoBrowserCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MLPhotoBrowserCollectionCell class]) forIndexPath:indexPath];
    cell.delegate = self;
    cell.photo = [self.photos objectAtIndex:indexPath.item];
    cell.editMode = self.editMode;
    cell.indexPathItem = indexPath.item;
    [cell setBackgroundColor:kColorRed];

    __weak typeof(self)weakSelf = self;
    
    cell.didTapBlock = ^{
//        [weakSelf setStatusBarHidden:!weakSelf.navigationController.navigationBar.isHidden];
//        [weakSelf.navigationController setNavigationBarHidden:!weakSelf.navigationController.navigationBar.isHidden animated:YES];
        if (_isSimpleSacnViewCotroller) {
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }
    };
    return cell;
}

-(void)MLPhotoPickerEditdelegateWithIndexpathItem:(NSInteger)indexPath buttonType:(NSInteger)type{
    if (type == 1000) {//删除
        if (self.photos.count <2) {
            [self.photos removeObjectAtIndex:indexPath];
            [self.picArray removeObjectAtIndex:indexPath];
            [self.picPathArray removeObjectAtIndex:indexPath];
            [self reloadData];
             [self back];
        }else{
            [self.photos removeObjectAtIndex:indexPath];
            [self.picArray removeObjectAtIndex:indexPath];
            [self.picPathArray removeObjectAtIndex:indexPath];
            [self reloadData];
        }
    }else{//取消或确认
        [self back];
    }
}
-(void)back{
    if (self.callBack) {
        self.callBack(self.photos,self.picArray,self.picPathArray);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.curPage = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateTitleView];
    
    if ([self.delegate respondsToSelector:@selector(photoBrowser:didScrollToPage:)]) {
        [self.delegate photoBrowser:self didScrollToPage:self.curPage];
    }
}

#pragma mark - Update
- (void)updateTitleView
{
    NSString *title = [NSString stringWithFormat:@"%@/%@",@(self.curPage+1),@(self.photos.count)];
    [self.titleButton setTitle:title forState:UIControlStateNormal];
    [self updateNextButton];
}

- (void)updateNextButton{
    if ([MLPhotoPickerManager manager].selectsUrls.count == 0) {
        self.nextButton.userInteractionEnabled = NO;
        [self.nextButton setBackgroundColor:[UIColor grayColor]];
    }else{
        [self.nextButton setBackgroundColor:[UIColor orangeColor]];

        self.nextButton.userInteractionEnabled = YES;

    }
    NSString *nextStr = @"下一步";
    if ([MLPhotoPickerManager manager].selectsUrls.count > 0) {
        nextStr = [NSString stringWithFormat:@"下一步(%lu)",(unsigned long)[MLPhotoPickerManager manager].selectsUrls.count];
    }
    CGSize nextStrSize = [nextStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;
    [self.nextButton setBounds:CGRectMake(0, 0, nextStrSize.width + 20, 30)];
    [self.nextButton setTitle:nextStr forState:UIControlStateNormal];
}

#pragma mark - Reload
- (void)reloadData
{
    [self.collectionView reloadData];
}

- (void)reloadDataForIndex:(NSInteger)index
{
    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:index inSection:0]]];
}
@end
