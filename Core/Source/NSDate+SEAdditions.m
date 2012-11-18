//
//  NSDate+SEAdditions.m
//  TMG
//
//  Created by Sergio Estevao on 11/03/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

#import "NSDate+SEAdditions.h"


NSTimeInterval const Day = 60 * 60 * 24;
NSTimeInterval const Hour = 60 * 60;
NSTimeInterval const Minute = 60;

@implementation NSDate (SEAdditions)


+ (NSDate *)dateWithDaysSinceNow:(NSInteger)days {
    return [NSDate dateWithTimeIntervalSinceNow:days * Day];
}

- (NSInteger)daysSinceDate:(NSDate *)date {
    return round(([self timeIntervalSinceDate:date] / Day));
}

- (BOOL)hasDateDifferenceFromNowExceededLimit:(NSTimeInterval)limitInterval {
    NSTimeInterval timeIntervalSinceDate = fabs([self timeIntervalSinceNow]);
    return timeIntervalSinceDate > limitInterval;
}

@end
