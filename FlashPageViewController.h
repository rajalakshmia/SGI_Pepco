//
//  FlashPageViewController.h
//  pepcosgi
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashPageViewController : UIViewController<NSURLSessionDelegate,NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate>

@property(nonatomic) NSURLSession *session;
@property(nonatomic) NSURLSessionDownloadTask *downloadTask;
@property(nonatomic,retain)UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic,retain)UIView *loadingView;
@property(nonatomic,retain)UILabel *loadingLabel;
@end
