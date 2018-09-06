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
@property (nonatomic, copy) NSArray *dataSourceArray;
@property (nonatomic, strong) NSMutableDictionary *postDic;
@property (nonatomic, strong) NSMutableArray *picArray;

@end

@implementation InterPostViewDataSource

- (instancetype)init{
    if (self = [super init]) {
        self.dataSourceArray = [NSArray arrayWithObjects:@"",@"价格",@"联系人",@"联系方式",@"分类帖子", nil];
        self.postDic = [NSMutableDictionary dictionary];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        InterPostDescCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InterPostDescCell"];
        cell.delegate = self;
        cell.picArray = self.picArray;
        return cell;
    }else{
        InterPostInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InterPostInfoCell"];
        cell.delegate = self;
        if (indexPath.row == 4) {
            cell.topicText = _topicText;
        }else{
            cell.topicText = nil;
        }
        cell.indexPath = indexPath;
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 250;
    }
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 4) {
        IKHeightPickerView *pickView = [[IKHeightPickerView alloc] initWithFrame:_tableView.bounds];
        __weak typeof(self) weak_self = self;
        pickView.confirmBlock = ^(NSString *selectedProfession) {
            _topicText = selectedProfession;
            [weak_self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        NSMutableArray *array = [NSMutableArray array];
        for (TopicListModel *model in self.topicListArray) {
            [array addObject:model.topic_name];
        }
        [pickView initialRowTitle:_topicText dataSource:array];
        [pickView positionPickerRow];
        [_tableView.superview addSubview:pickView];
    }
}

#pragma mark  -- InterPostInfoCellDelegate
- (void)endEditPostInfo:(NSString *)message indexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 1:
        {
            _priceText = message;
        }
            break;
        case 2:
        {
            _contactText = message;
        }
            break;
        case 3:
        {
            _phoneText = message;
        }
            break;
        default:
            break;
    }
}

- (void)endEditPostTitle:(NSString *)title{
    _titleText = title;
}

- (void)endEditPostMessage:(NSString *)message{
    _contentText = message;
}

- (void)addButtonDidTap:(NSInteger)picCount{
    UIViewController *vc = [AppDelegateTool topViewController];
    
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    elcPicker.imagePickerDelegate  = self;
    elcPicker.currentCount         = picCount;
    [vc presentViewController:elcPicker animated:YES completion:nil];
}

#pragma mark - ELCImagePickerController Delegate
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    UIViewController *vc = [AppDelegateTool topViewController];
    [vc dismissViewControllerAnimated:YES completion:^{
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in info) {
            UIImage *image = dic[UIImagePickerControllerOriginalImage];
            [array addObject:image];
            [self.picArray addObject:image];
        }
        [self.tableView reloadData];
    }];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    UIViewController *vc = [AppDelegateTool topViewController];
    [vc dismissViewControllerAnimated:YES completion:nil];
}

- (NSMutableArray *)picArray {
    if (!_picArray) {
        _picArray = [NSMutableArray array];
    }
    return _picArray;
}

@end
