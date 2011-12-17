//
//  SEURLDonwload.m
//  Sérgio Estêvão
//
//  Created by sestevao on 08/09/22.
//  Copyright 2008 Sérgio Estêvão. All rights reserved.
//

#import "SEURLDownload.h"

@implementation SEURLDownload

static NSConnectionState state;

@synthesize request;
@synthesize resumeData;
@synthesize path;
@synthesize deletesFileUponFailure;

+ (BOOL)downloadFromURL:(NSURL *)theURL toPath:(NSString *)path{
	NSLog(@"Downloading from URL:%@ to path:%@", [theURL path], path);
	SEURLDownload * download =  [SEURLDownload alloc];
	[download initWithRequest:[NSURLRequest requestWithURL:theURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0] delegate:download];
	[download setDestination:path allowOverwrite:YES];
	state = NSConnectionStateRun;
	
	if (download){
		// waits for data
		state = NSConnectionStateRun;
		
		while ( state == NSConnectionStateRun) {
			[[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 1] ];
		}
	}
	else {
		// inform the user that the download could not be made
		state = NSConnectionStateFail;
	}
	if ( state == NSConnectionStateSuccess) {
		return TRUE;
	} else {
	    return FALSE;
	}	
	
}

+ (BOOL)canResumeDownloadDecodedWithEncodingMIMEType:(NSString *)MIMEType{
    return YES;
}

- (id)initWithRequest:(NSURLRequest *)aRequest delegate:(id)aDelegate{
	if (self = [super init])
	{
		self.request  = [aRequest copy];
		delegate = aDelegate;
		connection = [[NSURLConnection alloc] initWithRequest:aRequest delegate:self]; 
		self.deletesFileUponFailure = YES;
		fileDestinationSet = NO;
		[connection start];
	}
	return self;
}

- (id)initWithResumeData:(NSData *)aResumeData delegate:(id)aDelegate path:(NSString *)path
{
	if (self = [super init])
	{
        self.request = [NSKeyedUnarchiver unarchiveObjectWithData:aResumeData];
        // set the resume headers based on the file size
        //[self.request addValue:<#(NSString *)value#> forHTTPHeaderField:<#(NSString *)field#>];
		delegate = aDelegate;
		self.deletesFileUponFailure = YES;
		fileDestinationSet = NO;
	}
	return self;
}

- (void)cancel{
	[connection cancel];
}

- (void) dealloc 
{
    [connection release];
    [fileHandle release];
    [super dealloc];  
}

- (NSData*) resumeData{
    
    return [NSKeyedArchiver archivedDataWithRootObject:self.request];
}

- (void)setDestination:(NSString *)aPath allowOverwrite:(BOOL)allowOverwrite
{
	if (fileDestinationSet){
		return;
	}
	fileDestinationSet = YES;
	self.path = aPath;
	NSFileManager * defaultFileManager = [NSFileManager defaultManager];
	if (!allowOverwrite && [defaultFileManager fileExistsAtPath:self.path]){
		int i = 0;
		
		NSString * newPath;
		do {
			i++;
			newPath = [NSString stringWithFormat:@"%@-%i.%@",[self.path stringByDeletingPathExtension],i,[self.path pathExtension]];  
		} while ([defaultFileManager fileExistsAtPath:newPath]);
		self.path = newPath;
	} 
		    	
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	
    [delegate download:self didReceiveResponse:response];
	if ( !fileDestinationSet ){
	  [delegate download:self decideDestinationWithSuggestedFilename:[response suggestedFilename]];
	}

	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	
    [delegate download:self didReceiveDataOfLength:[data length]];
    if (fileHandle == nil){
        NSFileManager * defaultFileManager = [NSFileManager defaultManager];
        [defaultFileManager createDirectoryAtPath:[self.path stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
        if ([defaultFileManager createFileAtPath:self.path contents: nil attributes: nil]) {
            fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:self.path];
            [fileHandle retain]; 
            [fileHandle seekToFileOffset:0];
            [delegate download:self didCreateDestination:self.path];            
        } else {
            [delegate download:self didFailWithError:nil];
        }
        
    }
	// append the new data to the file	
	[fileHandle writeData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection

{	
    // do something with the data
	
    //NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
	
	[delegate downloadDidFinish:self];
	
    // release the connection, and the data object
	[fileHandle closeFile];
    [aConnection release];
}

- (void)connection:(NSURLConnection *)aConnection didFailWithError:(NSError *)error
{
	
	// release the file
	[fileHandle closeFile];
	if (self.deletesFileUponFailure){
		NSFileManager * defaultFileManager = [NSFileManager defaultManager];
		[defaultFileManager removeItemAtPath:path error:nil];
	}
	// release connection
    [aConnection release];
	// inform the user
	
	[delegate download:self didFailWithError:error];
    NSLog(@"Connection failed! Error - %@ %@",
		  
          [error localizedDescription],
		  
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	
	
	
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
	return nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	[delegate download:self didReceiveAuthenticationChallenge:challenge];
}



- (void)download:(SEURLDownload *)download decideDestinationWithSuggestedFilename:(NSString *)filename{
	
}
- (void)download:(SEURLDownload *)download didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
	
}
- (void)download:(SEURLDownload *)download didCreateDestination:(NSString *)path{
	
}

- (void)download:(SEURLDownload *)download didFailWithError:(NSError *)error{
	state = NSConnectionStateFail;
}

- (void)download:(SEURLDownload *)download didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
	
}

- (void)download:(SEURLDownload *)download didReceiveDataOfLength:(NSUInteger)length{
	
}

- (void)download:(SEURLDownload *)download didReceiveResponse:(NSURLResponse *)response{
	
}

- (BOOL)download:(SEURLDownload *)download shouldDecodeSourceDataOfMIMEType:(NSString *)encodingType{
	return false;
}

- (void)download:(SEURLDownload *)download willResumeWithResponse:(NSURLResponse *)response fromByte:(long long)startingByte{
	
}

- (NSURLRequest *)download:(SEURLDownload *)download willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse{
	return self.request;
}
- (void)downloadDidBegin:(SEURLDownload *)download{
	
}

- (void)downloadDidFinish:(SEURLDownload *)download{
	state = NSConnectionStateSuccess;
}



@end
