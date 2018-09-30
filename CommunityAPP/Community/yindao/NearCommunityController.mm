//
//  NearCommunityController.m
//  CommunityAPP
//
//  Created by 王盼盼 on 2017/12/11.
//  Copyright © 2017年 zhangyipei. All rights reserved.
//

#import "NearCommunityController.h"
#import <BMKLocationkit/BMKLocationComponent.h>
#import "NearCommunityRequest.h"
#import "NearCommunityModel.h"
#import "UserObjModel.h"

@interface NearCommunityController ()<BMKLocationManagerDelegate,BMKLocationAuthDelegate>
{
    BMKLocationManager *_locationManager;
    BMKLocation * _location;
}
@property (nonatomic ,strong) UIView *backView;

@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *community_firstButton;
@property (nonatomic, strong) UIButton *community_secondButton;
@property (nonatomic, strong) UIButton *community_thirdButton;

@property (nonatomic, strong) NearCommunityModel *model;
@end

@implementation NearCommunityController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBMKLocation];
    [self setUpUI];
}
- (void)setUpUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_backView];
    
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 40)];
    _tipLabel.font = FONT(18);
    _tipLabel.textColor = [UIColor blackColor];
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    [self.backView addSubview:_tipLabel];
    _tipLabel.text = @"当前社区没有开通，请选择附近的社区查看";
    
    self.community_firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.community_firstButton.frame = CGRectMake(0, _tipLabel.bottom + 30, 220, 40);
    _community_firstButton.centerX = self.view.width/2;
//    _community_firstButton.layer.cornerRadius = 10.f;
//    _community_firstButton.layer.masksToBounds = YES;
    self.community_firstButton.backgroundColor = [UIColor redColor];
    [self.community_firstButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.community_firstButton];
    [self.community_firstButton addTarget:self action:@selector(first:) forControlEvents:UIControlEventTouchUpInside];
    _community_firstButton.titleLabel.font =FONT(16);
    
    self.community_secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.community_secondButton.frame = CGRectMake(0, _community_firstButton.bottom + 30, 220, 40);
    _community_secondButton.centerX = self.view.width/2;
//    _community_secondButton.layer.cornerRadius = 10.f;
//    _community_secondButton.layer.masksToBounds = YES;
    self.community_secondButton.backgroundColor = [UIColor redColor];
    [self.community_secondButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.community_secondButton];
    [self.community_secondButton addTarget:self action:@selector(second:) forControlEvents:UIControlEventTouchUpInside];
    _community_secondButton.titleLabel.font =FONT(16);

    self.community_thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.community_thirdButton.frame = CGRectMake(0, _community_secondButton.bottom + 30, 220, 40);
    _community_thirdButton.centerX = self.view.width/2;
//    _community_thirdButton.layer.cornerRadius = 10.f;
//    _community_thirdButton.layer.masksToBounds = YES;
    self.community_thirdButton.backgroundColor = [UIColor redColor];
    [self.community_thirdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.community_thirdButton];
    [self.community_thirdButton addTarget:self action:@selector(third:) forControlEvents:UIControlEventTouchUpInside];
    _community_thirdButton.titleLabel.font =FONT(16);

}
- (void)first:(UIButton *)sender{
    CommunityModel *model = self.model.communityArray[0];
    [self setCommunity:model];
}
- (void)second:(UIButton *)sender{
    CommunityModel *model = self.model.communityArray[1];
    [self setCommunity:model];
}
- (void)third:(UIButton *)sender{
    CommunityModel *model = self.model.communityArray[2];
    [self setCommunity:model];
}
- (void)setCommunity:(CommunityModel *)model{
    if(![[HHClient sharedInstance] isLogin]){
        UserObjModel *userModel = [[UserObjModel alloc]init];
        userModel.org_id = model.org_id;
        userModel.vid = model.vid;
        userModel.org_name = model.org_name;
    }else{
        [[HHClient sharedInstance] user].org_id = model.org_id;
        [[HHClient sharedInstance] user].vid = model.vid;
        [[HHClient sharedInstance] user].org_name = model.org_name;
    }
        
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SelectMainWindow object:nil];
}
- (void)setBMKLocation{
    // Do any additional setup after loading the view.
    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"fvfo55A2MG5u2n41eKw3tok9OxGwEOGU" authDelegate:self];
    //初始化实例
    _locationManager = [[BMKLocationManager alloc] init];
    //设置delegate
    _locationManager.delegate = self;
    //设置返回位置的坐标系类型
    _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
    //设置距离过滤参数
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    //设置预期精度参数
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //设置应用位置类型
    _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    //设置是否自动停止位置更新
    _locationManager.pausesLocationUpdatesAutomatically = NO;
    //设置是否允许后台定位
    _locationManager.allowsBackgroundLocationUpdates = NO;
    //设置位置获取超时时间
    _locationManager.locationTimeout = 10;
    //设置获取地址信息超时时间
    _locationManager.reGeocodeTimeout = 10;
    
    [_locationManager startUpdatingLocation];
}
/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error{
    
}


/**
 *  @brief 连续定位回调函数。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error{
    if (error)
    {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
    }
    if (location) {//得到定位信息，添加annotation
        
        if (location.location) {
        
            if (_location) {
                return;
            }
            CLLocationCoordinate2D  coordinate = location.location.coordinate;
            [[HHClient sharedInstance] user].lat = coordinate.latitude;
            [[HHClient sharedInstance] user].lng = coordinate.longitude;
            [self setNearVillageRequestWith:coordinate.latitude log:coordinate.longitude];
            _location = location;
            
        }
    }
}
- (void)setNearVillageRequestWith:(CGFloat)lat log:(CGFloat)log{
    
    __weak typeof(self) tyself = self;
    NearCommunityRequest *request = [[NearCommunityRequest alloc] init];
    [request setNearVillageWithlat:lat lng:log];
    [request setFinishedBlock:^(id object, id responseData) {
        
        NSLog(@"%@",object);
        tyself.model = object;
        [tyself fullData:tyself.model.communityArray];
        
        
    } failedBlock:^(NSInteger error, id responseData) {
        NSLog(@"%ld",error);
    }];
    
}
- (void)fullData:(NSArray *)dataArray{
    CommunityModel *model1 = dataArray[0];
    CommunityModel *model2 = dataArray[1];
    CommunityModel *model3 = dataArray[2];
    
    [_community_firstButton setTitle:model1.org_name forState:UIControlStateNormal];
    [_community_secondButton setTitle:model2.org_name forState:UIControlStateNormal];
    [_community_thirdButton setTitle:model3.org_name forState:UIControlStateNormal];

}
/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
