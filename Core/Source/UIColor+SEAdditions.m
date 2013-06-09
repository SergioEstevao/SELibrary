//
//  UIColor+SEAdditions.m
///
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

#import "UIColor+SEAdditions.h"

@implementation UIColor (SEAdditions)

+ (UIColor*)colorWithRGB:(NSInteger)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0f
                            blue:((float)(rgbValue & 0xFF))/255.0f
                           alpha:1.0];
}

+ (UIColor*)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue{
    return [UIColor colorWithRed:(float)red/255.0f
                           green:(float)green/255.0f
                            blue:(float)blue/255.0f
                           alpha:1.0];

}

- (NSString *)htmlHexString
{
	CGColorRef color = self.CGColor;
	size_t count = CGColorGetNumberOfComponents(color);
	const CGFloat *components = CGColorGetComponents(color);
	
	static NSString *stringFormat = @"#%02x%02x%02x";
	
	// Grayscale
	if (count == 2)
	{
		NSUInteger white = (NSUInteger)(components[0] * (CGFloat)255);
		return [NSString stringWithFormat:stringFormat, white, white, white];
	}
	
	// RGB
	else if (count == 4)
	{
		return [NSString stringWithFormat:stringFormat, (NSUInteger)(components[0] * (CGFloat)255),
				(NSUInteger)(components[1] * (CGFloat)255), (NSUInteger)(components[2] * (CGFloat)255)];
	}
	
	// Unsupported color space
	return nil;
}

@end
