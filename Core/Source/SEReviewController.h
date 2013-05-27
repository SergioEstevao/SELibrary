//
//  SEAskReview.h
//  SELibrary
//
//  Created by Sergio Estevao on 26/05/2013.
//
//

typedef NS_ENUM(NSInteger,SEReviewResult) {
    SEReviewRated,
    SEReviewDelayed,
    SEReviewDisabled
};

@protocol SEReviewDelegate <NSObject>

- (void) reviewControllerDidFinishWithResult:(SEReviewResult)result;

@end

@interface SEReviewController : NSObject {
}

+ (void) setupWithAppLink:(NSString*)userAppLink
               appVersion:(NSString*)userAppVersion
      minimumTimeInterval:(NSTimeInterval)userMinTimeInterval
          minimumRunCount:(NSInteger)userMinRunCount
            runCountDelay:(NSInteger)userRunCountDelay
                 delegate:(id<SEReviewDelegate>)userDelegate;

+ (void) updateInternetConnectivity:(BOOL)present;

+ (void) rateApp;

+ (void) delayRating;

+ (void) disableRating;

+ (void) increaseRunCount;

+ (BOOL) checkAndShowPrompt;


@end

