//
//  NSDate+SEAdditions.h
//  TMG
//
//  Created by Sergio Estevao on 11/03/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//


extern NSTimeInterval const Day;
extern NSTimeInterval const Hour ;
extern NSTimeInterval const Minute;

/** NSDate (SEAdditions) extends the NSDate class to provide custom functionality.
 
 */
@interface NSDate (SEAdditions)


/** Returns a date which is "days" away from now
 @param days An integer number of days
 */
+ (NSDate *)dateWithDaysSinceNow:(NSInteger)days;


/** Returns an integer number of days difference between receiver and "date"
 @param date A date to comapre to the receiver
 */
- (NSInteger)daysSinceDate:(NSDate *)date;


/** Returns TRUE if the difference of dates is greater than "limitInterval"
 @param limitInterval The limit (in seconds) at which the receiver and now can be different
 */
- (BOOL)hasDateDifferenceFromNowExceededLimit:(NSTimeInterval)limitInterval;


@end
