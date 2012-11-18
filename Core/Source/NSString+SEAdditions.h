//
//  NSString+SEAdditions.h
//  SELibrary
//
//  Created by Sergio Estevao on 04/03/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

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
