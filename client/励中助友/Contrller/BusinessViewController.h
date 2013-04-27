//
//  BusinessViewController.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-12.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@class BusinessGroup;

@interface BusinessViewController : UICollectionViewController <HeaderViewDelegate>

@property (retain, nonatomic) BusinessGroup *businessGroup;

@end
