//
//  NSDateFormatter+SEAdditions.m
//  SELibrary
//
//  Created by Sergio Estevao on 07/01/2013.
//
//

#import "NSDateFormatter+SEAdditions.h"

@implementation NSDateFormatter (SEAdditions)

+ (NSDateFormatter *) dateFormatterForFormat:(NSString *) format {
    NSMutableDictionary * dict = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *formatter = [dict objectForKey:format];
    if ( formatter == nil){
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:format];
        [dict setObject:formatter forKey:format];
    }
    return formatter;
}

@end
