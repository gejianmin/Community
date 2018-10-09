//
//  ChineseString.h
//  CRMSystemClient
//
//  Created by tongda ju on 2017/6/9.
//  Copyright © 2017年 juTongDa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChineseString : NSObject
@property(strong,nonatomic)NSString *string;
@property(strong,nonatomic)NSString *pinYin;

//-----  返回tableview右方indexArray
+(NSMutableArray*)IndexArray:(NSArray<NSString *>*)stringArr;

//-----  返回联系人
+(NSMutableArray*)LetterSortArray:(NSArray*)stringArr;

///----------------------
//返回一组字母排序数组(中英混排)
+(NSMutableArray*)SortArray:(NSArray*)stringArr;
@end
