//
//  MIRadioButtonGroup.m
//  pepcosgi
//
//  Created by Admin on 9/25/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import "MIRadioButtonGroup.h"


#define RADIO_SELECTED 5
#define RADIO_DE_SELECT 1

@implementation MIRadioButtonGroup
@synthesize radioButtons,viewTag;

- (id)initWithFrame:(CGRect)frame andOptions:(NSArray *)options andColumns:(int)columns{
	
	NSMutableArray *arrTemp =[[NSMutableArray alloc]init];
	self.radioButtons =arrTemp;
	//[arrTemp release];
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		int framex =0;
		framex= frame.size.width/columns;
		int framey = 0;
		framey =frame.size.height/([options count]/(columns));
		int rem =[options count]%columns;
		if(rem !=0){
			framey =frame.size.height/(([options count]/columns)+1);
		}
		int k = 0;
		for(int i=0;i<([options count]/columns);i++){
			for(int j=0;j<columns;j++){
				
			    int x = framex*0.25;
				int y = framey*0.25;
				UIButton *btTemp = [[UIButton alloc]initWithFrame:CGRectMake(framex*j+x, framey*i+y, framex/2+x, framey/2+y)];
				[btTemp addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
				btTemp.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
				[btTemp setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
			    [btTemp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
				btTemp.titleLabel.font =[UIFont systemFontOfSize:14.f];
				[btTemp setTitle:[options objectAtIndex:k] forState:UIControlStateNormal];
				[self.radioButtons addObject:btTemp];
				[self addSubview:btTemp];
		      //  [btTemp release];
				k++;
                
			}
		}
		
        for(int j=0;j<rem;j++){
            
            int x = framex*0.25;
            int y = framey*0.25;
            UIButton *btTemp = [[UIButton alloc]initWithFrame:CGRectMake(framex*j+x, framey*([options count]/columns), framex/2+x, framey/2+y)];
            [btTemp addTarget:self action:@selector(radioButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            btTemp.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [btTemp setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
            [btTemp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btTemp.titleLabel.font =[UIFont systemFontOfSize:14.f];
            [btTemp setTitle:[options objectAtIndex:k] forState:UIControlStateNormal];
            [self.radioButtons addObject:btTemp];
            [self addSubview:btTemp];
       //     [btTemp release];
            k++;
            
			
		}
		
	}
    return self;
}

- (void)dealloc {
	//[radioButtons release];
   // [super dealloc];
}

-(IBAction) radioButtonClicked:(UIButton *) sender{
	for(int i=0;i<[self.radioButtons count];i++){
		[[self.radioButtons objectAtIndex:i] setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
        [[self.radioButtons objectAtIndex:i] setTag:RADIO_DE_SELECT];
	}
	[sender setImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateNormal];
    [sender setTag:RADIO_SELECTED];
    NSLog(@"Tag value of the view = %d", viewTag);
    [_delegate radioButtonWasPressed:viewTag];
    
}


-(void) removeButtonAtIndex:(int)index{
	[[self.radioButtons objectAtIndex:index] removeFromSuperview];
    
}

-(void) setSelected:(int) index{
	for(int i=0;i<[self.radioButtons count];i++){
		[[self.radioButtons objectAtIndex:i] setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
		[[self.radioButtons objectAtIndex:index] setTag:RADIO_DE_SELECT];
	}
	[[self.radioButtons objectAtIndex:index] setImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateNormal];
    NSLog(@"Index of the selected radio button %d", index);
    [[self.radioButtons objectAtIndex:index] setTag:RADIO_SELECTED];
    
    
}

-(NSUInteger) getSelected
{
    NSUInteger index = 0;
    for(int i=0;i<[self.radioButtons count];i++){
		
		NSLog(@"Tag value = %d", [[self.radioButtons objectAtIndex:i] tag]);
        
        if([[self.radioButtons objectAtIndex:i] tag] == RADIO_SELECTED)
        {
            index=i;
            break;
        }
	}
    NSLog(@"Returning the index = %d", index);
    return index;
}

-(void)clearAll{
	for(int i=0;i<[self.radioButtons count];i++){
		[[self.radioButtons objectAtIndex:i] setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
		
	}
    
}

@end
