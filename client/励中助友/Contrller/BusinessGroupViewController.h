//
//  BusinessGroupViewController.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-3.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAInfiniteGridView.h"

@interface BusinessGroupViewController : UIViewController<IAInfiniteGridDataSource>

@property (retain, nonatomic) IBOutlet IAInfiniteGridView *gridView;
@property (retain, nonatomic) IBOutlet UIButton *designButton;
@property (retain, nonatomic) IBOutlet UIButton *photographyButton;
@property (retain, nonatomic) IBOutlet UIButton *appButton;
@property (retain, nonatomic) IBOutlet UIButton *printingButton;

- (IBAction)designButtonPressed:(id)sender;
- (IBAction)photoGraphyButtonPressed:(id)sender;
- (IBAction)appButtonPressed:(id)sender;
- (IBAction)printingButtonPressed:(id)sender;

@end
