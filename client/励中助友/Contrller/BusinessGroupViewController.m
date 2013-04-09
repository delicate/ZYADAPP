//
//  BusinessGroupViewController.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-3.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "BusinessGroupViewController.h"
#import "BusinessGroup.h"
#import "BusinessGroupList.h"
#import "AppSettings.h"

#define kNumberLabelTag 9999

@interface BusinessGroupViewController ()
{
    BusinessGroupList *groupList;
}

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
    groupList = [BusinessGroupList shareInstance];
    
    [self.gridView setPaging:YES];
    [self.gridView setCircular:YES];
    [self.gridView jumpToIndex:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.gridView startAutoScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)designButtonPressed:(id)sender
{

}

- (IBAction)photoGraphyButtonPressed:(id)sender
{
}

- (IBAction)appButtonPressed:(id)sender
{
}

- (IBAction)printingButtonPressed:(id)sender
{
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
    if (gridIndex > [groupList.items count] - 1) {
        index = [groupList.items count] - 1;
    }
    BusinessGroup *group = [groupList.items objectAtIndex:index];
    NSString *pic = group.thumbInGallery;
    curImg.image = [UIImage imageNamed:pic];
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
    return [groupList.items count];
}

- (CGSize)infiniteGridSize {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGSizeMake(640.0, 640.0);
    }
    
    return CGSizeMake(APP_SCREEN_WIDTH, APP_SCREEN_WIDTH);
}

@end
