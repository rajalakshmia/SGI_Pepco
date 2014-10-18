//
//  SubstationLeakTableViewCell.h
//  pepcosgi_new
//
//  Created by Admin on 10/17/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubstationLeakTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *substnLeakTextView;
@property (weak, nonatomic) IBOutlet UIButton *substnLeakTakePhoto;
@property (weak, nonatomic) IBOutlet UIButton *substnLeakNotify;
@property (weak, nonatomic) IBOutlet UILabel *substnHeaderLbl;
@property (weak, nonatomic) IBOutlet UILabel *footerNote;
@property (weak, nonatomic) IBOutlet UIButton *substnObject;
@property (weak, nonatomic) IBOutlet UITextField *substnLocTxtFld;
@property (weak, nonatomic) IBOutlet UIButton *addObjectBtn;
- (IBAction)btnAddObjectClicked:(id)sender;

@end
