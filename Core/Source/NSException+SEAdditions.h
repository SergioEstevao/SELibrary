//
//  NSException+SEAdditions.h
//  SELibrary
//
//  Created by Sergio Estevao on 19/01/2013.
//
//

#import <Foundation/Foundation.h>

/** Exception Utilities
 */
@interface NSException (SEAdditions)

/** Return a symbol stack crawl from the exception, if possible
 */
- (NSString*)symbolicStack;

/** Return a compact stack crawl (routine addresses only) from the exception
 */
- (NSString*)compactStack;


@end
