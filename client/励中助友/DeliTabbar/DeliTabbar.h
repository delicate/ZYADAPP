//
//  DeliTabbar.h
//  DeliTabbar
//
//  Created by 曹礼鹏 on 13-4-23.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeliTabButton.h"

@interface DeliTabbar : UIView <DeliTabButtonDelegate>

@property (retain, nonatomic) UIImage *normalImage;
@property (retain, nonatomic) UIImage *highlightImage;
@property (weak, nonatomic) id delegate;

- (DeliTabbar *)initWithFrame:(CGRect)frame delegate:dg;

- (void)setHighlightWithIndex:(NSInteger)index;

@end

@protocol DeliTabbarDelegate <NSObject>

- (NSInteger) tabbarButtonCount;
- (NSString *) titleOnTabIndex:(NSInteger)index;
- (void) tabbarPressed:(NSInteger)tabIndex;

@end
