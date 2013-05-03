//
//  BusinessList.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-15.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "BusinessList.h"
#import "Business.h"
#import <sqlite3.h>
#import "AppSettings.h"
#import "BusinessGroup.h"

@implementation BusinessList
{
    BusinessGroup *parentGroup;
}
@synthesize items;


- (BusinessList *) initWithGroup:(BusinessGroup *)group
{
    self = [super init];
    if (self)
    {
        items = [[NSMutableArray alloc] init];
        parentGroup = group;
        [self loadFromDb];
    }
    return self;
}

- (void) loadFromDb
{
    sqlite3 *database;
    NSString *dbFn = [AppSettings dbContentFilename];
    if (sqlite3_open([dbFn UTF8String], &database) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert(0, @"Open database failed");
    }
    
    NSString *command = @"SELECT businessID, businessName, thumbInTable FROM business WHERE parentGroup = ? AND isEnabled = 1 ORDER BY businessOrder";
    sqlite3_stmt *statement;
    if (sqlite3_prepare(database, [command UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        sqlite3_bind_int(statement, 1, parentGroup.groupID);
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            Business *business = [[Business alloc] init];
            business.businessID = sqlite3_column_int(statement, 0);
            business.businessName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
            business.thumbInTable = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
            [items addObject:business];
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
}

@end
