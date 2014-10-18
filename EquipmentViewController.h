//
//  EquipmentViewController.h
//  EquipmentViewController
//
//  Created by admin on 08/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAMenuDropDown.h"
#import "NIDropDown.h"

@interface EquipmentViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,SAMenuDropDownDelegate,NIDropDownDelegate>
{
    
    NIDropDown *dropDownCat;
    NIDropDown *dropDownAlphabetical;
    
    
    
}
- (IBAction)selectCat:(id)sender;
- (IBAction)selectAlphabetical:(id)sender;





@property (weak, nonatomic) IBOutlet UIButton *btnAllCategories;

@property (weak, nonatomic) IBOutlet UIButton *btnAlphabetical;

@property (nonatomic, strong) SAMenuDropDown *menuDrop;

@property (nonatomic, nonatomic) IBOutlet UIButton *btnSender;





- (IBAction)btnShowMenu:(UIButton *)sender;
@end

