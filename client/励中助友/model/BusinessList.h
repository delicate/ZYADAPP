//
//  BusinessList.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-15.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Business;
@class BusinessGroup;

@interface BusinessList : NSObject

@property (retain, nonatomic) NSMutableArray *items;

+ (BusinessList *) shareInstance;
- (BusinessList *) initWithGroup:(BusinessGroup *)group;

@end
