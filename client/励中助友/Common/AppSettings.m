//
//  AppSettings.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-9.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "AppSettings.h"
#import "sys/utsname.h"

#define DB_CONTENT_FILE_NAME    @"zyContent"
#define DB_COOKIE_FILE_NAME    @"zyCookie"

@implementation AppSettings

+ (AppSettings *)shareInstance
{
    static AppSettings* app;
    if (!app)
    {
        app = [[AppSettings alloc] init];
    }
    return app;
}

+ (NSString *)dbContentFilename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    return [directory stringByAppendingPathComponent:DB_CONTENT_FILE_NAME];
}

+ (NSString *) dbCookieFilename
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [paths objectAtIndex:0];
    return [directory stringByAppendingPathComponent:DB_COOKIE_FILE_NAME];
}

+ (NSString *) platform
{
    struct utsname u;
    uname(&u);
    NSString *machine = [NSString stringWithUTF8String:(const char *)u.machine];
    return machine;
}

@end
