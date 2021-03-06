//
//  NSDate_SEAdditionsTest.m
//  SELibrary
//
//  Created by Sergio Estevao on 16/08/2012.
//
//

#import "NSDate+SEAdditionsTest.h"
#import "NSDate+SEAdditions.h"


@implementation NSDate_SEAdditionsTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)test_dateWithDaysSinceNow
{
    NSDate* date1 = [NSDate dateWithTimeIntervalSinceNow:Day];
    NSDate* date2 = [NSDate dateWithDaysSinceNow:1];
    STAssertTrue([date1 timeIntervalSinceDate:date2] < Minute, @"Comparing dates to see if they are equal");
}

@end
