//
//  BusinessGroupList.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-9.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "BusinessGroupList.h"
#import <sqlite3.h>
#import "AppSettings.h"
#import "BusinessGroup.h"

@implementation BusinessGroupList
@synthesize items;

+ (BusinessGroupList *)shareInstance
{
    static BusinessGroupList *instance;
    if (!instance)
        instance = [[BusinessGroupList alloc] init];
    return instance;
}

- (BusinessGroupList *)init
{
    self = [super init];
    if (self)
    {
        items = [[NSMutableArray alloc] init];
        [self loadFromDB];
    }
    return self;
}

- (void) loadFromDB
{
    sqlite3 *database;
    NSString *dbFilename = [AppSettings dbContentFilename];
    if (sqlite3_open([dbFilename UTF8String], &database) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert(0, @"Open content database failed");
    }
    
    sqlite3_stmt *statement;
    NSString *sql = @"SELECT groupID, groupName, groupIcon, thumbInGallery FROM businessGroup WHERE isEnabled = 1 ORDER BY businessGroupOrder";
    if (sqlite3_prepare(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            BusinessGroup *group = [[BusinessGroup alloc] init];
            group.groupID = sqlite3_column_int(statement, 0);
            group.groupName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
            group.groupIcon = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
            group.thumbInGallery = [NSString stringWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
            [items addObject:group];
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
}

@end
