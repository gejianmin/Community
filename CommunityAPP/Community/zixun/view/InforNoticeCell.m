//
//  InforNoticeCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/13.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "InforNoticeCell.h"

@interface InforNoticeCell ()
@property (nonatomic ,strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@end

@implementation InforNoticeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5,50, 60)];
        self.tipLabel.textColor = [UIColor redColor];
        self.tipLabel.font = FONT(20);
        self.tipLabel.numberOfLines = 2;
        self.tipLabel.lineBreakMode = NSLineBreakByCharWrapping | NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.tipLabel];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, SCREEN_WIDTH - 140, 60)];
        self.messageLabel.textColor = [UIColor blackColor];
        self.messageLabel.font = FONT(14);
        self.messageLabel.numberOfLines = 2;
        self.messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.messageLabel];

    }
    return self;
}
- (void)setModel:(InforVillage_NoticeModel *)model{
    _model = model;
    if (model.notice_title.length != 0) {
        NSMutableString *str1=[[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"%@",model.notice_title]];//存在堆区，可变字符串
        [str1 insertString:@"\n" atIndex:1];
        self.tipLabel.text = str1;
    }
    
    self.messageLabel.text = model.notice_content?:@"";
    
}
@end
