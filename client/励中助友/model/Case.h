//
//  Case.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-28.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Business;

@interface Case : NSObject

@property (nonatomic) NSInteger caseID;
@property (weak, nonatomic) Business *parentBusiness;
@property (retain, nonatomic) NSString *caseName;
@property (retain, nonatomic) NSString *describe;

@end
