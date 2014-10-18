//
//  SubstationTableViewCell.h
//  pepcosgi_new
//
//  Created by Admin on 10/17/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubstationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *unitNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *pressureLbl1;
@property (weak, nonatomic) IBOutlet UILabel *pressureLbl2;
@property (weak, nonatomic) IBOutlet UILabel *commentLbl;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoBtn;

@property (weak, nonatomic) IBOutlet UIButton *notifyBtn;
- (IBAction)takePhoto:(id)sender;
- (IBAction)notify:(id)sender;

@end
