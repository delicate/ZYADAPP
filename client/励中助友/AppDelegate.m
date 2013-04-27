//
//  AppDelegate.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-3-25.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "AppDelegate.h"

#import "AppSettings.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    CGRect tabbarRect = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 55, [UIScreen mainScreen].bounds.size.width, TABBAR_HEIGHT);
    globalTabbarView = [[TabbarView alloc] initWithFrame:tabbarRect];
    globalTabbarView.delegate = self;
    [self onTabbarFocusIndexChange:0];
    [globalTabbarView changeFocusIndex:0];
    //sleep(3);
    
    CGRect headerRect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, TABBAR_HEIGHT);
    globalHeaderView = [[HeaderView alloc] initWithFrame:headerRect];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)onTabbarFocusIndexChange:(NSInteger)curIndex
{
    UIStoryboard *storyboard;
    switch (curIndex) {
        case 0:
            storyboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
            break;
        case 1:
            storyboard = [UIStoryboard storyboardWithName:@"SearchStoryboard" bundle:nil];
            break;
        default:
            return;
    }
    id destinctViewController = [storyboard instantiateInitialViewController];
    self.viewController = destinctViewController;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
}

#pragma mark TabbarViewDelegate

- (void)tabbarFocusIndexChange:(NSInteger)curIndex
{
    [self onTabbarFocusIndexChange:curIndex];
}

@end
