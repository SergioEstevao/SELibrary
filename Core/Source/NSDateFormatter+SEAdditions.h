//
//  NSDateFormatter+SEAdditions.h
//  SELibrary
//
//  Created by Sergio Estevao on 07/01/2013.
//
//

#import <Foundation/Foundation.h>

/** NSDateFormatter (TSDAdditions) extends the NSDateFormatter class to provide custom functionality.
 
 */
@interface NSDateFormatter (SEAdditions)

/** Creates a formmater with the specified format that is a singleton for the current thread.
 @param format The date format for the receiver. See Data Formatting Guide for a list of the conversion specifiers permitted in date format strings.
 */
+ (NSDateFormatter *) dateFormatterForFormat:(NSString *) format;

@end
