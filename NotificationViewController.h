//
//  NotificationViewController.h
//  Equipment
//
//  Created by admin on 08/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAMenuDropDown.h"
#import "NIDropDown.h"



@interface NotificationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,SAMenuDropDownDelegate,NIDropDownDelegate>
{
    
    NIDropDown *dropDownCat;
    
    
    
    
}
- (IBAction)selectCat:(id)sender;
//- (IBAction)selectAlphabetical:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnAllCategories;


@property (nonatomic, strong) SAMenuDropDown *menuDrop;

@property (nonatomic, nonatomic) IBOutlet UIButton *btnSender;





- (IBAction)btnShowMenu:(UIButton *)sender;
@end

