//
//  CaseViewController.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-28.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAInfiniteGridView.h"
#import "HeaderView.h"

@class Business;

@interface CaseViewController : UIViewController<IAInfiniteGridDataSource, HeaderViewDelegate>

@property (retain, nonatomic) IBOutlet IAInfiniteGridView *gridView;
@property (retain, nonatomic) Business *business;

@end
