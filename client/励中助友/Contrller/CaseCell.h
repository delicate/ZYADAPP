//
//  CaseCell.h
//  励中助友
//
//  Created by 曹礼鹏 on 13-5-6.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Case;

@interface CaseCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *title;
@property (retain, nonatomic) Case *curCase;
@property (weak, nonatomic) id delegate;

- (IBAction)EnterButtonPressed:(id)sender;

@end

@protocol CaseCellDelegate <NSObject>

- (void)EnterCase:(Case *)aCase;

@end
