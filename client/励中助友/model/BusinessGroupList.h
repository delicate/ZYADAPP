//
//  BusinessGroupList.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-9.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BusinessGroup;

@interface BusinessGroupList : NSObject

@property (nonatomic, readonly) NSMutableArray *items;

+ (BusinessGroupList *) shareInstance;
- (BusinessGroupList *) init;

@end
