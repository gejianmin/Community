//
//  InterPostDescCell.m
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InterPostDescCell.h"
#import "PlaceholderTextView.h"
#import "JYBMultiImageView.h"

@interface InterPostDescCell ()<UITextViewDelegate,UITextFieldDelegate,JYBMultiImageViewDelegate>

@property (nonatomic,strong) UITextField *titleField;
@property (nonatomic,strong) PlaceholderTextView *messageView;
@property (nonatomic,strong) JYBMultiImageView *postCircleAddPicView;

@property (nonatomic,strong) UIButton *addPicButton;
@property (nonatomic,strong) UIView *backView;

@end

@implementation InterPostDescCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.titleField];
    [self.backView addSubview:self.messageView];
    [self.backView addSubview:self.addPicButton];
    [self.backView addSubview:self.postCircleAddPicView];
}

- (void)layoutSubviews{
    
    self.backView.frame = CGRectMake(12, 12, SCREEN_WIDTH - 24, self.height - 24);
    self.titleField.frame = CGRectMake(0, 0, self.backView.width, 50);
    self.messageView.frame = CGRectMake(0, 51, self.backView.width, 80);
    self.postCircleAddPicView.top = self.messageView.bottom + 5;
}

- (void)setPicArray:(NSMutableArray *)picArray{
    _picArray = picArray;
    _postCircleAddPicView.images_MARR = picArray;
}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.width = SCREEN_WIDTH - 24;
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
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
        _messageView.placeholder = @"描述您的宝贝";
    }
    return _messageView;
}
- (JYBMultiImageView *)postCircleAddPicView{
    if (!_postCircleAddPicView) {
        _postCircleAddPicView = [[JYBMultiImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 24, 100)];
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

- (void)textViewDidEndEditing:(UITextView *)textView{
    if ([self.delegate respondsToSelector:@selector(endEditPostMessage:)]) {
        [self.delegate endEditPostMessage:textView.text];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(endEditPostTitle:)]) {
        [self.delegate endEditPostTitle:textField.text];
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
