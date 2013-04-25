//
//  VSTabViewController.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-8.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "VSTabViewController.h"
#import "AppSettings.h"

@interface VSTabViewController ()
{
    UIView *_contextArea;
    DeliTabbar *tabbar;
    NSMutableArray *titles;
}

@end

@implementation VSTabViewController
@synthesize homeViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        titles = [[NSMutableArray alloc] initWithObjects:@"主页", @"搜索", @"留言", @"更多", nil];
        CGRect tabbarRect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 55, [UIScreen mainScreen].bounds.size.width, TABBAR_HEIGHT);
        tabbar = [[DeliTabbar alloc] initWithFrame:tabbarRect delegate:self];
        [self.view addSubview:tabbar];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _contextArea = [[UIView alloc] initWithFrame:CGRectMake(0, -20, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - TABBAR_HEIGHT)];
    
    [self.view addSubview:_contextArea];
    
    [self loadHomeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadHomeView
{
    if (!homeViewController)
    {
        UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
        homeViewController = [homeStoryboard instantiateViewControllerWithIdentifier:@"page1"];
        homeViewController.view.frame= CGRectMake(0, 35, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - 70);
        [self.view addSubview:homeViewController.view];
    }
}

@end
