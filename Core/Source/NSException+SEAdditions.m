//
//  NSException+SEAdditions.m
//  SELibrary
//
//  Created by Sergio Estevao on 19/01/2013.
//
//

#import "NSException+SEAdditions.h"

@implementation NSException (SEAdditions)

// Return a symbol stack crawl from the exception, if possible
- (NSString*)symbolicStack {
    NSString* stack = nil;
    if ([self respondsToSelector: @selector(callStackSymbols)]) {
        NSError* error = nil;
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@".*0x........ (.*) \\+.*" options:NSRegularExpressionCaseInsensitive error:&error];
        
        // loop through the stack trying to extract the routine name from each line that was returned
        // we use a regular expression to strip out extraneous information in an attempt to keep the
        // result as compact as possible
        NSArray* symbols = [self callStackSymbols];
        NSMutableString* string = [[NSMutableString alloc] init];
        NSInteger numberToSkip = 2; // skip the top couple of routines which are always __exceptionPreprocess and objc_exception_throw
        for (NSString* symbol in symbols) {
            if (--numberToSkip < 0) {
                NSArray *matches = [regex matchesInString:symbol options:0 range:NSMakeRange(0, [symbol length])];
                if ([matches count] > 0)
                {
                    NSTextCheckingResult* match = [matches objectAtIndex:0];
                    NSString* routine = [symbol substringWithRange:[match rangeAtIndex:1]];
                    [string appendFormat: @"%@\n", routine];
                }
            }
        }
        
        stack = string;
    }
    
    return stack;
}

// Return a compact stack crawl (routine addresses only) from the exception
- (NSString*)compactStack {
    NSArray* addresses = [self callStackReturnAddresses];
    NSMutableString* stack = [[NSMutableString alloc] init];
    for (NSNumber* address in addresses) {
        [stack appendFormat:@"%x\n", [address integerValue]];
    }
    
    return stack;
}

@end
