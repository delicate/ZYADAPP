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
}

@end

@implementation VSTabViewController

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
    VSTabBar* tabBar = [[VSTabBar alloc] initWithFrame:CGRectMake(0, APP_SCREEN_HEIGHT - TABBAR_HEIGHT - 20, APP_SCREEN_WIDTH, TABBAR_HEIGHT)];
    tabBar.delegate = self;
    NSArray* array = [[NSArray alloc] initWithObjects:
                      [[VSTabBarItem alloc] initWithTitle:@"主页"],
                      [[VSTabBarItem alloc] initWithTitle:@"搜索"],
                      [[VSTabBarItem alloc] initWithTitle:@"留言"],
                      [[VSTabBarItem alloc] initWithTitle:@"更多"],
                      nil];
    [tabBar setItems:array];
    tabBar.drawImage = NO;
    
    _contextArea = [[UIView alloc] initWithFrame:CGRectMake(0, -20, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT - TABBAR_HEIGHT)];
    
    [self.view addSubview:_contextArea];
    [self.view addSubview:tabBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(VSTabBar *)tabBar selectedItemWithIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
            UIViewController *viewController = [homeStoryboard instantiateViewControllerWithIdentifier:@"page1"];
            [_contextArea addSubview:viewController.view];
            break;
        }
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
            
        default:
            break;
    }
}

@end
