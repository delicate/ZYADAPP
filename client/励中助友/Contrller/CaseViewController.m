//
//  CaseViewController.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-28.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.测试
//

#import "CaseViewController.h"
#import "Business.h"
#import "Case.h"
#import "CaseList.h"
#import "AppSettings.h"
#import "DynamicFileManager.h"

@interface CaseViewController ()

@end

NSInteger kNumberLabelTag = 9999;

@implementation CaseViewController
{
    CaseList *caseList;
    
    HeaderView *headerView;
}
@synthesize gridView, business;

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
	caseList = [[CaseList alloc] initWithBusiness:self.business];
    
    headerView = [[HeaderView alloc] initWithFrame:globalHeaderFrame];
    [self.view addSubview:headerView];
    headerView.delegate = self;
    [headerView setTitle:business.businessName];
    
    [self.gridView setPaging:YES];
    [self.gridView setCircular:YES];
    [self.gridView jumpToIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.gridView startAutoScroll];
}

#pragma mark - Data Source Methods

- (UIView *)infiniteGridView:(IAInfiniteGridView *)gridView forIndex:(NSInteger)gridIndex {
    UIView *grid;
    if (grid == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, [self infiniteGridSize].width, [self infiniteGridSize].height);
        grid = [[UIView alloc] initWithFrame:frame];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
        [imgView setTag:kNumberLabelTag];
        [grid addSubview:imgView];
    }
    
    
    UIImageView *curImg = (UIImageView *)[grid viewWithTag:kNumberLabelTag];
    NSInteger index = gridIndex;
    if (gridIndex > [caseList.thumbsInGallery count] - 1) {
        index = [caseList.thumbsInGallery count] - 1;
    }
    NSString *pic = [caseList.thumbsInGallery objectAtIndex:index];
    DynamicFileManager *fileManager = [DynamicFileManager shareInstance];
    pic = [fileManager getFullFilePathIfExists:pic];
    if (pic)
        curImg.image = [UIImage imageWithContentsOfFile:pic];
    UIButton *backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundButton setFrame:grid.frame];
    NSLog(@"gridIndex:%d",gridIndex);
    backgroundButton.tag = gridIndex;
    NSLog(@"tag:%d",backgroundButton.tag);
    
    [backgroundButton addTarget:self action:@selector(gridViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [grid addSubview:backgroundButton];
    return grid;
}

- (void)gridViewClick:(UIButton *)sender
{
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"%d", sender.tag] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //[alert show];
    //[self goDepartCatDetail:sender.tag];
}

- (NSUInteger)numberOfInfiniteGrids {
    return [caseList.thumbsInGallery count];
}

- (CGSize)infiniteGridSize {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGSizeMake(640.0, 640.0);
    }
    
    return CGSizeMake(APP_SCREEN_WIDTH, APP_SCREEN_WIDTH);
}

#pragma mark - HeaderView delegate

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)goHome
{
    [self.navigationController popToRootViewControllerAnimated:true];
}


@end
