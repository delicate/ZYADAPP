//
//  BusinessGroupViewController.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-3.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "BusinessGroupViewController.h"

@interface BusinessGroupViewController ()

@end

@implementation BusinessGroupViewController
@synthesize designButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)designButtonPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"page1"];
    [self.view addSubview:viewController.view];
}

@end
