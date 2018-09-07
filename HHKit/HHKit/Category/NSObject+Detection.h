//
//  NSObject+Detection.h
//  LoginAPI
//
//  Created by Lxrent on 16/5/17.



#import <Foundation/Foundation.h>

@interface NSObject (Detection)

//怎么判断用户输入了是否正确的邮箱地址
-(BOOL)validateEmail:(NSString*)email;

- (BOOL) NSStringIsValidEmail:(NSString*)checkString;

- (BOOL)isValidateEmail:(NSString *)Email;
//判断字符串是否是整型

- (BOOL)isPureInt:(NSString*)string;

//判断是否为浮点形：

- (BOOL)isPureFloat:(NSString*)string;

- (BOOL)isValiMobile:(NSString *)mobile;


/**
 判断是否为字母或数字

 @param content 参数
 @return
 */
- (BOOL)isLetterOrDigit:(NSString *)content;

/**
 是否是6到16位规则密码

 @param pass 密码
 @return
 */
-(BOOL)judgePassWordLegal:(NSString *)pass;

/**
 身份证正则

 @param IDCard 身份证号
 @return YES/NO
 */
- (BOOL)isValidateIDCard:(NSString *)IDCard;
/**
 中文姓名正则
 
 @param legalName 身份证号
 @return YES/NO
 */
- (BOOL)isLegalName:(NSString *)legalName;
/**
 身份证正则（全）
 
 @param IDCard 身份证号
 @return YES/NO
 */

-(BOOL)isValidateIdCard:(NSString *)idCard;
/**
 人民币正则（全）
 
 @param rmb 人民币
 @return YES/NO
 */

-(BOOL)isValidateRMB:(NSString *)rmb;
@end

@interface NSObject (simpleDetection)

//2. 判断全汉字
- (BOOL)inputShouldChinese:(NSString *)inputString;

//3. 判断全数字：
- (BOOL)inputShouldNumber:(NSString *)inputString;

//4. 判断全字母：
- (BOOL)inputShouldLetter:(NSString *)inputString;

//5. 判断仅输入字母或数字：
- (BOOL)inputShouldLetterOrNum:(NSString *)inputString;
@end
