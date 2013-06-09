//
//  SEReviewController.h
//
// Copyright (c) 2013 Sergio Estevao (http://sergioestevao.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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

