//
//  NSString+SEAdditions.m
//  SELibrary
//
//  Created by Sergio Estevao on 04/03/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

#import "NSString+SEAdditions.h"
#import <CommonCrypto/CommonHMAC.h>


@implementation NSString (SEAdditions)


- (NSString *)toMD5String {
	unsigned char result[16];
	const char *cStr = [self UTF8String];	
	CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
	return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]]; 		
}

- (BOOL) isEmpty{
    return self.length == 0;
}

+ (BOOL) isNullOrEmpty:(NSString *) str {
    return str == nil || [str isEmpty];
}

+ (BOOL) isNullOrWhiteSpaces:(NSString *) str {
    return str == nil || [str isEmpty] || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]  isEmpty];
}

@end
