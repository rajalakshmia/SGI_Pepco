//
//  MIRadioButtonGroup.h
//  pepcosgi
//
//  Created by Admin on 9/25/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIRadioButtonGroup;
@protocol MIRadioButtonProtocol <NSObject>

- (void)radioButtonWasPressed:(NSInteger) viewTag;

@end

@interface MIRadioButtonGroup : UIView {
    NSMutableArray *radioButtons;
    
}

@property (nonatomic, assign) id <MIRadioButtonProtocol> delegate;
@property (nonatomic,retain) NSMutableArray *radioButtons;
@property (nonatomic,assign) NSInteger viewTag;


- (id)initWithFrame:(CGRect)frame andOptions:(NSArray *)options
         andColumns:(int)columns;
-(IBAction) radioButtonClicked:(UIButton *) sender;
-(void) removeButtonAtIndex:(int)index;
-(void) setSelected:(int) index;
-(void)clearAll;
-(NSUInteger) getSelected;

@end


