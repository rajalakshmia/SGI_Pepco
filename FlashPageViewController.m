//
//  FlashPageViewController.m
//  pepcosgi
//
//  Created by Admin on 9/22/14.
//  Copyright (c) 2014 Collabera. All rights reserved.
//

#import "FlashPageViewController.h"
#import "AppDelegate.h"
#import "QuartzCore/QuartzCore.h"
#import "Reachability.h"
#import "WorkOrderDetailViewController.h"

static NSString *DownloadURLString = @"http://www.ebookfrenzy.com/code/LargeImage.jpg";

@interface FlashPageViewController ()
@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;
@end

@implementation FlashPageViewController
@synthesize activityIndicatorView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Reachability Check
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    [self.wifiReachability startNotifier];
    [self updateInterfaceWithReachability:self.wifiReachability];
    
    _loadingView = [[UIView alloc] initWithFrame:CGRectMake(75, 355, 400, 170)];
    _loadingView.center =self.view.center; //CGPointMake(_loadingView.frame.size.width / 2, _loadingView.frame.size.height / 2);
    _loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _loadingView.clipsToBounds = YES;
    _loadingView.layer.cornerRadius = 10.0;
    
    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.frame = CGRectMake(170, 45, activityIndicatorView.bounds.size.width, activityIndicatorView.bounds.size.height);
    [_loadingView addSubview:activityIndicatorView];
    
    _loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 115, 300, 22)];
    _loadingLabel.backgroundColor = [UIColor clearColor];
    _loadingLabel.textColor = [UIColor whiteColor];
    _loadingLabel.adjustsFontSizeToFitWidth = YES;
    _loadingLabel.textAlignment = NSTextAlignmentCenter;
    _loadingLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _loadingLabel.numberOfLines = 0;
    _loadingLabel.text = @" Please wait \n Syncing data from the server...";
    [_loadingLabel sizeToFit];
    [_loadingView addSubview:_loadingLabel];
    
    [self.view addSubview:_loadingView];
    [activityIndicatorView startAnimating];
    
    UIViewController *wo= [self.storyboard instantiateViewControllerWithIdentifier:@"workOrderId"];
    [self performSelector:@selector(showWorkOrderDetail) withObject:nil afterDelay:10.0];
    
}

/*!
 * Called by Reachability whenever status changes.
 */

-(void) showWorkOrderDetail
{
  
    
    UIViewController *wo= [self.storyboard instantiateViewControllerWithIdentifier:@"workOrderId"];
    [self.navigationController pushViewController:wo animated:YES];
    
    // [self performSegueWithIdentifier:@"pushToWorkOrderDetail" sender:self];
}
- (void) reachabilityChanged:(NSNotification *)note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
	[self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    NSURLSessionConfiguration *configuration;
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
            connectionRequired = NO;
            NSLog(@"Network available  %@",statusString);
            break;
        }
        case ReachableViaWiFi:      {
            configuration =[NSURLSessionConfiguration backgroundSessionConfiguration:@"org.apache.pepcosgi"];
            configuration.allowsCellularAccess = YES;
            
            _session = [NSURLSession sessionWithConfiguration:configuration
                                                     delegate:self delegateQueue:nil];
            
            NSURL *downloadURL = [NSURL URLWithString:DownloadURLString];
            
            NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL];
            [self.activityIndicatorView startAnimating];
            _downloadTask = [self.session downloadTaskWithRequest:request];
            
            [_downloadTask resume];
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            NSLog(@"Network available  %@",statusString);
            break;
        }
            
        case ReachableViaWWAN:        {
            configuration =[NSURLSessionConfiguration backgroundSessionConfiguration:@"org.apache.pepcosgi"];
            configuration.allowsCellularAccess = YES;
            
            _session = [NSURLSession sessionWithConfiguration:configuration
                                                     delegate:self delegateQueue:nil];
            
            NSURL *downloadURL = [NSURL URLWithString:DownloadURLString];
            
            NSURLRequest *request = [NSURLRequest requestWithURL:downloadURL];
            [self.activityIndicatorView startAnimating];
            _downloadTask = [self.session downloadTaskWithRequest:request];
            
            [_downloadTask resume];
            statusString= NSLocalizedString(@"Reachable WWan", @"");
            NSLog(@"Network available  %@",statusString);
            break;
            
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)downloadURL
{
    NSLog(@"didFinishDownloadToURL: Copying image file");
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *URLs =
    [fileManager URLsForDirectory:NSDocumentDirectory
                        inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = [URLs objectAtIndex:0];
    
    NSURL *fromURL = [[downloadTask originalRequest] URL];
    NSURL *destinationURL =
    [documentsDirectory URLByAppendingPathComponent:[fromURL
                                                     lastPathComponent]];
    
    NSError *error;
    
    // Remove file at the destination if it already exists.
    [fileManager removeItemAtURL:destinationURL error:NULL];
    
    BOOL success = [fileManager copyItemAtURL:downloadURL
                                        toURL:destinationURL error:&error];
    
    if (success)
    {
        NSLog(@"File copy successfully");
        
    }
    else
    {
        NSLog(@"File copy failed: %@", [error localizedDescription]);
    }
    
    [activityIndicatorView stopAnimating];
    [_loadingView removeFromSuperview];
    
    
    
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error == nil)
    {
        NSLog(@"Task %@ completed successfully", task);
    }
    else
    {
        NSLog(@"Task %@ completed with error: %@", task,
              [error localizedDescription]);
    }
    _downloadTask = nil;
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    AppDelegate *appDelegate =
    (AppDelegate *)
    [[UIApplication sharedApplication] delegate];
    
    if (appDelegate.sessionCompletionHandler) {
        void (^completionHandler)() =
        appDelegate.sessionCompletionHandler;
        appDelegate.sessionCompletionHandler = nil;
        completionHandler();
    }
    NSLog(@"Task complete");
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
}
@end
