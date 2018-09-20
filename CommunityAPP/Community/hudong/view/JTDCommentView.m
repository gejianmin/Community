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

    self.countLabel = [[UILabel alloc] init];
    [self addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.bottom.mas_equalTo(self.bgView.mas_top).offset(-10);
    }];
    [self.countLabel setFont:kFont10];
    [self.countLabel setTextColor:kColorWhite];
    [self.countLabel setTextAlignment:NSTextAlignmentRight];
    [self.countLabel setText:[NSString stringWithFormat:@"0/%ld",(long)self.maxNumber]];
    
    
    UIButton * smileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [smileButton setImage:[UIImage imageNamed:@"emoji02"] forState:UIControlStateNormal];
    [self.bgView addSubview:smileButton];
    [smileButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_offset(0);
        make.right.mas_offset(-15);
        make.width.height.mas_equalTo(49.f);
    }];
    [smileButton addTarget:self action:@selector(emojiKeyboardShow:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.textView = [[HHTextView alloc] initWithFrame:CGRectMake(0, HH_SCREEN_H, HH_SCREEN_W, BGViewDefaultHeight)];
    [self.bgView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15.f);
        make.top.mas_offset(8.5f);
        make.bottom.mas_offset(-8.5f);
        make.right.mas_equalTo(smileButton.mas_left).offset(-10.f);
    }];
    
    self.textView.font = kFont14;
//    [self.textView setText:[[NSUserDefaults standardUserDefaults] objectForKey:finalValueKey]];
    self.textView.placeholder = @"说出你想说的~~~";
    
    self.textView.cornerRadius = 0;
    self.textView.placeholderColor = kColorGray12;
    self.textView.borderColor = kColorWhite1;
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
    
 
    if (self.callback && self.isSend) {
        self.callback(self.textView.text);
    }
    [self attempDealloc];

}



- (void)attempDealloc
{
    
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -- emojkeyboard
//- (void)emojiKeyboardShow:(UIButton *)sender {
//    sender.selected = !sender.selected;
//    if (sender.selected) {
//        JTDEmojKeyboardInputView * inputView = [[JTDEmojKeyboardInputView alloc] initWithFrame:CGRectMake(0, 0, JTD_SCREEN_W, [JTDEmojKeyboardInputView height])];
//        inputView.delegate = self;
////        [inputView setBackgroundColor:kColorRed];
//        self.textView.inputView = inputView;
//        [self.textView reloadInputViews];
//    }else{
//
//        self.textView.inputView = nil;
//        [self.textView reloadInputViews];
//    }
//
//}

- (void)countShow {
    [self.countLabel setText:[NSString stringWithFormat:@"%lu/%ld",(unsigned long)self.textView.text.length,(long)self.maxNumber]];

}

#pragma mark -- JTDEmojKeyboardInputViewDelegate
//- (void)emojkeyboardinputview:(JTDEmojKeyboardInputView *)emojView didSelectItemWithEmojStr:(NSString *)emojStr {
//
//    NSMutableString * str = [self.textView.text mutableCopy];
//    if (str.length + emojStr.length > self.maxNumber) {
//        return;
//    }
////    str = [str stringByAppendingString:emojStr];
//    NSInteger loaction = self.textView.selectedRange.location;
//    [str insertString:emojStr atIndex:loaction];
//    [self.textView setText:str];
//    self.textView.selectedRange = NSMakeRange(loaction + emojStr.length, 0);
//    [self.textView configurationPlaceholderHidden:YES];
//
//    [self countShow];
//}
//
//- (void)emojkeyboardinputviewDelete:(JTDEmojKeyboardInputView *)emojView {
//
//    NSInteger location = self.textView.selectedRange.location;
//    NSString * str = [self.textView.text substringToIndex:location];
//    NSString * endStr = [self.textView.text substringFromIndex:location];
//    if (str.length == 0) {
//        return;
//    }else if (str.length >= 2 && str.length < 4) {
//        NSString * subStr = [str substringWithRange:NSMakeRange(str.length - 2, 2)];
//        if ([NSString stringContainsEmoji:subStr]) {
//            str = [str substringToIndex:str.length - 2];
//            location -= 2;
//        }else{
//            str = [str substringToIndex:str.length - 1];
//            location -= 1;
//        }
//
//    }else if (str.length >= 4) {
//        NSString * subStr2 = [str substringWithRange:NSMakeRange(str.length - 2, 2)];
//        NSString * subStr4 = [str substringWithRange:NSMakeRange(str.length - 4, 4)];
//
//        if ([NSString stringContainsEmoji:subStr2]) {
//            str = [str substringToIndex:str.length - 2];
//            location -= 2;
//        }else if([NSString stringContainsEmoji:subStr4]){
//            str = [str substringToIndex:str.length - 4];
//            location -= 4;
//        }else {
//            str = [str substringToIndex:str.length - 1];
//            location -= 1;
//        }
//    }else{
//        str = [str substringToIndex:str.length - 1];
//        location -= 1;
//    }
//    [self.textView setText:[NSString stringWithFormat:@"%@%@",str,endStr]];
//    self.textView.selectedRange = NSMakeRange(location, 0);
//
//
//    [self countShow];
//}

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
    
    //    self.chat_btn =[UIButton buttonWithType:UIButtonTypeCustom];
    //    self.chat_btn.backgroundColor = kColorClear;
    //    [self addSubview:self.chat_btn];
    //    self.chat_btn.tag = 1002;
    //    [self.chat_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    [self.chat_btn setImage:ImageNamed(@"UC_emoji") forState:UIControlStateNormal];
    //    [self.chat_btn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.equalTo(self).offset(-15);
    //        make.centerY.equalTo(self.mas_centerY);
    //        make.width.height.equalTo(@23.5);
    //    }];
    //    [self.chat_btn addTarget:self action:@selector(btnEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.comments_btn];
    [self.comments_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset(5);
        //        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@37);
    }];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(CustomBtn *)comments_btn{
    if (_comments_btn == nil) {
        _comments_btn = [[CustomBtn alloc]initWithFrame:CGRectZero Tag:0 Title:@"说点什么" backgroundColor:kColorGray10 TitleTextColor:kColorGray5 Font:14.0 Image:nil];
        _comments_btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _comments_btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _comments_btn.tag = 1001;
        [_comments_btn addTarget:self action:@selector(commentsEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [_comments_btn makeCornerWithCornerRadius:2 borderWidth:1.0 borderColor:kColorWhite1];
    }
    return _comments_btn;
}
#pragma mark--评论
-(void)commentsEvent:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(sendButtonEventDelegateWithButton:)]) {
        [self.delegate sendButtonEventDelegateWithButton:sender];
    }
    
}
#pragma mark--表情
-(void)btnEvent:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(sendButtonEventDelegateWithButton:)]) {
        [self.delegate sendButtonEventDelegateWithButton:sender];
    }
    
}

@end

