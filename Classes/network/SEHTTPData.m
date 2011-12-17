//
//  

//  Sérgio Estêvão
//
//  Created by Cristina Lopes on 9/16/09.
//  Copyright 2009 YDreams. All rights reserved.
//

#import "SEHTTPData.h"


@implementation SEHTTPData

@synthesize filename, name, type, data;

- (id)initWithName:(NSString *)name_ andData:(NSData *)data_
{
	return [self initWithName:name_ andData:data_ andType:@"string" andFilename:nil];
}

- (id)initWithName:(NSString *)name_ andData:(NSData *)data_ andType:(NSString *)type_
{
	return [self initWithName:name_ andData:data_ andType:type_ andFilename:nil];
}

- (id)initWithName:(NSString *)name_ andData:(NSData *)data_ andType:(NSString *)type_ andFilename:(NSString *)filename_
{
	if(self = [super init])
	{
		self.filename = filename_;
		self.name = name_;
		self.data = data_;
		self.type = type_;
	}
	return self;
}


- (void)dealloc {
	[filename release];
	[name release];
	[type release];
	[data release];
	[super dealloc];
}


@end
