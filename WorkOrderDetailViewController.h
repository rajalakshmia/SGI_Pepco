//
//  WorkOrderDetailViewController.h
//  pepcosgi
//
//  Created by Admin on 9/23/14.
//  Copyright (c) 2014 Collabera. All rights reserved.


#import <UIKit/UIKit.h>
#import "NIDropDown.h"
#import "MIRadioButtonGroup.h"

@interface WorkOrderDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,MIRadioButtonProtocol>
{
    NSInteger count;
    NSInteger substationLeakCount;
    NSInteger substationLeakSelectedIndex;
    NSInteger substationBreakCount;
    NSInteger substationBreakSelectedIndex;
    NSInteger substationCapCount;
    NSInteger substationCapSelectedIndex;
    NSInteger substationPrimCount;
    NSInteger substationPrimSelectedIndex;
    float rowHeight;
    UIView *objectView;
     NIDropDown *dropDownCat;
    
    MIRadioButtonGroup *substationBreakRadioBtnGrp;
    MIRadioButtonGroup *substationCapRadioBtnGrp;
    MIRadioButtonGroup *substationPrimaryRadioBtnGrp;
    MIRadioButtonGroup *substnLeakRadioBtnGrp;

}
@property (weak, nonatomic) IBOutlet UIButton *btnAllCategories;
@property (weak, nonatomic) IBOutlet UILabel *woNum;
@property (weak, nonatomic) IBOutlet UILabel *subStatn;
@property (weak, nonatomic) IBOutlet UILabel *initiatedDate;
@property (weak, nonatomic) IBOutlet UILabel *fieldLoc;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *substatnAddress;
@property (weak, nonatomic) IBOutlet UILabel *dueDate;
- (IBAction)selectCat:(id)sender;

@end

