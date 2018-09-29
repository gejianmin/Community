//
//  OASearchView.m
//  JTDOASystem
//
//  Created by gejianmin on 2018/7/11.
//  Copyright © 2018年 JuTongDa Technology. All rights reserved.
//

#import "OASearchView.h"
#import "pinyin.h"

#import "UIButton+LXMImagePosition.h"
@interface OASearchView()<UITextFieldDelegate>


@end

@implementation OASearchView

- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id <OASearchViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder withDelegate:(id <OASearchViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        self.placeholder = placeholder;
        [self initUI];
    }
    return self;
}

+ (CGFloat)height {
    return 90.f;
}

- (void)initUI {
    self.searchTextField = [[UITextField alloc] init];
    [self addSubview:self.searchTextField];
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30);
        make.right.mas_offset(-30);
        make.top.mas_offset(20);
        make.bottom.mas_offset(-20);

    }];
    [self.searchTextField setBackgroundColor:kColorGray9];
    [self.searchTextField setFont:kFontM(15)];
    [self.searchTextField setTextColor:kColorUnSelectedTitle];
    self.searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    self.searchTextField.delegate = self;
    [self.searchTextField addTarget:self action:@selector(textchange:) forControlEvents:UIControlEventEditingChanged];
    [self.searchTextField makeCornerWithCornerRadius:5 borderWidth:0 borderColor:nil];
    self.placeHolderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchTextField addSubview:self.placeHolderButton];
    [self.placeHolderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
    [self.placeHolderButton setImage:[UIImage imageNamed:@"inter_search"] forState:UIControlStateNormal];
    [self.placeHolderButton setTitle:self.placeholder forState:UIControlStateNormal];
    [self.placeHolderButton.titleLabel setFont:kFontM(15)];
    [self.placeHolderButton setTitleColor:kColorGray forState:UIControlStateNormal];
    [self.placeHolderButton setImagePosition:LXMImagePositionLeft spacing:8.f];
    [self.placeHolderButton addTarget:self action:@selector(hander:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)hander:(UIButton *)sender {
    [sender mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(8);
        make.top.bottom.mas_offset(0);
    }];
    [sender setHidden:YES];
    
    [self.searchTextField setPlaceholder:self.placeholder];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"inter_search"]];
    imageView.contentMode = UIViewContentModeCenter;
    [imageView setFrame:CGRectMake(0, 0, 30.f, [[self class] height])];
    self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
    self.searchTextField.leftView = imageView;
    [self.searchTextField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(searchViewShouldSearch:)]) {
        [self.delegate searchViewShouldSearch:textField.text];
    }
    [textField resignFirstResponder];
    return YES;
}
+(void)keyBoardResignFirstResponder{
    OASearchView * view = [[OASearchView alloc]init];
    [view.searchTextField resignFirstResponder];
}
- (void)textchange:(UITextField *)textField {
    
    if ([self.delegate respondsToSelector:@selector(searchViewDidTextChange:)]) {
        [self.delegate searchViewDidTextChange:textField.text];
    }
}
#pragma mark -- 处理搜索匹配
//- (NSArray *)searchWithKeyword:(NSString *)keyword {
//    NSMutableArray * arrTmp = [NSMutableArray array];
//    for (GSAWechatGroupModel * model in self.searchDataArr) {
//        if ([self.searchView isContainWithStr:keyword sourceStr:model.groupName]) {
//            [arrTmp addObject:model];
//        }else{
//            
//        }
//    }
//    return arrTmp;
//}
- (BOOL)isContainWithStr:(NSString *)str sourceStr:(NSString *)sourceStr{
    
    str = [str lowercaseString];//强制转换为小写字母 ---- 对大小写字母不敏感
    if ([sourceStr containsString:str] ||//汉字匹配
        [self pingyinshouzimu:str sourceStr:sourceStr] ||//拼音首字母匹配
        [[self pingyinShouzimuWithContent:sourceStr] containsString:str] ||//每个字的拼音首字母的判断
        [self suoyoudepingyin:str sourceStr:sourceStr]//拼音匹配
        ) {
        return YES;
    }
    return NO;
}
//拼音首字母匹配
- (BOOL)pingyinshouzimu:(NSString*)str  sourceStr:(NSString *)sourceStr{
    NSString * shouzimu = [[[NSString stringWithFormat:@"%c",pinyinFirstLetter([sourceStr characterAtIndex:0])] lowercaseString] substringToIndex:1];
    if ([[str lowercaseString] isEqualToString:shouzimu]) {
        return YES;
    }
    return NO;
}
//拼音匹配
- (BOOL)suoyoudepingyin:(NSString *)str  sourceStr:(NSString *)sourceStr{
    NSString * result = [[self pingyinShouzimuWithContent:sourceStr] stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [result containsString:str];
}

- (NSString *)pingyinWithContent:(NSString *)content {
    NSMutableString *pinyin = [content mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //    NSLog(@"%@", pinyin);
    return [pinyin lowercaseString];
}

//每个字的拼音首字母的判断
- (NSString *)pingyinShouzimuWithContent:(NSString *)content {
    NSArray * arr = [content componentsSeparatedByString:@" "];
    NSMutableArray * arrTemp = [NSMutableArray arrayWithArray:arr];
    [arrTemp removeObject:@""];
    if (arrTemp.count == 0) {
        return @"";
    }
    NSMutableString * result = [NSMutableString string];
    for (NSString * str in arrTemp) {
        [result appendString:[str substringToIndex:1]];
    }
    return result;
}


@end

