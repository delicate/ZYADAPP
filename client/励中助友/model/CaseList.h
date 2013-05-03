//
//  CaseList.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-28.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Business;

@interface CaseList : NSObject

@property (retain, nonatomic) NSMutableArray *items;
@property (retain, nonatomic) NSMutableArray *thumbsInGallery;

- (CaseList *)initWithBusiness:(Business *)parent;

@end
