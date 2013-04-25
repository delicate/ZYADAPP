//
//  DeliTabButton.m
//  DeliTabbar
//
//  Created by 曹礼鹏 on 13-4-22.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "DeliTabButton.h"

#define TITLE_OFFSET 8

@implementation DeliTabButton
{
    UIImage *normalImage;
    UIImage *highlightImage;
    UILabel *title;
    UIImageView *backgroud;
    id delegate;
    
    UITapGestureRecognizer *tapRecognizer;
}
@synthesize titleColor, titleShadowColor, titleHighlightColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (DeliTabButton *) initWithTitle:(NSString *)t normalImage:(UIImage *)nImage highlightImage:(UIImage *)hImage delegate:(id <DeliTabButtonDelegate>)d
{
    self = [super init];
    if (self)
    {
        normalImage = nImage;
        highlightImage = hImage;
        delegate = d;
        
        backgroud = [[UIImageView alloc] initWithImage:normalImage highlightedImage:highlightImage];
        backgroud.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
        [self addSubview:backgroud];
        
        tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped)];
        [self addGestureRecognizer:tapRecognizer];
        
        titleColor = [UIColor lightGrayColor];
        titleShadowColor = [UIColor grayColor];
        titleHighlightColor = [UIColor whiteColor];
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, TITLE_OFFSET, normalImage.size.width, 20)];
        title.backgroundColor = [UIColor clearColor];
        title.text = t;
        title.font = [UIFont systemFontOfSize:13];
        title.textColor = titleColor;
        title.highlightedTextColor = titleHighlightColor;
        title.shadowColor = titleShadowColor;
        title.shadowOffset = CGSizeMake(0, 0);
        title.TextAlignment = NSTextAlignmentCenter;
        [self addSubview:title];
        
        self.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    }
    return self;
}

- (void) setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (backgroud.highlighted == highlighted) return;
    
    backgroud.highlighted = highlighted;
    title.highlighted = highlighted;
    if (highlighted)
        title.font = [UIFont boldSystemFontOfSize:13];
    else
        title.font = [UIFont systemFontOfSize:13];
}

- (void)buttonTapped
{
    if (delegate && [delegate respondsToSelector:@selector(tabButtonPressed:)])
    {
        [delegate tabButtonPressed:self];
    }
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
