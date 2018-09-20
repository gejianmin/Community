//
//  JTDCommentView.h
//  PetSocialClient
//
//  Created by 赵东 on 2018/3/1.
//  Copyright © 2018年 JianMin Ge. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JTDCommentViewCallBack)(NSString * content);

@interface JTDCommentView : UIView

+ (instancetype)presentViewWithContentCallback:(JTDCommentViewCallBack)callback;
+ (instancetype)presentViewWithMaxNumber:(NSInteger)maxnum    andContentCallback:(JTDCommentViewCallBack)callback;

@end

@protocol PDTopViewDelegate <NSObject>
@optional

-(void)sendButtonEventDelegateWithButton:(UIButton *)sender;

@end

@interface PSPersonSentView : UIView

@property (nonatomic,weak) id<PDTopViewDelegate>delegate;
@property(nonatomic,strong)UIButton * chat_btn;
@property(nonatomic,strong)CustomBtn * comments_btn;

@end
