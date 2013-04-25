//
//  VSTabViewController.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-8.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeliTabbar.h"

#define TABBAR_HEIGHT   35

@interface VSTabViewController : UIViewController <DeliTabbarDelegate>

@property (retain, nonatomic) UIViewController *homeViewController;

@end
