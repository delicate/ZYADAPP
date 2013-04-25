//
//  TabbarView.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-25.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeliTabbar.h"

@interface TabbarView : UIView <DeliTabbarDelegate>

@property (weak, nonatomic) id delegate;

- (void)changeFocusIndex:(NSInteger)index;

@end

@protocol TabbarViewDelegate <NSObject>

- (void)tabbarFocusIndexChange:(NSInteger)curIndex;

@end
