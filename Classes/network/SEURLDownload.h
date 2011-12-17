//
//  YDURLDownload.h
//
//  Created by sestevao on 08/09/22.
//  Copyright 2008 YDreams. All rights reserved.
//

#include <Foundation/NSURLRequest.h>
#include <Foundation/NSData.h>


typedef enum _NSConnectionState {
	NSConnectionStateRun = 0,
	NSConnectionStateFail = 1,
	NSConnectionStateSuccess = 2,
	NSConnectionStateIdle = 3
} NSConnectionState;

/*!
 @class SEURLDownload
 SEURLDownload downloads a request asynchronously and saves the data to a file. 
 @abstract The interface for SEURLDownload is sparse, providing methods to initialize a download, set the destination path and cancel loading the request.
 SEURLDownload’s delegate methods allow an object to receive informational callbacks about the asynchronous load of the URL request. Other delegate methods provide facilities that allow the delegate to customize the process of performing an asynchronous URL load.
 Note that these delegate methods will be called on the thread that started the asynchronous load operation for the associated NSURLDownload object.
 @updated 2003-03-15
 */
@interface SEURLDownload : NSObject {

	id delegate;
	NSData * resumeData;
	NSMutableURLRequest * request;
	NSURLConnection * connection;
	NSString * path;
	NSFileHandle * fileHandle;
	BOOL deletesFileUponFailure;	
	BOOL fileDestinationSet;
}

- (id)initWithRequest:(NSURLRequest *)aRequest delegate:(id)aDelegate;
- (id)initWithResumeData:(NSData *)resumeData delegate:(id)aDelegate path:(NSString *)path;

- (void)cancel;

/*! 
 @method setDestination:allowOverwrite:
 @abstract Sets the destination path of the downloaded file.
 @param path The path for the downloaded file.
 @param allowOverwrite YES if an existing file at path can be replaced, NO otherwise.
 @discussion If allowOverwrite is NO and a file already exists at path, a unique filename will be created for the downloaded file by appending a number to the filename. 
 The delegate can implement download:didCreateDestination: to determine the filename used when the file is written to disk. 
 */
- (void)setDestination:(NSString *)path allowOverwrite:(BOOL)allowOverwrite;

@property (nonatomic, retain) NSURLRequest* request;
@property (nonatomic, retain) NSData* resumeData;
@property (nonatomic, retain) NSString* path;
@property (nonatomic) BOOL deletesFileUponFailure;

+ (BOOL)canResumeDownloadDecodedWithEncodingMIMEType:(NSString *)MIMEType;

+ (BOOL)downloadFromURL:(NSURL *)theURL toPath:(NSString *)path;


@end

@interface NSObject (SEURLDownloadDelegate)

- (void)download:(SEURLDownload *)download decideDestinationWithSuggestedFilename:(NSString *)filename;
- (void)download:(SEURLDownload *)download didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
- (void)download:(SEURLDownload *)download didCreateDestination:(NSString *)path;
- (void)download:(SEURLDownload *)download didFailWithError:(NSError *)error;
- (void)download:(SEURLDownload *)download didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
- (void)download:(SEURLDownload *)download didReceiveDataOfLength:(NSUInteger)length;
- (void)download:(SEURLDownload *)download didReceiveResponse:(NSURLResponse *)response;
- (BOOL)download:(SEURLDownload *)download shouldDecodeSourceDataOfMIMEType:(NSString *)encodingType;
- (void)download:(SEURLDownload *)download willResumeWithResponse:(NSURLResponse *)response fromByte:(long long)startingByte;
- (NSURLRequest *)download:(SEURLDownload *)download willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse;
- (void)downloadDidBegin:(SEURLDownload *)download;
- (void)downloadDidFinish:(SEURLDownload *)download;
@end
