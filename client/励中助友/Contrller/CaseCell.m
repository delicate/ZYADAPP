//
//  CaseCell.m
//  励中助友
//
//  Created by 曹礼鹏 on 13-5-6.
//  Copyright (c) 2013年 zhuyouad. All rights reserved.
//

#import "CaseCell.h"
#import "Case.h"

@implementation CaseCell
@synthesize delegate, title, curCase;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)EnterButtonPressed:(id)sender
{
    if (delegate && [delegate respondsToSelector:@selector(EnterCase:)])
        [delegate EnterCase:curCase];
}

@end
