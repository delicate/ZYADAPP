//
//  DynamicFileManager.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-15.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "DynamicFileManager.h"
#import "AppSettings.h"

@implementation DynamicFileManager

+ (DynamicFileManager *) shareInstance
{
    static DynamicFileManager *instance;
    if (!instance)
    {
        instance = [[DynamicFileManager alloc] init];
    }
    return instance;
}

- (NSString *) getFullFilePathIfExists:(NSString *)fileName
{
    //todo:增加文件是否存在的判定、对未下载文件添加到下载队列
    return [AppSettings getFullFnInDocument:fileName];
}

@end
