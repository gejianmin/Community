//
//  SearchViewController.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/9.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SearchViewController.h"
#import "InfoArt_SearchRequest.h"
#import "InforVillage_ArticleCateModel.h"
#import "InforArticleCell.h"
@interface SearchViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UIView * searchView;//搜索框视图
@property (nonatomic, strong) NSMutableArray *listArray;
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
    [rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
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
        [tf addTarget:self action:@selector(textFieldChangeEvent:) forControlEvents:UIControlEventEditingChanged];
        [self.searchView addSubview:tf];
        
        
    }
    return _searchView;
}
- (NSMutableArray *)listArray {
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc]init];
    }
    return _listArray;
    
}

- (void)textFieldChangeEvent:(UITextField *)textTF {
    
    __weak typeof(self) tyself = self;
    // 发送请求
    InfoArt_SearchRequest *request = [[InfoArt_SearchRequest alloc]init];
    [request interPostSearchRequestWithContent:textTF.text];
    [request setFinishedBlock:^(id object, id responseData) {
        
        InforVillage_ArticleCateModel *model = object;
        tyself.listArray = [model.Village_ArticleCateArray mutableCopy];
        [self.tableView reloadData];
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"请求失败");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *indentifier = @"InforArticleCell";
    InforArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[InforArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    Village_ArticleCateModel *model = self.listArray[indexPath.row];
    cell.model = model.article_list[indexPath.row];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
