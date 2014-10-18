//
//  WorkOrderDetailViewController.m
//  pepcosgi
//
//  Created by Admin on 9/23/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import "WorkOrderDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MIRadioButtonGroup.h"
#import "NIDropDown.h"
#import "CustomTableViewCell.h"
#import "CustomTableViewCell1.h"
#import "SubstationTableViewCell.h"
#import "SubstationLeakTableViewCell.h"
#import "SafetySecurityTableViewCell.h"

#define SUBSTATION_NITRO 100
#define SUBSTATION_LEAK 101
#define SUBSTATION_BREAK 102
#define SUBSTATION_CAPACITOR 103
#define SUBSTATION_PRIMARY 104

@interface WorkOrderDetailViewController ()

@end

@implementation WorkOrderDetailViewController

{
    UITableView *safetyTableView;
    UITableView *substnNitroTable;
}

@synthesize btnAllCategories;

- (void)viewDidLoad {
    [super viewDidLoad];
    count =0;
    substationLeakCount=0;
    substationLeakSelectedIndex=0;
    substationBreakSelectedIndex=0;
    substationCapSelectedIndex=0;
    substationPrimSelectedIndex=0;
    
    rowHeight = 0;
    NSLog(@"Count value %d",count);
    
    [[btnAllCategories layer] setBorderWidth:1.0f];
    [[btnAllCategories layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [btnAllCategories setTitle:@"  All Categories (4)" forState:UIControlStateNormal];
    btnAllCategories.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
    [btnAllCategories setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnAllCategories.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTable:) name:@"reloadTable" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadSubstnLeakTableNot:) name:@"reloadSubstnLeakTableNot" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeView:) name:@"removeView" object:nil];
    safetyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width,  self.view.frame.size.height)];
    self.edgesForExtendedLayout = UIRectEdgeNone;    // add to canvas
    [self.view addSubview:safetyTableView];
    safetyTableView.delegate = self;
    safetyTableView.dataSource = self;
    
    // add to canvas
    [self.view addSubview:safetyTableView];
   // [self->safetyTableView registerNib:[UINib nibWithNibName: @"SafetySecurityTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self->safetyTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
//    
//    //Substation Nitro table View
//    substnNitroTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 340, self.view.frame.size.width,  self.view.frame.size.height)];
//    self.edgesForExtendedLayout = UIRectEdgeNone;    // add to canvas
//    [self.view addSubview:substnNitroTable];
//    substnNitroTable.delegate = self;
//    substnNitroTable.dataSource = self;
//    
//    [self.view addSubview:substnNitroTable];
//    [self->substnNitroTable registerNib:[UINib nibWithNibName: @"SubstationTableViewCell" bundle:nil] forCellReuseIdentifier:@"substnCell"];
//    [self->substnNitroTable setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];

    
    
}



-(void)reloadTable:(NSNotification *)notif{
    count =count + 1;
    rowHeight =rowHeight+50;
    
    NSLog(@"Count value %d",count);
    [self->safetyTableView reloadData];
}

-(void)reloadSubstnLeakTableNot:(NSNotification *)notif{
    [self reloadSubstnLeakTable:substationLeakSelectedIndex];
}

-(void)reloadSubstnLeakTable:(NSInteger) index {//:(NSNotification *)notif{
    
    if(index ==0)
    {
        substationLeakCount=0;
        rowHeight=0;
        substationLeakSelectedIndex=0;
    }
    else
    {
    substationLeakCount =substationLeakCount + 1;
    rowHeight =rowHeight+50;
    substationLeakSelectedIndex=index;
    }
    NSLog(@"Count value %d",substationLeakCount);
    [self->safetyTableView reloadData];
}
-(void)reloadSubstnBreakTable:(NSInteger) index {//:(NSNotification *)notif{
    
    if(index ==0)
    {
        substationBreakCount=0;
        rowHeight=0;
        substationBreakSelectedIndex=0;
    }
    else
    {
        substationBreakCount =substationBreakCount + 1;
        rowHeight =rowHeight+50;
        substationBreakSelectedIndex=index;
    }
    NSLog(@"Count value %d",substationBreakCount);
    [self->safetyTableView reloadData];
}
-(void)reloadSubstnCapTable:(NSInteger) index {//:(NSNotification *)notif{
    
    if(index ==0)
    {
        substationCapCount=0;
        rowHeight=0;
        substationCapSelectedIndex=0;
    }
    else
    {
        substationCapCount =substationCapCount + 1;
        rowHeight =rowHeight+50;
        substationCapSelectedIndex=index;
    }
    NSLog(@"Count value %d",substationCapCount);
    [self->safetyTableView reloadData];
}

-(void)reloadSubstnPrimTable:(NSInteger) index {//:(NSNotification *)notif{
    
    if(index ==0)
    {
        substationPrimCount=0;
        rowHeight=0;
        substationPrimSelectedIndex=0;
    }
    else
    {
        substationPrimCount =substationPrimCount + 1;
        rowHeight =rowHeight+50;
        substationPrimSelectedIndex=index;
    }
    NSLog(@"Count value %d",substationPrimCount);
    [self->safetyTableView reloadData];
}

-(void)removeView:(NSNotification *)notif{
    count =count - 1;
    rowHeight =rowHeight-50;
    NSLog(@"Count value %d",count);
    [self->safetyTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 10;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    if(count==0)
        return 1;
    
    if(section==1 || section ==2 || section==3 || section ==4 ||section ==5 || section == 6 ||section ==7)
        return 1;
    else
        return count+1;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
//    if(safetyTableView == substnNitroTable)
//    {
//        static NSString *substnCellIdentifier = @"substnCell";
//        SubstationTableViewCell *cell = (SubstationTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:substnCellIdentifier];
//        if(cell == nil)
//        {
//            cell = [[SubstationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:substnCellIdentifier];
//        }
//    
//        return  cell;
//    }
    
        SafetySecurityTableViewCell *cell = (SafetySecurityTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
        // If there is no cell to reuse, create a new one
        if(cell == nil)
        {
            cell = [[SafetySecurityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        if (indexPath.section ==0 && indexPath.row == 0)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SafetySecurityTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        cell.lblTotalObjects.hidden = TRUE;
        cell.txtDropDown.hidden = TRUE;
        cell.txtSubstation.hidden = TRUE;
        cell.lblSecurity.hidden = FALSE;
        cell.lblGates.hidden = FALSE;
        cell.btnTakePhoto.hidden =FALSE;
        cell.lblTakePhoto.hidden =FALSE;
        cell.btnNotify.hidden =FALSE;
        cell.lblNotify.hidden =FALSE;
        cell.btnAddObject.hidden =FALSE;
        cell.btnRemove.hidden=TRUE;
        cell.radio1.hidden =FALSE;
        cell.radio2.hidden =FALSE;
        cell.radio3.hidden =FALSE;
        cell.radio4.hidden =FALSE;
        cell.lblGood.hidden =FALSE;
        cell.lblModerate.hidden =FALSE;
        cell.lblNeeds.hidden=FALSE;
        cell.lblFair.hidden=FALSE;
        if (count>0)
        {
            cell.lblTotalObjects.hidden = FALSE;
            NSString *txt= [NSString stringWithFormat:@"%d", (int)count];
            cell.lblTotalObjects.text = [[@"The following are in need of attention (" stringByAppendingString:txt] stringByAppendingString:@" total)"];
            
        }
    }
        if((indexPath.section ==0) && (indexPath.row > 0))
    {
        if (count > 0)
        {
            cell.lblTotalObjects.hidden = TRUE;
            cell.txtDropDown.hidden = FALSE;
            cell.txtSubstation.hidden = FALSE;
            cell.btnRemove.hidden=FALSE;
            cell.lblSecurity.hidden = TRUE;
            cell.lblGates.hidden = TRUE;
            cell.btnTakePhoto.hidden =TRUE;
            cell.lblTakePhoto.hidden =TRUE;
            cell.btnNotify.hidden =TRUE;
            cell.lblNotify.hidden =TRUE;
            cell.btnAddObject.hidden =TRUE;
            cell.radio1.hidden =TRUE;
            cell.radio2.hidden =TRUE;
            cell.radio3.hidden =TRUE;
            cell.radio4.hidden =TRUE;
            cell.lblGood.hidden =TRUE;
            cell.lblModerate.hidden =TRUE;
            cell.lblNeeds.hidden=TRUE;
            cell.lblFair.hidden=TRUE;
            cell.txtComments.hidden =TRUE;
            
            
            
            
            
        }
    }
    if (indexPath.section ==1 && indexPath.row == 0)
    {
        static NSString *substnCellIdentifier = @"Cell";
        SubstationTableViewCell *subCell = (SubstationTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:substnCellIdentifier];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubstationTableViewCell" owner:self options:nil];
        subCell = [nib objectAtIndex:0];
        
        
        if(subCell == nil)
        {
            subCell = [[SubstationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:substnCellIdentifier];
        }
       
        subCell.tag = SUBSTATION_NITRO;
        return subCell;
        
    }
    if (indexPath.section ==2 && indexPath.row == 0)
    {
        static NSString *substnCellIdentifier = @"Cell";
        SubstationLeakTableViewCell *subCell = (SubstationLeakTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:substnCellIdentifier];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubstationLeakTableViewCell" owner:self options:nil];
        subCell = [nib objectAtIndex:0];
        
        
        if(subCell == nil)
        {
            subCell = [[SubstationLeakTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:substnCellIdentifier];
        }
        
        NSArray *options =[[NSArray alloc]initWithObjects:@"Good",@"Moderate",@"Fair",@"Needs Attention",nil];
        substnLeakRadioBtnGrp =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 30, 350, 75) andOptions:options andColumns:2];
        substnLeakRadioBtnGrp.delegate=self;
        substnLeakRadioBtnGrp.viewTag=SUBSTATION_LEAK;
        [substnLeakRadioBtnGrp setSelected:substationLeakSelectedIndex];
        [subCell addSubview:substnLeakRadioBtnGrp];
        
        [subCell.substnLeakTextView.layer setBorderWidth:1.0f];
        subCell.footerNote.hidden = YES;
        
        if(substationLeakCount>0)
        {
            subCell.footerNote.hidden = NO;
            subCell.substnLocTxtFld.hidden = NO;
            subCell.substnObject.hidden = NO;
            [subCell.substnObject.layer setBorderWidth:1.0f];
            subCell.addObjectBtn.hidden= NO;
//             [subCell.addObjectBtn addTarget:self action:@selector(reloadSubstnLeakTable:substationLeakSelectedIndex) forControlEvents:UIControlEventTouchUpInside];
//           
        }
        
        return subCell;
        
    }

    if (indexPath.section ==3 && indexPath.row == 0)
    {
        static NSString *substnCellIdentifier = @"Cell";
        SubstationLeakTableViewCell *subCell = (SubstationLeakTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:substnCellIdentifier];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubstationLeakTableViewCell" owner:self options:nil];
        subCell = [nib objectAtIndex:0];
        
        
        if(subCell == nil)
        {
            subCell = [[SubstationLeakTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:substnCellIdentifier];
        }
        
        [subCell.substnLeakTextView.layer setBorderWidth:1.0f];
        
        subCell.substnHeaderLbl.text = @"Breaker Air Compressor(s) Operational";
        
        NSArray *options =[[NSArray alloc]initWithObjects:@"Yes",@"N/A",@"No",nil];
        substationBreakRadioBtnGrp =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 30, 350, 75) andOptions:options andColumns:2];
        substationBreakRadioBtnGrp.delegate=self;
         substationBreakRadioBtnGrp.viewTag=SUBSTATION_BREAK;
        [substationBreakRadioBtnGrp setSelected:substationBreakSelectedIndex];
        [subCell addSubview:substationBreakRadioBtnGrp];
        
        subCell.footerNote.hidden = YES;
        
        if(substationBreakCount>0)
        {
            subCell.footerNote.hidden = NO;
        }
       
        return subCell;
        
    }
    if (indexPath.section ==4 && indexPath.row == 0)
    {
        static NSString *substnCellIdentifier = @"Cell";
        SubstationLeakTableViewCell *subCell = (SubstationLeakTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:substnCellIdentifier];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubstationLeakTableViewCell" owner:self options:nil];
        subCell = [nib objectAtIndex:0];
        
        
        if(subCell == nil)
        {
            subCell = [[SubstationLeakTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:substnCellIdentifier];
        }
        
        [subCell.substnLeakTextView.layer setBorderWidth:1.0f];
        
        subCell.substnHeaderLbl.text = @"Condition of Capacitor Banks (Leaks, Bulged Cans, Blown Fuses, etc.)";
        NSArray *options =[[NSArray alloc]initWithObjects:@"Good",@"Moderate",@"Fair",@"Needs Attention",nil];
        substationCapRadioBtnGrp =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 30, 350, 75) andOptions:options andColumns:2];
        substationCapRadioBtnGrp.delegate=self;
         substationCapRadioBtnGrp.viewTag=SUBSTATION_CAPACITOR;
        
        [substationCapRadioBtnGrp setSelected:substationCapSelectedIndex];
        [subCell addSubview:substationCapRadioBtnGrp];
        
        subCell.footerNote.hidden = YES;
        
        if(substationCapCount>0)
        {
            subCell.footerNote.hidden = NO;
        }
        


        return subCell;
        
    }
    if (indexPath.section ==5 && indexPath.row == 0)
    {
        static NSString *substnCellIdentifier = @"Cell";
        SubstationLeakTableViewCell *subCell = (SubstationLeakTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:substnCellIdentifier];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SubstationLeakTableViewCell" owner:self options:nil];
        subCell = [nib objectAtIndex:0];
        
        
        if(subCell == nil)
        {
            subCell = [[SubstationLeakTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:substnCellIdentifier];
        }
        
        [subCell.substnLeakTextView.layer setBorderWidth:1.0f];
        
        subCell.substnHeaderLbl.text = @"Primary Equipment Condition (Transformers, Breakers, Switches, etc.)";
        NSArray *options =[[NSArray alloc]initWithObjects:@"Good",@"Moderate",@"Fair",@"Needs Attention",nil];
        substationPrimaryRadioBtnGrp =[[MIRadioButtonGroup alloc]initWithFrame:CGRectMake(0, 30, 350, 75) andOptions:options andColumns:2];
        substationPrimaryRadioBtnGrp.delegate=self;
        substationPrimaryRadioBtnGrp.viewTag=SUBSTATION_PRIMARY;
        [substationPrimaryRadioBtnGrp setSelected:substationPrimSelectedIndex];
        [subCell addSubview:substationPrimaryRadioBtnGrp];
        

        subCell.footerNote.hidden = YES;
        
        if(substationCapCount>0)
        {
            subCell.footerNote.hidden = NO;
        }
        return subCell;
        
    }

    
    
    return cell;
}
//-(void) loadInlineView
//{
//
//    NSLog(@"loadInlineViewe %f",110+rowHeight);
//    objectView = [[UIView alloc]initWithFrame:CGRectMake(0,110+rowHeight,640,50)];
//    objectView.backgroundColor=[UIColor redColor];
//}
-(void) RemoveInlineView
{
    
    NSLog(@"loadInlineViewe %f",160-rowHeight);
    objectView = [[UIView alloc]initWithFrame:CGRectMake(0,160-rowHeight,640,50)];
    objectView.backgroundColor=[UIColor redColor];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  160;
    
//    if ((indexPath.section ==0)&& (indexPath.row ==0))
//    {
//        return 160;
//    }
//    if ((indexPath.section ==1)&& (indexPath.row ==0))
//    {
//        return 160;
//    }
//    if ((indexPath.section ==2)&& (indexPath.row ==0))
//    {
//        return 160;
//    }
//    if ((indexPath.section ==3)&& (indexPath.row ==0))
//    {
//        return 160;
//    }if ((indexPath.section ==4)&& (indexPath.row ==0))
//    {
//        return 160;
//    }
//    else
//        return 80;
}


#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (IBAction)selectCat:(id)sender {
    
    
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"All Categories(4)", @"Safety/Security", @"Substation Equipment", @"General Condition", @"Control House",nil];
    
    if(dropDownCat == nil) {
        CGFloat f = 200;
        dropDownCat = [[NIDropDown alloc]showDropDown:sender :&f :arr :nil :@"down"];
        dropDownCat.delegate = self;
        [self.view addSubview:dropDownCat];
    }
    else {
        [dropDownCat hideDropDown:sender];
        dropDownCat = nil;
    }
}

- (void)radioButtonWasPressed:(NSInteger) viewTag {
    
    NSLog(@"View tag = %d", viewTag);
    switch (viewTag) {
        case SUBSTATION_NITRO:
            
            break;
        case SUBSTATION_LEAK:{
            
            int index=[substnLeakRadioBtnGrp getSelected];
            NSLog(@"Selected Index = %d", index);
            
             // [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadSubstnLeakTable" object:nil];
                [self reloadSubstnLeakTable:index];
            
            
        }
            
            break;
        case SUBSTATION_CAPACITOR:
        {
            int index=[substationCapRadioBtnGrp getSelected];
            NSLog(@"Selected Index = %d", index);
            
            // [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadSubstnLeakTable" object:nil];
            [self reloadSubstnCapTable:index];
            
            
    }

    
            break;
        case SUBSTATION_BREAK:
        {
            int index=[substationBreakRadioBtnGrp getSelected];
            NSLog(@"Selected Index = %d", index);
            
            // [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadSubstnLeakTable" object:nil];
            [self reloadSubstnBreakTable:index];
            
            
        }
            break;
        case SUBSTATION_PRIMARY:
        {
            int index=[substationPrimaryRadioBtnGrp getSelected];
            NSLog(@"Selected Index = %d", index);
            
            // [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadSubstnLeakTable" object:nil];
            [self reloadSubstnPrimTable:index];
            
            
        }
            
            break;
        default:
            break;
    }
    
}
- (void) niDropDownDelegateMethod: (UILabel *) sender {
}
@end

