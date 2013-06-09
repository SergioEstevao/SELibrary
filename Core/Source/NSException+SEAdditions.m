//
//  NSException+SEAdditions.m
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
