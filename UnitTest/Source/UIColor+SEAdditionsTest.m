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

- (void) test_htmlHexString{
    STAssertEqualObjects([[UIColor blackColor] htmlHexString],@"#000000", @"Test against black color");
    
    STAssertEqualObjects([[UIColor whiteColor] htmlHexString],@"#ffffff", @"Test against white color");
    
    UIColor * nilColor = nil;
    STAssertNil([nilColor htmlHexString], @"Test against a nil color");
}

@end
