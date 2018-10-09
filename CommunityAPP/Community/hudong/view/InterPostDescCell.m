//
//  InterPostDescCell.m
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InterPostDescCell.h"
#import "JYBMultiImageView.h"

@interface InterPostDescCell ()<UITextViewDelegate,UITextFieldDelegate,JYBMultiImageViewDelegate>

@property (nonatomic,strong) UITextField *titleField;
@property (nonatomic,strong) JYBMultiImageView *postCircleAddPicView;
@property (nonatomic,strong) UIButton *addPicButton;

@end

@implementation InterPostDescCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
        [self.contentView addSubview:self.titleField];
        [self.contentView addSubview:self.messageView];
        [self.contentView addSubview:self.addPicButton];
        [self.contentView addSubview:self.postCircleAddPicView];
    [self.titleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.width.equalTo(@(self.contentView.width));
        make.height.equalTo(@(50));
    }];
    [self.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleField.mas_bottom).offset(1);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.width.equalTo(@(self.contentView.width));
        make.height.equalTo(@(80));
    }];
}
- (void)setPicArray:(NSMutableArray *)picArray{
    _picArray = picArray;
    _postCircleAddPicView.images_MARR = picArray;
    [self.postCircleAddPicView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageView.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.height.equalTo(@(90 + 90 * (self.picArray.count/4)));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
}
/*
 UITextBorderStyleNone,//无样式边框
 UITextBorderStyleLine,//直线
 UITextBorderStyleBezel,//上边框和左边框加重
 UITextBorderStyleRoundedRect  //圆角
 */
- (UITextField *)titleField{
    if (!_titleField) {
        _titleField = [[UITextField alloc] init];
        _titleField.delegate = self;
        _titleField.backgroundColor = [UIColor whiteColor];
        _titleField.placeholder = @"标题";
        _titleField.font = FONT(14);
        _titleField.textColor = [UIColor blackColor];
        [_titleField setValue:[UIColor colorWithHexStr:@"999999"] forKeyPath:@"_placeholderLabel.textColor"];
        _titleField.borderStyle = UITextBorderStyleRoundedRect;//边框样式
        _titleField.textAlignment = NSTextAlignmentLeft; //居中
        _titleField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直居中
        _titleField.keyboardType = UIKeyboardTypeDefault;
        [_titleField addTarget:self action:@selector(edit:) forControlEvents:UIControlEventAllEditingEvents];

        
    }
    return _titleField;
}

- (PlaceholderTextView *)messageView{
    if (!_messageView) {
        _messageView = [[PlaceholderTextView alloc] init];
        _messageView.scrollEnabled = YES;
        _messageView.editable = YES;
        _messageView.returnKeyType = UIReturnKeyDefault;//return键的类型
        _messageView.keyboardType = UIKeyboardTypeDefault;//键盘类型
        _messageView.font = FONT(14);
        _messageView.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
        _messageView.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
        _messageView.showsHorizontalScrollIndicator = NO;
        _messageView.bounces = NO;
//        _messageView.contentInset = UIEdgeInsetsMake(2, 5, 0, -5);
        _messageView.delegate = self;
        _messageView.layoutManager.allowsNonContiguousLayout = NO;
        _messageView.textColor = [UIColor colorWithHexStr:@"999999"];
        _messageView.placeholderColor = [UIColor hexStringToColor:@"999999" alpha:1.0];
        _messageView.placeholder = @"有什么新鲜事跟邻居说道说道";
        

//        _messageView.placeholder = @"描述您的宝贝";
    }
    return _messageView;
}
- (JYBMultiImageView *)postCircleAddPicView{
    if (!_postCircleAddPicView) {
        _postCircleAddPicView = [[JYBMultiImageView alloc] init];//
        _postCircleAddPicView.delegate = self;
    }
    return _postCircleAddPicView;
}

//控制输入文字的长度和内容
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    
    if ([text isEqualToString:@"\n"]) {
        //禁止输入换行
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)edit:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(endEditPostTitle:)]) {
        [self.delegate endEditPostTitle:textField.text];
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    if ([self.delegate respondsToSelector:@selector(endEditPostMessage:)]) {
        [self.delegate endEditPostMessage:textView.text];
    }
}
- (void)addButtonDidTap{
    if ([self.delegate respondsToSelector:@selector(addButtonDidTap:)]) {
        [self.delegate addButtonDidTap:_postCircleAddPicView.images_MARR.count];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id view = [super hitTest:point withEvent:event];
    if (![view isKindOfClass:[UITextField class]] || ![view isKindOfClass:[UITextView class]]) {
        [self endEditing:YES];
    }
    return view;
}

@end
