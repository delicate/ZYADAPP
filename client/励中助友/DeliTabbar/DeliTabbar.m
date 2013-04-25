//
//  DeliTabbar.m
//  DeliTabbar
//
//  Created by 曹礼鹏 on 13-4-23.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "DeliTabbar.h"
//#import "DeliTabButton.h"

@implementation DeliTabbar
{
    NSInteger tabButtonCount;
    NSMutableArray *buttons;
}
@synthesize normalImage, highlightImage, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (DeliTabbar *)initWithFrame:(CGRect)frame delegate:dg
{
    self = [self initWithFrame:frame];
    if (self)
    {
        self.delegate = dg;
        buttons = [[NSMutableArray alloc] init];
        [self initTabButtons];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)initTabButtons
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabbarButtonCount)])
    {
        tabButtonCount = [delegate tabbarButtonCount];
        UIImage *normalTemplateImage = [UIImage imageNamed:@"tabbar_normal.png"];
        UIImage *highlightTemplateImage = [UIImage imageNamed:@"tabbar_highlight.png"];
        NSInteger buttonWidth = self.frame.size.width / tabButtonCount;
        NSInteger buttonHeight = self.frame.size.height;
        CGRect subImageFrame = CGRectMake(0, 0, buttonWidth * 2, buttonHeight * 2);
        normalImage = [self copyFrom:normalTemplateImage withFrame:subImageFrame];
        highlightImage = [self copyFrom:highlightTemplateImage withFrame:subImageFrame];
        
        for (int i = 0; i < tabButtonCount; i++) {
            if (delegate && [delegate respondsToSelector:@selector(titleOnTabIndex:)]) {
                NSString *title = [delegate titleOnTabIndex:i];
                DeliTabButton *button = [[DeliTabButton alloc] initWithTitle:title normalImage:normalImage highlightImage:highlightImage delegate:self];
                button.frame = CGRectOffset(button.frame, button.frame.size.width * i, 0);
                button.tabIndex = i;
                [self addSubview:button];
                [buttons addObject:button];
            }
        }
    }
}

- (UIImage *)copyFrom:(UIImage *)originImage withFrame:(CGRect) frame
{
    CGImageRef templateRef = originImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(templateRef, frame);
    CGSize size = frame.size;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, frame, subImageRef);
    UIImage *subImage = [UIImage imageWithCGImage:subImageRef scale:2.0 orientation:nil];//[UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return subImage;
}

- (void) tabButtonPressed:(DeliTabButton *)button
{
    for (DeliTabButton *aButton in buttons) {
        if ([aButton isEqual:button])
            [aButton setHighlighted:YES animated:NO];
        else
            [aButton setHighlighted:NO animated:NO];
    }
    if (delegate && [delegate respondsToSelector:@selector(tabbarPressed:)])
    {
        [delegate tabbarPressed:button.tabIndex];
    }
}

- (void)setHighlightWithIndex:(NSInteger)index
{
    for (DeliTabButton *button in buttons) {
        [button setHighlighted:NO animated:NO];
    }
    DeliTabButton *button = [buttons objectAtIndex:index];
    [button setHighlighted:YES animated:NO];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
