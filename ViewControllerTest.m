//
//  ViewControllerTest.m
//  pepcosgi_new
//
//  Created by Admin on 10/14/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import "ViewControllerTest.h"

@interface ViewControllerTest ()

@end

@implementation ViewControllerTest

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *security = [[UILabel alloc] initWithFrame:CGRectMake(10 , 35, 350, 21)];
    security.text = @"Refernces View Controller";
    [security setFont:[UIFont fontWithName:@"HelveticaNeue" size:12]];
    [self.view addSubview:security];
    
    UITextView *comments = [[UITextView alloc] initWithFrame:CGRectMake(100.0, 55.0, 250.0, 50.0)];
    [comments setTextColor:[UIColor grayColor]];
    [comments setText:@"Comments"];
    comments.layer.borderColor = [[UIColor grayColor] CGColor];
    comments.layer.borderWidth = 1.0f;
    
    [self.view addSubview:comments];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
