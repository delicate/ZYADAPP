//
//  AppSettings.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-9.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabbarView.h"
#import "HeaderView.h"

#define APP_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define APP_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define TABBAR_HEIGHT 35
#define SCREEN_MODE_480_320 0
#define SCREEN_MODE_960_640 1
#define SCREEN_MODE_1136_640 2

TabbarView *globalTabbarView;
CGRect globalHeaderFrame;


@interface AppSettings : NSObject

+ (NSString *) dbContentFilename;
+ (NSString *) dbCookieFilename;
+ (NSString *) getFullFnInDocument:(NSString *)fileName;
+ (AppSettings *) shareInstance;
+ (NSString *)  platform;
+ (NSInteger) screenMode;

@end
