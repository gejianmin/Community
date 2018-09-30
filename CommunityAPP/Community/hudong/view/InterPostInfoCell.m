//
//  InterPostInfoCell.m
//  CommunityAPP
//
//  Created by yingke on 2018/7/3.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "InterPostInfoCell.h"
#import "InterTopicListModel.h"

@interface InterPostInfoCell ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *tipField;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *backView;

@end
@implementation InterPostInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self setUpUI];
    }
    return self;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath{
    if (self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpUI];

    }
    return self;
    
}

- (void)setUpUI{
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.tipField];
    
    if (self.reuseIdentifier == kInputCellReuseIdentifier) {
        self.titleLabel.text = @"价格";
        self.tipField.placeholder = @"￥0.00";
        self.tipField.keyboardType = UIKeyboardTypeNumberPad;
        self.tipField.userInteractionEnabled = YES;
    }else if (self.reuseIdentifier == kSelectCellReuseIdentifier){
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        self.titleLabel.text = @"邻里分类";
        if (_topicText) {
            _tipField.placeholder = _topicText;
        }else{
            _tipField.placeholder = @"请选择";
            
        }
        _tipField.textAlignment = NSTextAlignmentRight;
        _tipField.userInteractionEnabled = NO;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame =  CGRectMake(12, 8 ,self.titleLabel.width, 20);
    self.titleLabel.centerY = self.height/2;
    self.tipField.frame = CGRectMake(120, 0, HH_SCREEN_W-120-30, 20);
    self.tipField.centerY = self.height/2;
}
-(void)setModel:(GSAPublishModel *)model{
    _model = model;
    CGSize size = [self.titleLabel sizeForString:self.titleLabel.text font:self.titleLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 20)];
    self.titleLabel.width = size.width + 16;
}
-(void)reloadDataWithModel:(GSAPublishModel *)model indexPath:(NSIndexPath *)indexPath callBack:(cellCallBack )callback{
    _callBack = callback;
    _currentIndexPath = indexPath;
    [_tipField setText:model.content];
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.layer.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:0.4].CGColor;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UITextField *)tipField{
    if (!_tipField) {
        _tipField = [[UITextField alloc] init];
        _tipField.delegate = self;
        _tipField.backgroundColor = [UIColor whiteColor];
        _tipField.font = FONT(14);
        _tipField.textColor = [UIColor blackColor];
        [_tipField setValue:[UIColor colorWithHexStr:@"999999"] forKeyPath:@"_placeholderLabel.textColor"];
        _tipField.borderStyle = UITextBorderStyleNone;//边框样式
        _tipField.textAlignment = NSTextAlignmentLeft; //居中
        _tipField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//垂直居中
        [_tipField addTarget:self action:@selector(edit:) forControlEvents:UIControlEventAllEditingEvents];

    }
    return _tipField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)edit:(UITextField *)textField{
//    if ([self.delegate respondsToSelector:@selector(endEditPostInfo:indexPath:)]) {
//        [self.delegate endEditPostInfo:textField.text indexPath:self.indexPath];
//    }
    if (self.callBack) {
        self.callBack(textField.text,_currentIndexPath);
    }
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id view = [super hitTest:point withEvent:event];
    if (![view isKindOfClass:[UITextField class]]) {
        [self endEditing:YES];
    }
    return view;
}

@end
