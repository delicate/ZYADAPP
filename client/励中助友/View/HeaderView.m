//
//  HeaderView.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-26.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
{
    UIButton *goBackButton;
    UIButton *goHomeButton;
    UILabel *title;
    UIImageView *imageView;
}
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initButtons];
    }
    return self;
}

-(UIImage*)scaleToSize:(CGSize)size fromOriginImage:(UIImage*)originImage
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [originImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (void)initButtons
{
    imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"tabbar_normal.png"]];
    imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:imageView];
    
    CGSize buttonSize = CGSizeMake(54, 50);
    
    goBackButton = [[UIButton alloc] init];
    UIImage *goBackImageNormal = [self scaleToSize:buttonSize fromOriginImage:[UIImage imageNamed:@"goback_normal.png"]];
    UIImage *goBackImageHighlight = [UIImage imageNamed:@"goback_highlight.png"];
    [goBackButton setImage:goBackImageNormal forState:UIControlStateNormal];
    [goBackButton setImage:goBackImageHighlight forState:UIControlStateHighlighted];
    goBackButton.frame = CGRectMake(0, (self.frame.size.height - goBackImageNormal.size.height) / 2, goBackImageNormal.size.width, goBackImageNormal.size.height);
    [goBackButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:goBackButton];
    
    goHomeButton = [[UIButton alloc] init];
    UIImage *goHomeImageNormal = [self scaleToSize:buttonSize fromOriginImage:[UIImage imageNamed:@"gohome_normal.png"]];
    UIImage *goHomeImageHighlight = [UIImage imageNamed:@"gohome_highlight.png"];
    [goHomeButton setImage:goHomeImageNormal forState:UIControlStateNormal];
    [goHomeButton setImage:goHomeImageHighlight forState:UIControlStateHighlighted];
    goHomeButton.frame = CGRectMake(self.frame.size.width - goHomeImageNormal.size.width - 0, (self.frame.size.height - goHomeImageNormal.size.height) / 2, goHomeImageNormal.size.width, goHomeImageNormal.size.height);
    [self addSubview:goHomeButton];
    
    title = [[UILabel alloc] init];
    title.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    title.backgroundColor = [UIColor clearColor];
    title.Font = [UIFont boldSystemFontOfSize:20];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    [self addSubview:title];
}

- (void)setTitle:(NSString *)titleText
{
    title.text = titleText;
}

- (void)goBack
{
    if (delegate && [delegate respondsToSelector:@selector(goBack)])
        [delegate goBack];
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
