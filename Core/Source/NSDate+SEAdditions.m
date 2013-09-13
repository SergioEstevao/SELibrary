//
//  NSDate+SEAdditions.m
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

#import "NSDate+SEAdditions.h"


NSTimeInterval const Minute = 60;
NSTimeInterval const Hour = 60 * Minute;
NSTimeInterval const Day = Hour * 24;



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