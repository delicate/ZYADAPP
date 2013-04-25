//
//  AppSettings.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-9.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TabbarView.h"

#define APP_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define APP_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

TabbarView *globalTabbarView;

@interface AppSettings : NSObject

+ (NSString *) dbContentFilename;
+ (NSString *) dbCookieFilename;
+ (NSString *) getFullFnInDocument:(NSString *)fileName;
+ (AppSettings *) shareInstance;
+ (NSString *)  platform;

@end
