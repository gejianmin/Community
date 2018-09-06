//
//  ListTableView.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/18.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "ListTableView.h"

@interface ListTableView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ListTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:backView];
        backView.backgroundColor = [UIColor clearColor];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.delegate = self;
        [backView addGestureRecognizer:tap];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate =self;
        self.tableView.dataSource = self;
        [self addSubview:self.tableView];
    }
    return self;
}
- (void)setSuperRect:(CGRect)superRect{
    _superRect = superRect;
    CGFloat x = superRect.origin.x;
    CGFloat y = superRect.origin.y;
    CGFloat w= superRect.size.width;
    CGFloat h = superRect.size.height;
    self.tableView.frame = CGRectMake(x, y + h +0.5, w, 150);
}
- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = FONT(14);
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _superRect.size.height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(selectIndex:)]) {
        [self.delegate selectIndex:indexPath.row];
    }
    NSLog(@"123124214");
}
- (void)tap:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:self];
    
    if (point.x>=_superRect.origin.x && point.x<= _superRect.origin.x + _superRect.size.width && point.y>=_superRect.origin.y && point.y<=_superRect.origin.y + _superRect.size.height) {
        
        if ([self.delegate respondsToSelector:@selector(close)]) {
            [self.delegate close];
        }
        
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return NO;
    }
    return YES;
}
@end
