//
//  MKEReviewRequester.m
//
//
//  Created by John McKerrell on 05/04/2011.
//  Copyright 2011 MKE Computing Ltd. All rights reserved.
//

#import "SEReviewController.h"
#import "SELogging.h"

@interface SEReviewAlertDelegate : NSObject <UIAlertViewDelegate> {
    UIAlertView *_alertView;
}

@property (nonatomic, retain) UIAlertView *alertView;

@end

@implementation SEReviewAlertDelegate

@synthesize alertView = _alertView;

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (alertView != self.alertView) return;
    
    // 1 - yes, rate
    // 2 - don't ask
    // 0 - later
    if (buttonIndex == 1) {
        [SEReviewController rateApp];
    } else if (buttonIndex == 0) {
        [SEReviewController delayRating];
    } else {
        // Failing very safe by assuming anything else is "don't ask"
        [SEReviewController disableRating];
    }
}

@end

@implementation SEReviewController

static NSString *appLink = nil;
static CGFloat appVersion = 0;
static NSTimeInterval minTimeInterval = 0;
static NSInteger minRunCount = 0;
static SEReviewAlertDelegate *alertDelegate = nil;
static NSInteger runCountDelay = 0;
static id<SEReviewDelegate> delegate = nil;
static BOOL internetConnected = YES;

+ (void) setupWithAppLink:(NSString*)userAppLink
               appVersion:(CGFloat)userAppVersion
      minimumTimeInterval:(NSTimeInterval)userMinTimeInterval
          minimumRunCount:(NSInteger)userMinRunCount
            runCountDelay:(NSInteger)userRunCountDelay
                 delegate:(id<SEReviewDelegate>)userDelegate {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    appLink = [userAppLink copy];
    appVersion = userAppVersion;
    minTimeInterval = userMinTimeInterval;
    minRunCount = userMinRunCount;
    runCountDelay = userRunCountDelay;
    delegate = userDelegate;
    
    if (! [defaults objectForKey:@"SE.appFirstRun"]) {
        [defaults setObject:[NSDate date] forKey:@"SE.appFirstRun"];
        [defaults setBool:YES forKey:@"SE.reviewAllowed"];
        [defaults setFloat:appVersion forKey:@"SE.appVersion"];
        [defaults setBool:NO forKey:@"SE.appAskedForRating"];
        [defaults setInteger:0 forKey:@"SE.runCount"];
        [defaults synchronize];
    } else if( [defaults floatForKey:@"SE.appVersion"] < appVersion) {
        [defaults setObject:[NSDate date] forKey:@"SE.appFirstRun"];
        [defaults setFloat:appVersion forKey:@"SE.appVersion"];
        [defaults setBool:NO forKey:@"SE.appAskedForRating"];
        [defaults setInteger:0 forKey:@"SE.runCount"];
    }
}

+ (void) updateInternetConnectivity:(BOOL)present {
    internetConnected = present;
}

+ (void) rateApp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"SE.appAskedForRating"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    alertDelegate = nil;
    [delegate reviewControllerDidFinishWithResult:SEReviewRated];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appLink]];
}

+ (void) delayRating {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int runCount = [defaults integerForKey:@"SE.runCount"];
    runCount = runCount - runCountDelay;
    [defaults setInteger:runCount forKey:@"SE.runCount"];
    [[NSUserDefaults standardUserDefaults] synchronize ];
    alertDelegate = nil;
    [delegate reviewControllerDidFinishWithResult:SEReviewDelayed];
}

+ (void) disableRating {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"SE.reviewAllowed"];
    [[NSUserDefaults standardUserDefaults] synchronize ];
    alertDelegate = nil;
    [delegate reviewControllerDidFinishWithResult:SEReviewDisabled];
}

+ (void) increaseRunCount {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger runCount = [defaults integerForKey:@"SE.runCount"] + 1;
    [defaults setInteger:runCount forKey:@"SE.runCount"];
    [defaults synchronize];
}

+ (BOOL) checkAndShowPrompt {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if( [defaults boolForKey:@"SE.appAskedForRating"] == NO
       && [defaults boolForKey:@"SE.reviewAllowed"] == YES
       && alertDelegate == nil
       && internetConnected)
    {
        NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:[defaults objectForKey:@"SE.appFirstRun"]];
        if (timeInterval >= minTimeInterval
            && [defaults integerForKey:@"SE.runCount"] >= minRunCount) {            
            alertDelegate = [[SEReviewAlertDelegate alloc] init];            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[thisBundle localizedStringForKey:@"review.title" value:@"Enjoying this app?" table: nil]
                                                                message:[thisBundle localizedStringForKey:@"review.message" value:@"If you're enjoying this version of the app please let us know by reviewing it on the app store" table:nil]
                                                               delegate:alertDelegate
                                                      cancelButtonTitle:[thisBundle localizedStringForKey:@"review.delay" value:@"Remind me later" table:nil]
                                                      otherButtonTitles:[thisBundle localizedStringForKey:@"review.yes" value:@"Yes, rate it!" table:nil],
                                      [thisBundle localizedStringForKey:@"review.never" value:@"Don't ask again" table:nil], nil];
            [alertView show];
            alertDelegate.alertView = alertView;
            alertView = nil;
            
            return YES;
        }
    }
    return NO;
}

@end
