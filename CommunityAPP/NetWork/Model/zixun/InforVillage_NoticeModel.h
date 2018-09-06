//
//  InforVillage_NoticeModel.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "RequestBaseModel.h"

@interface InforVillage_NoticeModel : RequestBaseModel

@property (nonatomic, copy) NSString *notice_title;
@property (nonatomic, copy) NSString *notice_content;

@end
