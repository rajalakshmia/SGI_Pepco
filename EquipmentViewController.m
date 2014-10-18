//
//  EquipmentViewController.m
//  Equipment
//
//  Created by admin on 08/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "EquipmentViewController.h"
#import "EquipmentTabCell.h"

#define ALL_CATEGORIES @"All Equipment (18)"
#define ALL_ALPHABETICAL @"A-Z"

@interface EquipmentViewController ()

@end

@implementation EquipmentViewController
{
    UITableView *tableView;
}
@synthesize  menuDrop = _menuDrop;
@synthesize btnAllCategories,btnAlphabetical;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // init table view
    // CGRect buttonFrame = CGRectMake( 10, 40, 250, 30 );
    //_btnSender = [[UIButton alloc] initWithFrame: buttonFrame];
    // [_btnSender setTitle: @"View :                    ˅ " forState: UIControlStateNormal];
    //[_btnSender addTarget:self action:@selector(btnShowMenu:) forControlEvents:UIControlEventTouchUpInside];
    //[_btnSender setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    // [self.view addSubview:_btnSender];
    // NSArray *arrname = [[NSArray alloc] initWithObjects:@"All Equipment (18)", @"Equipment Type", @"Recent Repairs (3)",nil] ;
    
    
    //  NSArray *arrTitle = [[NSArray alloc] initWithObjects:@"All Equipment (18)", @"Equipment Type", @"Recent Repairs (3)",nil] ;
    
    
    //  NSArray *arrImg = [[NSArray alloc] initWithObjects:@"10.png", @"11.png", @"12.png", @"13.png", @"14.png", @"15.png", @"16.png", @"17.png", @"18.png", @"19.png",nil] ;
    
    
    //_menuDrop = [[SAMenuDropDown alloc] initWithWithSource:_btnSender menuHeight:300.0 itemNames:arrname itemImagesName:arrImg itemSubtitles:arrTitle];
    
    // _menuDrop = [[SAMenuDropDown alloc] initWithSource:_btnSender itemNames:arrname ];
    //_menuDrop.rowHeight = 20;
    
    [[btnAllCategories layer] setBorderWidth:1.0f];
    [[btnAllCategories layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [btnAllCategories setTitle:@"   All Equipment (18) " forState:UIControlStateNormal];
    btnAllCategories.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [btnAllCategories setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnAllCategories.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    [[btnAlphabetical layer] setBorderWidth:1.0f];
    [[btnAlphabetical layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [btnAlphabetical setTitle:@"   A-Z" forState:UIControlStateNormal];
    btnAlphabetical.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [btnAlphabetical setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnAlphabetical.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    
    
    _menuDrop.delegate = self;
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width,  self.view.frame.size.height)];
    self.edgesForExtendedLayout = UIRectEdgeNone;    // add to canvas
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // add to canvas
    [self.view addSubview:tableView];
    [self->tableView registerNib:[UINib nibWithNibName: @"EquipmentTabCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self->tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    
}

//------------------------------------PA-----------------------//
- (IBAction)selectCat:(id)sender {
    
    
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@" All Equipment (18)", @" Equipment Type", @" Recent Repairs (3)",nil];
    
    
    
    if(dropDownCat == nil) {
        CGFloat f = 250;
        dropDownCat = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDownCat.delegate = self;
    }
    else {
        [dropDownCat hideDropDown:sender];
        dropDownCat = nil;
    }
    
}

- (IBAction)selectAlphabetical:(id)sender {
    
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@" A-Z" ,@" Z-A",nil];
    
    
    
    if(dropDownAlphabetical == nil) {
        CGFloat f = 250;
        dropDownAlphabetical = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDownAlphabetical.delegate = self;
    }
    else {
        [dropDownAlphabetical hideDropDown:sender];
        dropDownAlphabetical = nil;
    }
    
    
}


- (void) niDropDownDelegateMethod: (UILabel*) sender
{
    if([sender.text isEqualToString:ALL_CATEGORIES])
    {
        
        
        
        
    }
    else if ([sender.text isEqualToString:ALL_ALPHABETICAL])
    {
        
        
    }
    
}

//-------------------------------PA-------------------//


- (IBAction)btnShowMenu:(UIButton *)sender {
    
    //    if(!sender.selected) {
    //        [_menuDrop showSADropDownMenuWithAnimation:kSAMenuDropAnimationDirectionBottom];
    //        sender.selected = YES;
    //    }
    //    else {
    //        [_menuDrop hideSADropDownMenu];
    //        sender.selected = NO;
    //    }
    //
    tableView.hidden = TRUE;
    [_menuDrop showSADropDownMenuWithAnimation:kSAMenuDropAnimationDirectionBottom];
    
    
    
    [_menuDrop menuItemSelectedBlock:^(SAMenuDropDown *menu, NSInteger index) {
        
        NSLog(@"\n<<Block: Item = %i>>", index);
        tableView.hidden = FALSE;
    }];
}




- (void)saDropMenu:(SAMenuDropDown *)menuSender didClickedAtIndex:(NSInteger)buttonIndex
{
    
    NSLog(@"\n\n##<<%@>>##", menuSender);
    
    NSLog(@"\n\n\nClicked \n\n<<Index#%i>>", buttonIndex);
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 40;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    EquipmentTabCell *cell = (EquipmentTabCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // If there is no cell to reuse, create a new one
    if(cell == nil)
    {
        cell = [[EquipmentTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell before it is displayed...
    //TextFieldFormElement *item = [self.formItems objectAtIndex:indexPath.row];
    
    
    //Read
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row ==0)
    {
        cell.EquipType.text = @"Transformers";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/15/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
        
    }
    else if (indexPath.row == 1)
    {
        cell.EquipType.text = @"Breakers";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/13/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
        
    }
    else if (indexPath.row ==2)
    {
        cell.EquipType.text = @"Transformers";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/15/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
    }
    else if (indexPath.row ==3)
    {
        cell.EquipType.text = @"CapacitorBank";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/13/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
    }
    else if (indexPath.row ==4)
    {
        cell.EquipType.text = @"HVAC";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/13/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
    }
    else if (indexPath.row ==5)
    {
        cell.EquipType.text = @"Switch";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/13/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
    }
    else if (indexPath.row ==6)
    {
        cell.EquipType.text = @"Relay";
        cell.EquipDesc.text =@"Description-Battery Sys,125V Basin Rd";
        cell.EquipFunctionalLocation.text =@"Functional Location -UO-DPL-SUB-000084-BAT-000001";
        cell.EquipCreated.text =@"Created: 8/13/14";
        cell.EquipNotificationNumber.text=@"10276529";
        cell.EquipTotalNotification.text=@"4";
        cell.EquipTimesRequired.text =@"2";
        cell.EquipPurchaseDate.text=@"6/12/2013";
        cell.EquipValidTo.text=@"12/31/9999";
        cell.EquipEquipmentNumber.text=@"400556673";
        cell.EquipPlanningPlant.text=@"CHRI";
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}
#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}
@end
