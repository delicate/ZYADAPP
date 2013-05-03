//
//  SearchViewController.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-25.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "SearchViewController.h"
#import "AppSettings.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
{
    HeaderView *headerView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    headerView = [[HeaderView alloc] initWithFrame:globalHeaderFrame];
    [self.view addSubview:headerView];
    headerView.delegate = self;
    [headerView setTitle:@"搜索"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
