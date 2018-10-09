//
//  HHSessionManager.h
//  HHNetworking
//
//  Created by LWJ on 2016/10/21.
//  Copyright © 2016年 HHAuto. All rights reserved.
//
#import <Foundation/Foundation.h>
@protocol ICClientSession;
@protocol HHAuthSession;
@protocol HHVehicleSession;
@protocol HHCalculateSession;
@protocol HHProjectSession;
@protocol HHFileSession;
@protocol CRMHomeSession;
@protocol CRMWorkSession;
@protocol CRMMineInfoSession;
@protocol CRMTececonfereceSession;


@protocol HHSessionManager <ICClientSession,HHAuthSession,CRMHomeSession,CRMMineInfoSession,CRMTececonfereceSession,CRMWorkSession,HHCalculateSession,HHVehicleSession,HHProjectSession,HHFileSession>

@end
