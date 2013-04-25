//
//  BusinessCell.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-13.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "BusinessCell.h"
#import "DynamicFileManager.h"

@implementation BusinessCell
{
    DynamicFileManager *fileManager;
}
@synthesize image, label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) setImage:(NSString *)imageFn describe:(NSString *)describe
{
    /*fileManager = [DynamicFileManager shareInstance];
    NSString *fullFn = [fileManager getFullFilePathIfExists:imageFn];
    if (fullFn)
    {
        image.image = [UIImage imageNamed:fullFn];
    }*/
    [image setImage:[UIImage imageNamed:imageFn]];
    [label setText:describe];
}

//protocal DelayUpdate
- (void) filePrepared:(NSString *)fileTag
{
    //todo:增加延迟刷新代码
}

@end
