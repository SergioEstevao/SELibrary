//
//  YDMutableURLRequest.m
//  YDREAMS
//
//  Created by Cristina Lopes on 9/16/09.
//  Copyright 2009 YDreams. All rights reserved.
//

#import "SEMutableURLRequest.h"


@implementation SEMutableURLRequest 

+ (NSMutableURLRequest*) requestWithUrl:(NSURL*)url andMultipartData:(NSArray*)parts {
	

    NSString* stringBoundary = [NSString stringWithString:@"0xKhTmLbOuNdArY"];
    
    NSMutableDictionary* headers = [[NSMutableDictionary alloc] init];
    [headers setValue:@"no-cache" forKey:@"Cache-Control"];
    [headers setValue:@"no-cache" forKey:@"Pragma"];
    [headers setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", stringBoundary] forKey:@"Content-Type"];
	
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
		
	NSMutableData * postData = [SEMutableURLRequest dataWithMultiPartData:parts withBoundary:stringBoundary];

	[request setHTTPBody:postData];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	[headers setValue:postLength forKey:@"Content-Length"];
    				
	[request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:headers];
	[headers release];

	return request;
}

+ (NSMutableData *) dataWithMultiPartData:(NSArray *)arrayData withBoundary:(NSString *)stringBoundary
{
	NSMutableData * postData = [[[NSMutableData alloc] init]autorelease];

	for(SEHTTPData * data in arrayData)
	{
		[postData appendData:[[NSString stringWithFormat:@"--%@\r\n", stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[postData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"", data.name] dataUsingEncoding:NSUTF8StringEncoding]];
		
		if([data.type hasPrefix:@"image"])
		{
			[postData appendData:[[NSString stringWithFormat:@"; filename=\"%@\"\r\n", data.filename] dataUsingEncoding:NSUTF8StringEncoding]];
			[postData appendData:[[NSString stringWithFormat:@"Content-Type: %@", data.type] dataUsingEncoding:NSUTF8StringEncoding]];
		}
		
		[postData appendData:[@"\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];	
		[postData appendData:data.data];
		[postData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];	
	}	
	
	[postData appendData:[[NSString stringWithFormat:@"--%@--\r\n", stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
	
	return postData;
}



@end
