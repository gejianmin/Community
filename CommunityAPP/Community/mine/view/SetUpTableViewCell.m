//
//  SetUpTableViewCell.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2018/3/13.
//  Copyright © 2018年 zhangyipei. All rights reserved.
//

#import "SetUpTableViewCell.h"

@interface SetUpTableViewCell ()

@property(nonatomic,strong) UISwitch  * pushSwitch;

@end
@implementation SetUpTableViewCell
    
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath{
    if (self = [ super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //注册KVO 方便别处监听昵称、头像的变化
        [[HHComlient sharedInstance].user addObserver:self
                                           forKeyPath:@"nickname"
                                              options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew
                                              context:nil];
        [[HHComlient sharedInstance].user addObserver:self
                                           forKeyPath:@"face"
                                              options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew
                                              context:nil];
        
        [self setupUI];
        if(self.reuseIdentifier){
            
        }
    }
    return self;
}

//keyPath:属性名称
//object:被观察的对象
//change:变化前后的值都存储在 change 字典中
//context:注册观察者时，context 传过来的值
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context {
    
    if ([keyPath isEqualToString:@"nickname"]) {// 昵称改变
        self.nickLabel.text = [change valueForKey:@"new"];
    }
    if ([keyPath isEqualToString:@"face"]) {
        [self.iconIma sd_setImageWithURL:[NSURL URLWithString:[change valueForKey:@"new"]] placeholderImage:ImageNamed(@"icon")];
    }
    
    
}

-(void)setupUI{
    if(self.reuseIdentifier == kNormalCellReuseIdentifier){
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        [self.contentView addSubview:self.rightLabel];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-5);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }else if (self.reuseIdentifier == kImageCellReuseIdentifier){
        [self.contentView addSubview:self.iconIma];
        HHLog(@"头像地址 =  %@ ",[HHComlient sharedInstance].user.face);
        [self.iconIma sd_setImageWithURL:[NSURL URLWithString:[HHComlient sharedInstance].user.face] placeholderImage:ImageNamed(@"icon")];
        [self.iconIma mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.width.height.equalTo(@45);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        [self.contentView addSubview:self.nickLabel];
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.top.equalTo(self.iconIma.mas_top).offset(0);
        }];
        [self.contentView addSubview:self.VIPLabel];
        self.VIPLabel.text = [NSString stringWithFormat:@"会员名:%@",[HHComlient sharedInstance].user.nickname];
        [self.VIPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIma.mas_right).offset(7);
            make.bottom.equalTo(self.iconIma.mas_bottom).offset(0);
        }];
    }else if (self.reuseIdentifier == kSwichCellReuseIdentifier){
        self.accessoryType=UITableViewCellAccessoryNone;
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(15);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        [self.contentView addSubview:self.pushSwitch];
        [self.pushSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-15);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    
}
-(UISwitch *)pushSwitch{
    if(!_pushSwitch){
        _pushSwitch = [[UISwitch alloc]init];
        _pushSwitch.transform = CGAffineTransformMakeScale(0.8, 0.8);
        [_pushSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        if([self isMessageNotificationServiceOpen]){
            [_pushSwitch setOn:YES];
        }else{
            [_pushSwitch setOn:NO];
        }
    }
    return _pushSwitch;
}
-(void)switchAction:(UISwitch *)sender{
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }    
}
#pragma mark--通知是否打开
-(BOOL)isMessageNotificationServiceOpen {
    if (GSA_IOS_8_L) {
        return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
    } else {
        return UIRemoteNotificationTypeNone != [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    }
}
-(UIImageView *)iconIma{
    if(!_iconIma){
        _iconIma = [[UIImageView alloc]initWithImage:ImageNamed(@"icon")];
        [_iconIma makeCornerWithCornerRadius:22.5 borderWidth:0 borderColor:nil];
    }
    return _iconIma;
}
    -(CustomLab *)nickLabel{
        if(!_nickLabel){
            _nickLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentRight text:@"点击设置昵称" textcolor:kColorGray4];
        }
        return _nickLabel;
    }
    -(CustomLab *)VIPLabel{
        if(!_VIPLabel){
            _VIPLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentRight text:@"会员名：" textcolor:kColorGray4];
        }
        return _VIPLabel;
    }
-(CustomLab *)leftLabel{
    if(!_leftLabel){
        _leftLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:15 aligment:NSTextAlignmentLeft text:@"wode" textcolor:kColorBlack];
    }
    return _leftLabel;
}
-(CustomLab *)rightLabel{
    if(!_rightLabel){
        _rightLabel = [[CustomLab alloc]initWithFrame:CGRectZero font:14 aligment:NSTextAlignmentRight text:@"hside" textcolor:kColorGray4];
    }
    return _rightLabel;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
    
    @end
