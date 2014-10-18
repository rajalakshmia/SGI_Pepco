//
//  AppDelegate.h
//  pepcosgi
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (copy) void (^sessionCompletionHandler)();
@end
