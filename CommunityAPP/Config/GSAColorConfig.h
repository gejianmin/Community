//
//  GSAColorConfig.h
//  GreenShoesActionClient
//
//  Created by 赵东 on 2018/4/9.
//  Copyright © 2018年 赵东. All rights reserved.
//

#ifndef GSAColorConfig_h
#define GSAColorConfig_h

#import <UIkit/UIkit.h>

/*!< alpha通道RGB颜色*/

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/*!< alpha通道十六进制颜色*/

#define HEXCOLOR(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:(a)]

/*!< 通道十六进制颜色*/

#define COLORHEX(hex) [UIColor colorWithRed:((float)(((hex) & 0xFF0000) >> 16)) / 255.0 green:((float)(((hex) & 0xFF00) >> 8))/255.0 blue:((float)((hex) & 0xFF)) / 255.0 alpha:1.0]
#define COLORHEXAndALPHA(hex,a) [UIColor colorWithRed:((float)(((hex) & 0xFF0000) >> 16)) / 255.0 green:((float)(((hex) & 0xFF00) >> 8))/255.0 blue:((float)((hex) & 0xFF)) / 255.0 alpha:a]

/*!< 主题色  08cb9f*/
#define GSA_MAIN_THEME_COLOR       RGBACOLOR(255, 34, 25,1)

/*!< 主背景色*/

#define GSA_MAIN_BG_COLOR          COLORHEX(0xFAFAFA)

/*!< 通用线条颜色 */

#define GSA_LINE_COLOR             RGBACOLOR(211, 212, 212,1)

/*!< 通用线条颜色 #F2F2F2*/

#define GSA_VIEW_BG_COLOR          RGBACOLOR(242, 242, 242,1)

/*!< tabbar文字normal颜色*/
#define GSA_TABBAR_COLOR_NORMAL COLORHEX(0x999999)
/*!< tabbar文字selected颜色*/
#define GSA_TABBAR_COLOR_SELECTED COLORHEX(0xa476c6)
/*!< tabbar背景色 */
#define GSA_TABBAR_COLOR_BACKGROUND COLORHEX(0xffffff)
/*!< nav分割线颜色 */
#define GSA_NAV_COLOR_LINE GSA_VIEW_BG_COLOR




/*!< 常用颜色*/

/*!< #5B8AFF 主题蓝*/
#define kColorMainBlue          COLORHEX(0x08cb9f)

/*!< #666666*/
#define kColorBlack666          COLORHEX(0x666666)
#define kColorBlack999          COLORHEX(0x999999)
#define kColorBlackTitle        COLORHEX(0x4d4d4d)
#define kColorBlackDetailTitle  COLORHEX(0x999999)
#define kColorGrayColor         COLORHEX(0xf5f5f5)
#define kColorUnSelectedTitle   COLORHEX(0xcccccc)
#define kColorUnReadMessageBackGround  COLORHEX(0xfe3f65)
#define kColorLittleTitle       COLORHEXAndALPHA(0x232323,.5)
#define kColorUnableBackGround   COLORHEX(0xd8d8d8)


#define kColorBlue              [UIColor colorWithRed:50/255.0 green:168/255.0 blue:240/255.0 alpha:1]
#define kColorLightBlue         [UIColor colorWithRed:50/255.0 green:168/255.0 blue:240/255.0 alpha:0.5]
#define kColorBlueH             [UIColor colorWithRed:9/255.0 green:104/255.0 blue:184/255.0 alpha:1]
#define kColorBlueD             [UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1]
#define kColorOrange            [UIColor colorWithRed:255/255.0 green:132/255.0 blue:0/255.0 alpha:1]
#define kColorOrange1            [UIColor colorWithRed:255/255.0 green:133/255.0 blue:14/255.0 alpha:1]
#define kColorYellow           COLORHEX(0xFFE029)
/*!< ff9400*/

#define kColorOrange2           [UIColor colorWithRed:255/255.0 green:148/255.0 blue:0/255.0 alpha:1]
#define kColorGreen             [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1]
#define kColorLine1             [UIColor colorWithRed:209/255.0 green:209/255.0 blue:209/255.0 alpha:1]
#define kColorLine2             [UIColor colorWithRed:174/255.0 green:174/255.0 blue:174/255.0 alpha:1]
/*!< #000000*/
#define kColorBlack             [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]
#define kColorGray              [UIColor colorWithRed:101/255.0 green:101/255.0 blue:101/255.0 alpha:1]
/*!< #333333*/
#define kColorGray1             [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
/*!< #4a4a4a*/
#define kColorGray2             [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1]
/*!< #656565*/
#define kColorGray3              [UIColor colorWithRed:101/255.0 green:101/255.0 blue:101/255.0 alpha:1]
/*!< #666666*/
#define kColorGray12              [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
/*!< #8D8E90*/
#define kColorGray4             [UIColor colorWithRed:141/255.0 green:142/255.0 blue:144/255.0 alpha:1]
/*!<  #999999*/
#define kColorGray5             [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]
/*!< #9b9b9b*/
#define kColorGray6             [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1]
/*!< #B3B3B3*/
#define kColorGray11             [UIColor colorWithRed:179/255.0 green:179/255.0 blue:179/255.0 alpha:1]
/*!< #C7C7C7*/
#define kColorGray7             [UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1]
/*!< #ECECEC*/
#define kColorGray8             [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1]
/*!< #f2f2f2*/
#define kColorGray9             [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]
/*!< #FAFAFA*/
#define kColorGray10            [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1]
/*!< #FFFFFF*/
#define kColorWhite             [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
/*!< #FF4C4A*/
#define kColorMainRed           [UIColor colorWithRed:255/255.0 green:76/255.0 blue:74/255.0 alpha:1]
/** #F5001E 100% */
#define kColorRed               [UIColor colorWithRed:245/255.0 green:0/255.0 blue:30/255.0 alpha:1]
#define kColorRedH              [UIColor colorWithRed:210/255.0 green:58/255.0 blue:58/255.0 alpha:1]

#define kColorTitleNav          COLORHEX(0x030303)
#define kColorClear             [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0]
#define kColorBlack2            COLORHEX(0x4d4d4d)
#define kColorBlack3            COLORHEX(0xcccccc)
#define kColorBlack4            COLORHEX(0x808080)
#define kColorF7F7F7           COLORHEX(0xF7F7F7)


#define kColorGreen1            COLORHEX(0x1cd0a4)
#define kColorWhite1            COLORHEX(0xE8E8E8)

#define kColorOrangeMain        COLORHEX(0xFFE029)



#endif /* GSAColorConfig_h */
