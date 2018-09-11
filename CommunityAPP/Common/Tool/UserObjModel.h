//
//  UserObjModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserObjModel : NSObject <NSCoding>
    
    @property (nonatomic,copy) NSString * uid;//用户id
    @property (nonatomic,copy) NSString * mobile;//手机号
    @property (nonatomic,copy) NSString * nickname;//昵称
    @property (nonatomic,copy) NSString * face;
    @property (nonatomic,copy) NSString * money;
    @property (nonatomic,copy) NSString * coin;
    @property (nonatomic,copy) NSString * jifen;
    @property (nonatomic,copy) NSString * token;
    
    @property (nonatomic, copy) NSString *vid;//小区id
    @property (nonatomic, copy) NSString *org_id;//小区组织代码
    @property (nonatomic, copy) NSString *org_name;//小区名称-组织机构名称
    @property (nonatomic, copy) NSString *address;//地址
    
    @property (nonatomic, assign) CGFloat lng;
    @property (nonatomic, assign) CGFloat lat;
    
    
+ (instancetype)shareIntance;
    
@end

