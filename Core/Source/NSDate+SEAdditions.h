//
//  NSDate+SEAdditions.h
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
