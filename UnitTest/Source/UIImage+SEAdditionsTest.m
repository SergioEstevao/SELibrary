//
//  UIImage+SEAdditionsTest.m
//  SELibrary
//
//  Created by Sergio Estevao on 08/01/2013.
//
//

#import "UIImage+SEAdditionsTest.h"

@implementation UIImage_SEAdditionsTest

- (void) test_sizeOfImageInURL{
    NSURL * url = [[NSBundle bundleForClass:[self class]] URLForResource:@"Sergio" withExtension:@"jpeg"];
    CGSize size = [UIImage sizeOfImageInURL:url];
    CGSize expectedSize = {256,256};
    STAssertEquals(size, expectedSize , @"Test if size is correct");
    
    size = [UIImage sizeOfImageInURL:nil];
    STAssertEquals(size, CGSizeUnknow , @"Test if size for nil is correct");
}

- (void) test_isValidImage{
    NSURL * url = [[NSBundle bundleForClass:[self class]] URLForResource:@"Sergio" withExtension:@"jpeg"];

    STAssertTrue([UIImage isValidImage:url], @"Test if good image is valid");

    STAssertFalse([UIImage isValidImage:nil], @"Test if nil image is invalid");
    
    url = [[NSBundle bundleForClass:[self class]] URLForResource:@"fake" withExtension:@"png"];
    
    STAssertFalse([UIImage isValidImage:url], @"Test if fake image is invalid");
}


@end
