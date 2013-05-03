//
//  CaseList.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-28.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "CaseList.h"
#import "Business.h"
#import <sqlite3.h>
#import "AppSettings.h"
#import "Case.h"


@implementation CaseList
{
    Business *parentBusiness;
}

- (CaseList *)initWithBusiness:(Business *)parent
{
    self = [super init];
    if (self)
    {
        parentBusiness = parent;
        self.items = [[NSMutableArray alloc] init];
        self.thumbsInGallery = [[NSMutableArray alloc] init];
        [self loadFromDb];
    }
    return self;
}

- (void)loadFromDb
{
    NSString *dbFn = [AppSettings dbContentFilename];
    sqlite3 *database;
    if (sqlite3_open([dbFn UTF8String], &database) != SQLITE_OK)
    {
        sqlite3_close(database);
        NSAssert(0, @"Open database failed");
    }
    
    sqlite3_stmt *statement;
    NSString *sql = @"SELECT caseID, caseName, describe, thumbInGallery FROM cases WHERE parentBusiness = ? ORDER BY caseOrder";
    if (sqlite3_prepare(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        sqlite3_bind_int(statement, 1, parentBusiness.businessID);
        while (sqlite3_step(statement) == SQLITE_ROW) {
            Case *newCase = [[Case alloc] init];
            newCase.caseID = sqlite3_column_int(statement, 0);
            newCase.caseName = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
            newCase.describe = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
            newCase.parentBusiness = parentBusiness;
            NSString *thumbInGallery = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
            if (thumbInGallery.length > 0)
                [self.thumbsInGallery addObject:thumbInGallery];
            [self.items addObject:newCase];
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
}

@end
