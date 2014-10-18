//
//  NIDropDown.m
//  NIDropDown
//
//  Created by Bijesh N on 12/28/12.
//  Copyright (c) 2012 Nitor Infotech. All rights reserved.
//

#import "NIDropDown.h"
#import "QuartzCore/QuartzCore.h"

#define heightConst 135

@interface NIDropDown ()
@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) UIButton *btnSender;
@property(nonatomic, retain) NSArray *list;
@property(nonatomic, retain) NSArray *imageList;
@end

@implementation NIDropDown
@synthesize table;
@synthesize btnSender;
@synthesize list;
@synthesize imageList;
@synthesize delegate;
@synthesize animationDirection;

- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSArray *)imgArr:(NSString *)direction {
    btnSender = b;
    animationDirection = direction;
    self.table = (UITableView *)[super init];
    if (self) {
        // Initialization code
        CGRect btn = b.frame;
        
        self.list = [NSArray arrayWithArray:arr];
        self.imageList = [NSArray arrayWithArray:imgArr];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
            self.layer.shadowOffset = CGSizeMake(-5, -5);
        }else if ([direction isEqualToString:@"down"]) {
            if(b.tag == 1)
            {
            self.frame = CGRectMake(btn.origin.x +12, heightConst+btn.origin.y+btn.size.height, btn.size.width, 0);
            }
            else
            {
                self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
            }
            self.layer.shadowOffset = CGSizeMake(-5, 5);
        }
        
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 8;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, btn.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.layer.cornerRadius = 5;
        table.backgroundColor = [UIColor colorWithRed:0.239 green:0.239 blue:0.239 alpha:1];
        table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        table.separatorColor = [UIColor grayColor];
        table.userInteractionEnabled = YES;
        [self bringSubviewToFront:table];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        if ([direction isEqualToString:@"up"]) {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y-*height, btn.size.width, *height);
        } else if([direction isEqualToString:@"down"]) {
            
            if(b.tag ==1)
            {
            self.frame = CGRectMake(btn.origin.x+12, heightConst+btn.origin.y+btn.size.height, btn.size.width, *height);
            }
            else
            {
                self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, *height);
            }
        }
        table.frame = CGRectMake(0, 0, btn.size.width, *height);
        [UIView commitAnimations];
        [b.superview addSubview:self];
        
        [self addSubview:table];
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
    CGRect btn = b.frame;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    if ([animationDirection isEqualToString:@"up"]) {
        self.frame = CGRectMake(btn.origin.x, btn.origin.y, btn.size.width, 0);
    }else if ([animationDirection isEqualToString:@"down"]) {
        if(b.tag ==1)
        {
        self.frame = CGRectMake(btn.origin.x+12, heightConst+btn.origin.y+btn.size.height, btn.size.width, 0);
        }
        else
        {
            self.frame = CGRectMake(btn.origin.x, btn.origin.y+btn.size.height, btn.size.width, 0);
        }
    }
    table.frame = CGRectMake(0, 0, btn.size.width, 0);
    [UIView commitAnimations];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    cell.textLabel.text =[list objectAtIndex:indexPath.row];
    
    
    //    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(categorySelect:)];
    //    [cell.textLabel setUserInteractionEnabled:YES];
    //    [cell.textLabel addGestureRecognizer:tap];
    
    
    //    if ([self.imageList count] == [self.list count]) {
    //        cell.textLabel.text =[list objectAtIndex:indexPath.row];
    //        cell.imageView.image = [imageList objectAtIndex:indexPath.row];
    //    } else if ([self.imageList count] > [self.list count]) {
    //        cell.textLabel.text =[list objectAtIndex:indexPath.row];
    //        if (indexPath.row < [imageList count]) {
    //            cell.imageView.image = [imageList objectAtIndex:indexPath.row];
    //        }
    //    } else if ([self.imageList count] < [self.list count]) {
    //        cell.textLabel.text =[list objectAtIndex:indexPath.row];
    //        if (indexPath.row < [imageList count]) {
    //            cell.imageView.image = [imageList objectAtIndex:indexPath.row];
    //        }
    //    }
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = v;
    
    return cell;
}

-(void) categorySelect:(UIGestureRecognizer*)recognizer
{
    [self.delegate niDropDownDelegateMethod:self];
    //    if( [recognizer state] == UIGestureRecognizerStateEnded ) {
    //
    //    UILabel *lbl = (UILabel*) [recognizer view];
    //
    //    NSLog(@"sender label = %@", lbl.text);
    //    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideDropDown:btnSender];
    
    UITableViewCell *c = [tableView cellForRowAtIndexPath:indexPath];
    [btnSender setTitle:c.textLabel.text forState:UIControlStateNormal];
    
    for (UIView *subview in btnSender.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            [subview removeFromSuperview];
        }
    }
    imgView.image = c.imageView.image;
    imgView = [[UIImageView alloc] initWithImage:c.imageView.image];
    imgView.frame = CGRectMake(5, 5, 25, 25);
    [btnSender addSubview:imgView];
    
    NSLog(@"Cat = %@", c.textLabel.text);
    [self.delegate niDropDownDelegateMethod:c.textLabel];
    // [self myDelegate];
}

//- (void) myDelegate {
//    [self.delegate niDropDownDelegateMethod:self];
//}

-(void)dealloc {
    //    [super dealloc];
    //    [table release];
    //    [self release];
}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //[super touchesBegan:touches withEvent:event];  //let the tableview handle cell selection
//    [self.nextResponder touchesBegan:touches withEvent:event]; // give the controller a chance for handling touch events
//}
@end
