//
//  BusinessViewController.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-12.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "BusinessViewController.h"
#import "BusinessCell.h"
#import "Business.h"
#import "BusinessList.h"
#import "BusinessGroup.h"
#import "AppSettings.h"
#import "CaseViewController.h"

NSString *kCellID = @"BusinessCell";

@interface BusinessViewController ()

@end

@implementation BusinessViewController
{
    BusinessList *businessList;
    Business *selectedBusiness;
    
    HeaderView *headerView;
}
@synthesize businessGroup;

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
    if (!businessList)
        businessList = [[BusinessList alloc] initWithGroup:businessGroup];
        
    headerView = [[HeaderView alloc] initWithFrame:globalHeaderFrame];
    [self.view addSubview:headerView];
    headerView.delegate = self;
    
    [headerView setTitle:businessGroup.groupName];
    
    self.collectionView.frame = CGRectMake(0, 35, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CaseViewController *caseViewController = [segue destinationViewController];
    caseViewController.business = selectedBusiness;
}

#pragma mark - collectionView delegate

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [businessList.items count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Business *business = [businessList.items objectAtIndex:indexPath.row];
    UINib *nib = [UINib nibWithNibName:@"BusinessCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:kCellID];
    BusinessCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    /*if (!cell)
    {
        UINib *nib = [UINib nibWithNibName:@"BusinessCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:kCellID];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    }*/
    [cell setImage:business.thumbInTable describe:business.businessName];
    
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectedBusiness = [businessList.items objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowCases" sender:self];
}

#pragma mark - HeaderView delegate

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self ]
}

- (void)goHome
{
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
