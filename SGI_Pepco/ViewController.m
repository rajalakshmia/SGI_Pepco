//
//  ViewController.m
//  pepcosgi_new
//
//  Created by Admin on 10/13/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import "ViewController.h"
#import "WorkOrderDetailViewController.h"
#import "ViewControllerTest.h"
#import "NIDropDown.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //    WordOrderDetailViewController* vc1 = [[WordOrderDetailViewController alloc]init];
    //
    //    [self addChildViewController:vc1];
    //     [self.view addSubview:vc1.view];
    
    //    tab=[[UITabBarController alloc]init];
    
    // FirstViewController
    //    WorkOrderDetailViewController *fvc=[[WorkOrderDetailViewController alloc]initWithNibName:nil bundle:nil];
    ////    fvc.title=@"First";
    //    //fvc.tabBarItem.image=[UIImage imageNamed:@"i.png"];
    //
    //    //SecondViewController
    //    ViewControllerTest *svc=[[ViewControllerTest alloc]initWithNibName:nil bundle:nil];
    ////    svc.title=@"Second";
    //   // svc.tabBarItem.image=[UIImage imageNamed:@"im.png"];
    //
    //
    //
    //    tab.viewControllers=[NSArray arrayWithObjects:fvc, svc, nil];
    //    [self addChildViewController:tab ];
    
    [self configureNavBar];
    
    
    
    
    [self configureUI];
    
    
    [self makeTabBarHidden:YES];
    [_segmentBar addTarget:self
                    action:@selector(segmentIndexChanged:)
          forControlEvents:UIControlEventValueChanged];
    
}
-(void) configureNavBar
{
    UIBarButtonItem *newBackButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Home"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:nil];
    [newBackButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem=newBackButton;
    
    self.navigationItem.title = @"Substation Field Inspection";
    
    //[self.navigationController.navigationBar pushNavigationItem:self.navigationItem animated:NO];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeue" size:22],
      NSFontAttributeName, nil]];
    
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                              NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-Thin" size:22.0]}];
    
    UIBarButtonItem *rightBarButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Updated at 07/22/2014"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:nil];
    [rightBarButton setTintColor:[UIColor whiteColor]];
    
    
    self.navigationItem.rightBarButtonItem = rightBarButton;
    //self.navigationController.navigationBarHidden = YES;
}
-(void) configureUI
{
    [_segmentBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:16.0],
                                          NSForegroundColorAttributeName:[UIColor blackColor]}
                               forState:UIControlStateNormal];
    [_segmentBar setSelectedSegmentIndex:0];
    [[_segmentBar layer] setBorderWidth:0.1f];
    
    CGRect frame= _segmentBar.frame;
    [_segmentBar setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 37.0)];
    
    UIColor *btnColor = [UIColor colorWithRed:147.0/255.0 green:149.0/255.0 blue:152.0/255.0 alpha:1.0];
    [[_btnView layer] setBorderWidth:1.0f];
    [[_btnView layer] setBorderColor:[btnColor CGColor]];
    
    [[_searchSubstnTextView layer] setBorderWidth:1.0f];
    [[_searchSubstnTextView layer] setBorderColor:[btnColor CGColor]];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) segmentIndexChanged:(id)sender
{
    // AppDelegate *theDelegate = [[UIApplication sharedApplication] delegate];
    
    
    if([_segmentBar selectedSegmentIndex] == 0)
    {
        
        [tabBarController setSelectedIndex:0];
        
        
    }
    if ([_segmentBar selectedSegmentIndex] == 1)
    {
        
        [tabBarController setSelectedIndex:1];
        
    }
    if ([_segmentBar selectedSegmentIndex] == 2)
    {
        [tabBarController setSelectedIndex:2];
        
    }
    if ([_segmentBar selectedSegmentIndex] == 3)
    {
        [tabBarController setSelectedIndex:3];
        
    }
    
    for (int i=0; i<[_segmentBar.subviews count]; i++)
    {
        if ([[_segmentBar.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:0 green:103.0/255.0 blue:177.0/255.0 alpha:1.0];
            [[_segmentBar.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        else
        {
            [[_segmentBar.subviews objectAtIndex:i] setTintColor:nil];
        }
    }
    
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"openTabBar"]) {
        //        AlertViewController * childViewController = (AlertViewController *) [segue destinationViewController];
        //        AlertView * alertView = childViewController.view;
        // do something with the AlertView's subviews here...
        //   [[segue destinationViewController] setSelectedIndex:0];
        tabBarController = [segue destinationViewController];
    }
    
    
}

- (void)makeTabBarHidden:(BOOL)hide
{
	// Custom code to hide TabBar
	if ( [tabBarController.view.subviews count] < 2 ) {
		return;
	}
	
	UIView *contentView;
	
	if ( [[tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] ) {
		contentView = [tabBarController.view.subviews objectAtIndex:1];
	} else {
		contentView = [tabBarController.view.subviews objectAtIndex:0];
	}
	
	if (hide) {
		contentView.frame = tabBarController.view.bounds;
	} else {
		contentView.frame = CGRectMake(tabBarController.view.bounds.origin.x,
									   tabBarController.view.bounds.origin.y,
									   tabBarController.view.bounds.size.width,
									   tabBarController.view.bounds.size.height - tabBarController.tabBar.frame.size.height);
	}
	
	tabBarController.tabBar.hidden = hide;
}

- (IBAction)collapseView:(id)sender {
    _workOrderContainerView.hidden = YES;
    [_containerView1 setFrame:CGRectMake(8, 130, 1024, 588)];
}

- (IBAction)filterInspections:(id)sender {
    
    
    
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"All Work Orders(31)", @"Notification Submitted (6)", @"STATUS", @"Initiated(2)", @"Suspended(19)", @"Submitted(10)",@"DATE", @"Upcoming Inspections", @"Due This Month(3)", @"Due Next Month(3)",@"Past Due(1)", nil];
    
    if(dropDownInspcn == nil) {
        CGFloat f = 440;
        dropDownInspcn = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDownInspcn.delegate = self;
        [self.view addSubview:dropDownInspcn];
    }
    else {
        [dropDownInspcn hideDropDown:sender];
        dropDownInspcn = nil;
    }
    
}

- (void) niDropDownDelegateMethod: (UILabel *) sender {
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//
//    //resignFirstResponder for the UITextView
//
//    //call didSelectRow of tableView again, by passing the touch to the super class
//    [super touchesBegan:touches withEvent:event];
//}
@end
