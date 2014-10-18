//
//  ViewController.h
//  pepcosgi_new
//
//  Created by Admin on 10/13/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"


@interface ViewController : UIViewController <NIDropDownDelegate>
{
    
    UITabBarController *tabBarController;
    NIDropDown *dropDownInspcn;
    
    
}
//@property (weak, nonatomic) IBOutlet UIView *containerView;
//@property (nonatomic, retain) UITabBarController *tab;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentBar;
@property (weak, nonatomic) IBOutlet UIView *containerView1;

@property (weak, nonatomic) IBOutlet UIView *workOrderContainerView;
@property (weak, nonatomic) IBOutlet UIButton *btnView;
@property (weak, nonatomic) IBOutlet UITextView *searchSubstnTextView;
@property (weak, nonatomic) IBOutlet UIButton *collapseBtn;

- (IBAction)collapseView:(id)sender;
- (IBAction)filterInspections:(id)sender;

@end
