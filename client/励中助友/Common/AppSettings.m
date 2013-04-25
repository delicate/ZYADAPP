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

+ (NSString *)documentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)dbContentFilename
{
    return [[self documentPath] stringByAppendingPathComponent:DB_CONTENT_FILE_NAME];
}

+ (NSString *) dbCookieFilename
{
    return [[self documentPath] stringByAppendingPathComponent:DB_COOKIE_FILE_NAME];
}

+ (NSString *) getFullFnInDocument:(NSString *)fileName
{
    return [[self documentPath] stringByAppendingPathComponent:fileName];
}

+ (NSString *) platform
{
    struct utsname u;
    uname(&u);
    NSString *machine = [NSString stringWithUTF8String:(const char *)u.machine];
    return machine;
}

@end
