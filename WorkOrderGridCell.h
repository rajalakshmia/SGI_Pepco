//
//  WorkOrderGridCell.h
//  WorkOrderTableView
//
//  Created by admin on 13/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkOrderGridCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *SubstationName;
@property (weak, nonatomic) IBOutlet UILabel *WorkOrderNumber;
@property (weak, nonatomic) IBOutlet UILabel *EquipmentID;
@property (weak, nonatomic) IBOutlet UILabel *Status;
@property (weak, nonatomic) IBOutlet UILabel *DueDate;

@end
