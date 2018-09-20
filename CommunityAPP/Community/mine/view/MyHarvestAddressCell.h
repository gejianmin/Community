//
//  MyHarvestAddressCell.h
//  CommunityAPP
//
//  Created by gejianmin on 2018/9/20.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHarvestAddressCell : UITableViewCell

@property (nonatomic ,strong) CustomLab * leftLabel;
@property (nonatomic ,strong) CustomLab * rightLabel;
@property (nonatomic ,strong) CustomLab * nickLabel;
@property (nonatomic ,strong) CustomBtn * address_btn;
@property (nonatomic ,strong) CustomBtn * edit_btn;
@property(nonatomic,assign) BOOL  isMoRen;
@property (nonatomic ,strong) CustomBtn * delete_btn;
@end
