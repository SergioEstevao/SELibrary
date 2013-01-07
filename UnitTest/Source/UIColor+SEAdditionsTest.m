//
//  UIColor+SEAdditionsTest.m
//  SELibrary
//
//  Created by Sergio Estevao on 13/12/2012.
//  Copyright (c) 2012 Sergio Estevao. All rights reserved.
//

#import "UIColor+SEAdditionsTest.h"
#import "UIColor+SEAdditions.h"

@implementation UIColor_SEAdditionsTest

- (void) test_colorWithRGB{
    STAssertEqualObjects([UIColor colorWithRGB:0x000000],[UIColor colorWithRed:0 green:0 blue:0 alpha:1], @"Test against black color");
    
    STAssertEqualObjects([UIColor colorWithRGB:0xFFFFFF],[UIColor colorWithRed:1 green:1 blue:1 alpha:1], @"Test against white color");
}

- (void) test_colorWithRedGreenBlue{
    STAssertEqualObjects([UIColor colorWithRed:0 green:0 blue:0],[UIColor colorWithRed:0 green:0 blue:0 alpha:1], @"Test against black color");
    
    STAssertEqualObjects([UIColor colorWithRed:255 green:255 blue:255],[UIColor colorWithRed:1 green:1 blue:1 alpha:1], @"Test against white color");
}

- (void) test_htmlHexString{
    STAssertEqualObjects([[UIColor blackColor] htmlHexString],@"#000000", @"Test against black color");
    
    STAssertEqualObjects([[UIColor whiteColor] htmlHexString],@"#ffffff", @"Test against white color");
    
    UIColor * nilColor = nil;
    STAssertNil([nilColor htmlHexString], @"Test against a nil color");
}

@end
