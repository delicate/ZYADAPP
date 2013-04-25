//
//  TabbarView.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-25.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "TabbarView.h"

@implementation TabbarView
{
    DeliTabbar *tabbar;
    NSMutableArray *titles;
    NSInteger lastFocusIndex;
}
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titles = [[NSMutableArray alloc] initWithObjects:@"主页", @"搜索", @"留言", @"更多", nil];
        CGRect tabbarRect = CGRectMake(0, 0, frame.size.width, frame.size.height);
        tabbar = [[DeliTabbar alloc] initWithFrame:tabbarRect delegate:self];
        lastFocusIndex = -1;
        [self addSubview:tabbar];
    }
    return self;
}

- (void)changeFocusIndex:(NSInteger)index
{
    lastFocusIndex = index;
    [tabbar setHighlightWithIndex:index];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (NSInteger) tabbarButtonCount
{
    return [titles count];
}

- (NSString *) titleOnTabIndex:(NSInteger)index
{
    return [titles objectAtIndex:index];
}

- (void) tabbarPressed:(NSInteger)tabIndex;
{
    if (lastFocusIndex == tabIndex) return;
    if (delegate && [delegate respondsToSelector:@selector(tabbarFocusIndexChange:)])
    {
        [delegate tabbarFocusIndexChange:tabIndex];
    }
    lastFocusIndex = tabIndex;
}

@end
