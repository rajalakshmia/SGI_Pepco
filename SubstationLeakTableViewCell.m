//
//  SubstationLeakTableViewCell.m
//  pepcosgi_new
//
//  Created by Admin on 10/17/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import "SubstationLeakTableViewCell.h"

@implementation SubstationLeakTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnAddObjectClicked:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadSubstnLeakTableNot" object:nil];
    

}
@end
