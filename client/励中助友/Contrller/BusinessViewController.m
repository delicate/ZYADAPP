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

NSString *kCellID = @"BusinessCell";

@interface BusinessViewController ()

@end

@implementation BusinessViewController
{
    BusinessList *businessList;
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
    [self.view addSubview:globalHeaderView];
    globalHeaderView.delegate = self;
    [globalHeaderView setTitle:businessGroup.groupName];
    self.collectionView.frame = CGRectMake(0, 35, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self ]
}

@end
