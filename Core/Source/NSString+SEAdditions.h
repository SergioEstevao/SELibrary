//
//  NSString+SEAdditions.h
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

/*! 
 NSString (SEAdditions) extends the NSString class to provide custom functionality.
 
 */
@interface NSString (SEAdditions)

/*! 
 Returns the MD5 sum of the receiver
 
 */
- (NSString *)toMD5String;

/*! 
 Returns YES if the string is empty
 */
- (BOOL) isEmpty;

/*! 
 Returns YES if the string is nil or empty
 
 @param str The string to check
 */
+ (BOOL) isNullOrEmpty:(NSString *) str;

/*! 
 Returns YES if the string is nil, empty or only contains withespace chars like: space, tab, newline
 
  @param str The string to check
 */
+ (BOOL) isNullOrWhiteSpaces:(NSString *) str;

@end
