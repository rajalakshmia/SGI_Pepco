//
//  NotificationTabCell.h
//  Equipment
//
//  Created by admin on 09/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTabCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *EquipType;
@property (weak, nonatomic) IBOutlet UILabel *EquipDesc;
@property (weak, nonatomic) IBOutlet UILabel *EquipFunctionalLocation;
@property (weak, nonatomic) IBOutlet UILabel *EquipCreated;
@property (weak, nonatomic) IBOutlet UILabel *EquipNotificationNumber;
@property (weak, nonatomic) IBOutlet UILabel *EquipTotalNotification;
@property (weak, nonatomic) IBOutlet UILabel *EquipTimesRequired;
@property (weak, nonatomic) IBOutlet UILabel *EquipPurchaseDate;
@property (weak, nonatomic) IBOutlet UILabel *EquipValidTo;
@property (weak, nonatomic) IBOutlet UILabel *EquipEquipmentNumber;
@property (weak, nonatomic) IBOutlet UILabel *EquipPlanningPlant;
@property (weak, nonatomic) IBOutlet UIImageView *EquipImage;

@end
