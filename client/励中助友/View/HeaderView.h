//
//  HeaderView.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-26.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

@property (weak, nonatomic) id delegate;

- (void)setTitle:(NSString *)titleText;

@end

@protocol HeaderViewDelegate <NSObject>

- (void)goBack;
- (void)goHome;

@end
