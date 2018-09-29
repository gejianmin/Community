//
//  GSAPublishModel.h
//  GreenShoesActionClient
//
//  Created by tongda ju on 2018/4/16.
//  Copyright © 2018年 赵东. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, selectorStatu) {
    selectorSelectStatu = 1,   // 选择
    selectorInputStatu  = 2,    // 输入框
    segmentShowCustomStyle,  // 自定义风格
};
typedef NS_ENUM(NSInteger, selecStyle) {
    selectDateStyle = 1,   // 日期
    selectToPlaceStyle  = 2,    // 目的地
    selectorInputRichTextStatu,    // 输入框富文本
    selectInterestStyle,  // 兴趣
    selectThemeStyle,  // 主题
    selectSportsTypeStyle,  // 轨迹主题
    selectRoadInterestStyle,//轨迹兴趣主题
    selectPhotoStyle,  // 照片
    selectRendezvousStyle,  // 集合地
    selectPublishRoadStyle,  // 发布路线
    

};
@interface GSAPublishModel : NSObject

@property(nonatomic,strong)NSString * title;/*!< 标题*/
@property(nonatomic,strong)NSString * detailTitle;/*!< 副标题*/
@property(nonatomic,strong)NSString * reuseIdentifier;/*!< cell标识符*/
@property(nonatomic,strong)NSString * buttonTitle;/*!< 按钮标题*/

@property(nonatomic,assign)BOOL isHeidenMark;/*!< 是否隐藏下拉按钮*/
@property(nonatomic,assign)NSInteger selectorStatu;/*!< cell样式*/
@property(nonatomic,strong)NSString * content;/*!< 内容*/
@property(nonatomic,strong)NSString * contentID;/*!< 内容ID*/
@property(nonatomic,strong)NSString * titleName;/*!< 字段ID*/
@property(nonatomic,assign)NSInteger selecStyle;/*!< 选择风格*/
@property(nonatomic,strong)UIImage * roadImage;/*!< 选择风格*/


- (instancetype)initWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle reuseIdentifier:(NSString *)reuseIdentifier buttonTitle:(NSString *)buttonTitle isHeidenMark:(BOOL )isHeidenMark selectorStatu:(NSInteger )selectorStatu content:(NSString *)content contentID:(NSString * )contentID titleName:(NSString * )titleName selecStyle:(NSInteger )selecStyle;

@end
