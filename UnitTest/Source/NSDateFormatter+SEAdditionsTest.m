//
//  NSDateFormatter+SEAdditionsTest.m
//  SELibrary
//
//  Created by Sergio Estevao on 07/01/2013.
//
//

#import "NSDateFormatter+SEAdditionsTest.h"
#import "NSDateFormatter+SEAdditions.h"

@implementation NSDateFormatter_SEAdditionsTest

- (void) test_dateFormatterForFormat{
    NSDateFormatter * date = [NSDateFormatter dateFormatterForFormat:@"YYYY MM dd"];
    STAssertEqualObjects(date, [NSDateFormatter dateFormatterForFormat:@"YYYY MM dd"], @"Test if formatters with same format on the same thread the same");         
}
@end
