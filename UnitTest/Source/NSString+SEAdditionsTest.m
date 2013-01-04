//
//  NSString+SEAdditionsTest.m
//  SELibrary
//
//  Created by Sergio Estevao on 20/08/2012.
//  Copyright (c) 2012 Sergio Estevao. All rights reserved.
//

#import "NSString+SEAdditionsTest.h"
#import "NSString+SEAdditions.h"

@implementation NSString_SEAdditionsTest

- (void) test_tsd_toMD5String{
    STAssertEqualObjects([@"" toMD5String],@"D41D8CD98F00B204E9800998ECF8427E", @"Test against an empty string");
        
    STAssertEqualObjects([@" " toMD5String],@"7215EE9C7D9DC229D2921A40E899EC5F", @"Test against a whitespace string");
    
    STAssertEqualObjects([@"Sergio" toMD5String], @"DC1D67D1A5E9D52940945516548C8EC3", @"Test against a non empty string");
    
    NSString * nilString = nil;
    STAssertNil([nilString toMD5String], @"Test against a nil string");
}

- (void) test_tsd_isEmpty{
    STAssertTrue([@"" isEmpty], @"Test against an empty string");
    
    STAssertFalse([@" " isEmpty], @"Test against an whitespace string");
    
    STAssertFalse([@"Sergio" isEmpty], @"Test against a non empty string");
    
    NSString * nilString = nil;
    STAssertFalse([nilString isEmpty], @"Test against a nil string");
}

- (void) test_tsd_isNullOrEmpty{
    STAssertTrue([NSString isNullOrEmpty:@""], @"Test against an empty string");
    
    STAssertFalse([NSString isNullOrEmpty:@" "], @"Test against a whitespace string");
    
    STAssertFalse([NSString isNullOrEmpty:@"Sergio"], @"Test against a non empty string");
    
    NSString * nilString = nil;
    STAssertTrue([NSString isNullOrEmpty:nilString], @"Test against a nil string");

}

- (void) test_tsd_isNullOrWhiteSpaces{
    STAssertTrue([NSString isNullOrWhiteSpaces:@""], @"Test against an empty string");
    
    STAssertTrue([NSString isNullOrWhiteSpaces:@" "], @"Test against a whitespace string");
    
    STAssertTrue([NSString isNullOrWhiteSpaces:@"\t"], @"Test against a tab string");
    
    STAssertTrue([NSString isNullOrWhiteSpaces:@"\n"], @"Test against a newline string");
    
    STAssertTrue([NSString isNullOrWhiteSpaces:@" \t\n"], @"Test against a newline string");
    
    STAssertFalse([NSString isNullOrWhiteSpaces:@"Sergio"], @"Test against a non empty string");
    
    NSString * nilString = nil;
    STAssertTrue([NSString isNullOrWhiteSpaces:nilString], @"Test against a nil string");

}

@end
