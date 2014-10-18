//
//  SafetySecurityTableViewCell.m
//  SafetySecurityCell
//
//  Created by admin on 15/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "SafetySecurityTableViewCell.h"

@implementation SafetySecurityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnSafetyPhotoClick:(id)sender {
    NSLog(@"Camera implementation coming soon");
}

- (IBAction)btnSafetyNotifyClick:(id)sender {
    NSLog(@"Notify implementation coming soon");
}

- (IBAction)btnSafetyAddObject:(id)sender {
    
    NSLog(@"Add Object coming soon");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadTable" object:nil];
   
}

- (IBAction)btnSafetyRemoveObject:(id)sender {
    NSLog(@"Remove object coming soon");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeView" object:nil];
}
@end
