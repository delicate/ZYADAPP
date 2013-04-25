//
//  DeliTabButton.h
//  DeliTabbar
//
//  Created by 曹礼鹏 on 13-4-22.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeliTabButtonDelegate;

@interface DeliTabButton : UIView

- (DeliTabButton *) initWithTitle:(NSString *)title normalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage delegate:(id <DeliTabButtonDelegate>)delegate;

@property (retain, nonatomic) UIColor *titleColor;
@property (retain, nonatomic) UIColor *titleShadowColor;
@property (retain, nonatomic) UIColor *titleHighlightColor;
@property (nonatomic) NSInteger tabIndex;

- (void) setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

@end

@protocol DeliTabButtonDelegate <NSObject>

- (void) tabButtonPressed:(DeliTabButton *)button;

@end
