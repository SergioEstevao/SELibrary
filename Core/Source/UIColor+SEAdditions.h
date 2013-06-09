//
//  UIColor+SEAdditions.h
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

/** UIColor (SEAdditions) extends the UIColor class to provide custom functionality.
 
 */
@interface UIColor (SEAdditions)

/** Returns a color wich is configures with the rgbValue
 @param rgbValue An integer wich represents a color // e.g. 0xffee33
 */
+ (UIColor*)colorWithRGB:(NSInteger)rgbValue;

/** Returns a color wich is configures with the red green blu Values
 @param red An integer wich represents the red component of a color in the range of 0 to 255
 @param green An integer wich represents the red component of a color in the range of 0 to 255
 @param blue An integer wich represents the red component of a color in the range of 0 to 255
 */
+ (UIColor*)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**
 Return a string hexadecimal representation of this NSColor. Splits the color into components with CGColor methods, re-maps them from percentages in the range 0-255, and returns the RGB color (alpha is stripped) in a six character string.
 @returns A CSS hexadecimal NSString specifying this NSColor.
 */
- (NSString *)htmlHexString;
@end
