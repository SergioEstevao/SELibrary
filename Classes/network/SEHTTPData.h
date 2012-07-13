//
//  SEHTTPData.h
//  Sérgio Estêvão
//
//  Created by Sérgio Estêvão on 9/16/09.
//  Copyright 2009 Sérgio Estêvão. All rights reserved.
//

#import <Foundation/Foundation.h>

/** An helper class to represent HTTP parameters in POST or GET requests.
*/
@interface SEHTTPData : NSObject {
	NSString * filename;
	NSString * name;
	NSString * type;
	NSData * data;
    
}

@property (retain, nonatomic) NSString * filename;
@property (retain, nonatomic) NSString * name;
@property (retain, nonatomic) NSString * type;
@property (retain, nonatomic) NSData * data;

- (id)initWithName:(NSString *)name_ andData:(NSData *)data_;
- (id)initWithName:(NSString *)name_ andData:(NSData *)data_ andType:(NSString *)type_;
- (id)initWithName:(NSString *)name_ andData:(NSData *)data_ andType:(NSString *)type_ andFilename:(NSString *)filename_;


@end
