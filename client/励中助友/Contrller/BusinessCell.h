//
//  BusinessCell.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-4-13.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelayUpdate.h"

@interface BusinessCell : UICollectionViewCell<DelayUpdate>

@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UILabel *label;

- (void) setImage:(NSString *)imageFn describe:(NSString *)describe;

@end
