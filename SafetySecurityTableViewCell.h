//
//  SafetySecurityTableViewCell.h
//  SafetySecurityCell
//
//  Created by admin on 15/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SafetySecurityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTotalObjects;
@property (strong, nonatomic) IBOutlet UITextField *txtSubstation;
@property (weak, nonatomic) IBOutlet UILabel *lblSecurity;
@property (weak, nonatomic) IBOutlet UILabel *lblGates;
@property (strong, nonatomic) IBOutlet UIButton *btnTakePhoto;
@property (strong, nonatomic) IBOutlet UILabel *lblTakePhoto;
@property (strong, nonatomic) IBOutlet UIButton *btnNotify;
@property (strong, nonatomic) IBOutlet UILabel *lblNotify;
@property (strong, nonatomic) IBOutlet UIButton *radio1;
@property (strong, nonatomic) IBOutlet UIButton *radio2;
@property (strong, nonatomic) IBOutlet UIButton *radio3;
@property (strong, nonatomic) IBOutlet UIButton *radio4;
@property (strong, nonatomic) IBOutlet UILabel *lblGood;
@property (strong, nonatomic) IBOutlet UILabel *lblFair;
@property (strong, nonatomic) IBOutlet UILabel *lblModerate;
@property (strong, nonatomic) IBOutlet UILabel *lblNeeds;
@property (strong, nonatomic) IBOutlet UIButton *btnAddObject;
@property (strong, nonatomic) IBOutlet UITextField *txtComments;
@property (strong, nonatomic) IBOutlet UIButton *btnRemove;

@property (strong, nonatomic) IBOutlet UITextField *txtDropDown;



- (IBAction)btnSafetyPhotoClick:(id)sender;
- (IBAction)btnSafetyNotifyClick:(id)sender;

- (IBAction)btnSafetyAddObject:(id)sender;
- (IBAction)btnSafetyRemoveObject:(id)sender;

@end
