//
//  ArtDetailBottomView.m
//  CommunityAPP
//
//  Created by 王帅宇 on 2018/9/11.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "ArtDetailBottomView.h"
#import "InfoArt_DetailModel.h"
@implementation ArtDetailBottomView


+ (instancetype)bottomView {
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    return  [[mainBundle loadNibNamed:@"ArtDetailBottomView" owner:nil options:nil] firstObject];
}
- (IBAction)shareClick:(UIButton *)sender {
    
    self.shareBlock();
    
}

- (void)setModel:(InfoArt_DetailModel *)model {
    
    self.fenxiangL.text = model.ontime?:@"";
    self.browseNumL.text = model.views?:@"";
    self.zanNumL.text = model.favorites?:@"";
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
