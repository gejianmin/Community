//
//  PublicCircleController.h
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/4.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "BaseViewController.h"
#import "FocusScrollView.h"

@interface PublicCircleController : BaseViewController
    
@property (nonatomic, copy) NSArray *carouselArray;
@property (nonatomic, strong) FocusScrollView *focusScrollView;
    
@end
