//
//  YDMutableURLRequest.h
//  YDREAMS
//
//  Created by Cristina Lopes on 9/16/09.
//  Copyright 2009 YDreams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEHTTPData.h"


@interface SEMutableURLRequest 

+ (NSMutableData *)dataWithMultiPartData:(NSArray *)parts withBoundary:(NSString *)stringBoundary;

+ (NSMutableURLRequest*) requestWithUrl:(NSURL*)url andMultipartData:(NSArray*)parts;

@end
