//
//  ArtDetailViewController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/17.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"
#import "InforVillage_ArticleCateModel.h"
@interface ArtDetailViewController : BaseViewController

@property (nonatomic, copy) NSString *art_id;
@property(nonatomic, copy) NSString * titleContent;//标题
@property(nonatomic, copy) NSString * createTime;//时间
@property(nonatomic, copy) NSString * zanNum;//点赞数量
@property(nonatomic, copy) NSString * fenxiangNum;//分享数量

@property(nonatomic, strong) Village_ArticleListModel * articleModel;
@end
