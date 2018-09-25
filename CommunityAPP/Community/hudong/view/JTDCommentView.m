//
//  JTDCommentView.m
//  PetSocialClient
//
//  Created by 赵东 on 2018/3/1.
//  Copyright © 2018年 JianMin Ge. All rights reserved.
//


#define BGViewDefaultHeight 50.f
//#define MaxNumber 100
#define finalValueKey @"CommentFinalValueKey"
#import "JTDCommentView.h"
//#import "JTDEmojKeyboardInputView.h"

@interface JTDCommentView ()
//<JTDEmojKeyboardInputViewDelegate>

@property (nonatomic,strong) UIView * bgView;
@property (nonatomic,strong) HHTextView * textView;
@property (nonatomic,strong) UILabel * countLabel;

@property (nonatomic,strong) NSString * resultStr;
@property (nonatomic,copy)  JTDCommentViewCallBack  callback;

@property (nonatomic,assign) NSInteger  maxNumber;

@property (nonatomic,assign) BOOL isSend;//判断是否点击键盘上的完成按钮，默认YES;若点击空白处，置为NO



@end

@implementation JTDCommentView



+ (instancetype)presentViewWithContentCallback:(JTDCommentViewCallBack)callback {
    return [[self class] presentViewWithMaxNumber:100.f andContentCallback:callback];
}

+ (instancetype)presentViewWithMaxNumber:(NSInteger)maxnum    andContentCallback:(JTDCommentViewCallBack)callback {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    JTDCommentView * view = [[JTDCommentView alloc] initWithFrame:window.bounds withMaxNum:maxnum];
    view.callback = callback;
    view.maxNumber = maxnum;
    [window addSubview:view];
    return view;
}


- (instancetype)initWithFrame:(CGRect)frame withMaxNum:(NSInteger)maxnum  {
    if (self = [super initWithFrame:frame]) {
        self.maxNumber = maxnum;
        self.isSend = YES;
        [self createUI];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardwillshow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardwillhidden:) name:UIKeyboardWillHideNotification object:nil];
        
        //点击键盘顶部右侧的完成按钮
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(TextViewTextDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:nil];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)createUI {
    [self setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:.4f]];
    
    self.bgView = [[UIView alloc] init];
    [self addSubview:self.bgView];
    [self.bgView setBackgroundColor:kColorWhite];
    [self.bgView setFrame:CGRectMake(0, HH_SCREEN_H, HH_SCREEN_W, BGViewDefaultHeight)];

//    self.countLabel = [[UILabel alloc] init];
//    [self addSubview:self.countLabel];
//    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_offset(-15);
//        make.bottom.mas_equalTo(self.bgView.mas_top).offset(-10);
//    }];
//    [self.countLabel setFont:kFont10];
//    [self.countLabel setTextColor:kColorWhite];
//    [self.countLabel setTextAlignment:NSTextAlignmentRight];
//    [self.countLabel setText:[NSString stringWithFormat:@"0/%ld",(long)self.maxNumber]];
    [self.bgView addSubview:self.comments_lbl];
    [self.comments_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(15);
        make.centerY.equalTo(self.bgView.mas_centerY);
    }];
    [self.bgView addSubview:self.send_btn];
    [self.send_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right).offset(-15);
        make.centerY.equalTo(self.bgView.mas_centerY);
        make.height.equalTo(@37);
        make.width.equalTo(@80);
        
    }];
    self.textView = [[HHTextView alloc] initWithFrame:CGRectMake(0, HH_SCREEN_H, HH_SCREEN_W, BGViewDefaultHeight)];
    [self.bgView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.comments_lbl.mas_right).offset(0);
        make.top.mas_offset(8.5f);
        make.bottom.mas_offset(-8.5f);
        make.right.equalTo(self.send_btn.mas_left).offset(-15);
    }];
    
    self.textView.font = kFont14;
//    [self.textView setText:[[NSUserDefaults standardUserDefaults] objectForKey:finalValueKey]];
    self.textView.placeholder = @"说点什么";
    
    self.textView.cornerRadius = 0;
    self.textView.placeholderColor = kColorGray12;
    self.textView.borderColor = kColorClear;
    self.textView.placeholderFont = kFont14;
    self.textView.maxNumber = self.maxNumber;
    
    // 设置文本框最大行数
    JTDWeakSelf
    [self.textView textValueDidChanged:^(NSString *text, CGFloat textHeight) {

        CGRect frame = self.textView.frame;
        CGRect frameResult = self.bgView.frame;
        frameResult.origin.y -= (textHeight - CGRectGetHeight(frame));
        frameResult.size.height += (textHeight - CGRectGetHeight(frame));
        [WeakSelf.bgView setFrame:frameResult];
        
        WeakSelf.resultStr = text;
        [WeakSelf countShow];
        
//        [WeakSelf.countLabel setText:[NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.textView.text.length,(long)self.maxNumber]];
        
    }];
    
    self.textView.maxNumberOfLines = 4;
    [self.textView becomeFirstResponder];

    
}


- (void)keyboardwillshow:(NSNotification *)aNotification {
    NSDictionary * userinfo = [aNotification userInfo];
    NSValue * avalue = [userinfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardrect = [avalue CGRectValue];
    NSInteger height = keyboardrect.size.height;
    CGFloat duration = [[userinfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        [self.bgView setFrame:CGRectMake(0, HH_SCREEN_H - BGViewDefaultHeight - height, HH_SCREEN_W, BGViewDefaultHeight)];
        
    }];
    
}

- (void)keyboardwillhidden:(NSNotification *)aNotification {
    NSDictionary * userinfo = [aNotification userInfo];
     CGFloat duration = [[userinfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        [self.bgView setFrame:CGRectMake(0, HH_SCREEN_H, HH_SCREEN_W, BGViewDefaultHeight)];
  
    }];
}

- (void)tap:(UITapGestureRecognizer *)tap {
//    [self.textView resignFirstResponder];
    self.isSend = NO;
    [self attempDealloc];
}


- (void)TextViewTextDidEndEditing:(NSNotification *)aNotification {
    
 
//    if (self.callback && self.isSend) {
//        self.callback(self.textView.text);
//    }
    [self attempDealloc];

}



- (void)attempDealloc
{
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)countShow {
    [self.countLabel setText:[NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.textView.text.length,(long)self.maxNumber]];
}
-(CustomLab *)comments_lbl{
    if (_comments_lbl == nil) {
        _comments_lbl = [[CustomLab alloc]initWithFrame:CGRectZero font:20 aligment:NSTextAlignmentLeft text:@"@" textcolor:COLORHEX(0x50c8ff)];
    }
    return _comments_lbl;
}
-(CustomBtn *)send_btn{
    if (_send_btn == nil) {
        _send_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"发送" backgroundColor:COLORHEX(0x50c8ff) TitleTextColor:kColorWhite Font:15.0 Image:nil];
        _send_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _send_btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _send_btn.tag = 1002;
        [_send_btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [_send_btn makeCornerWithCornerRadius:5 borderWidth:0.0 borderColor:kColorWhite1];
    }
    return _send_btn;
}
#pragma mark--发送
-(void)btnEvent:(CustomBtn *)sender{
    if (self.callback && self.isSend) {
        self.callback(self.textView.text);
    }
    [self attempDealloc];
    
}


@end
@implementation PSPersonSentView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:kColorOrangeMain];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    [self addSubview:self.comments_lbl];
    [self.comments_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
                make.centerY.equalTo(self.mas_centerY);
    }];
    [self addSubview:self.send_btn];
    [self.send_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@37);
        make.width.equalTo(@80);

    }];
    [self addSubview:self.comments_btn];
    [self.comments_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.send_btn.mas_left).offset(-15);
        make.left.equalTo(self.comments_lbl.mas_right).offset(0);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@37);
    }];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(CustomBtn *)comments_btn{
    if (_comments_btn == nil) {
        _comments_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"说点什么" backgroundColor:kColorWhite TitleTextColor:kColorGray5 Font:14.0 Image:nil];
        _comments_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _comments_btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _comments_btn.tag = 1001;
        [_comments_btn addTarget:self action:@selector(commentsEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _comments_btn;
}
-(CustomLab *)comments_lbl{
    if (_comments_lbl == nil) {
        _comments_lbl = [[CustomLab alloc]initWithFrame:CGRectZero font:20 aligment:NSTextAlignmentLeft text:@"@" textcolor:COLORHEX(0x50c8ff)];
    }
    return _comments_lbl;
}
-(CustomBtn *)send_btn{
    if (_send_btn == nil) {
        _send_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"发送" backgroundColor:COLORHEX(0x50c8ff) TitleTextColor:kColorWhite Font:15.0 Image:nil];
        _send_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _send_btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _send_btn.tag = 1002;
        [_send_btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
        
                [_send_btn makeCornerWithCornerRadius:5 borderWidth:0.0 borderColor:kColorWhite1];
    }
    return _send_btn;
}
#pragma mark--评论
-(void)commentsEvent:(CustomBtn *)sender{
    if ([self.delegate respondsToSelector:@selector(sendButtonEventDelegateWithButton:)]) {
        [self.delegate sendButtonEventDelegateWithButton:sender];
    }
    
}
#pragma mark--表情
-(void)btnEvent:(CustomBtn *)sender{
    
    if ([self.delegate respondsToSelector:@selector(sendButtonEventDelegateWithButton:)]) {
        [self.delegate sendButtonEventDelegateWithButton:sender];
    }
    
}

@end

