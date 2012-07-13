//
//  YDURLDownload.h
//
//  Created by sestevao on 08/09/22.
//  Copyright 2008 OnMotion. All rights reserved.
//

#include <Foundation/NSURLRequest.h>
#include <Foundation/NSData.h>


typedef enum _NSConnectionState {
	NSConnectionStateRun = 0,
	NSConnectionStateFail = 1,
	NSConnectionStateSuccess = 2,
	NSConnectionStateIdle = 3
} NSConnectionState;

/** SEURLDownload downloads a request asynchronously and saves the data to a file. 
 
 The interface for SEURLDownload is sparse, providing methods to initialize a download, set the destination path and cancel loading the request.
 
 SEURLDownload’s delegate methods —defined by the SEURLDownloadDelegate— allow an object to receive informational callbacks about the asynchronous load of the URL request. Other delegate methods provide facilities that allow the delegate to customize the process of performing an asynchronous URL load.
 
 Note that these delegate methods will be called on the thread that started the asynchronous load operation for the associated NSURLDownload object.

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

///---------------------------------------------------------------------------------------
/// @name Creating a Download Instance
///---------------------------------------------------------------------------------------

/**  Returns an initialized URL download for a URL request and begins to download the data for the request.
 @param aRequest The URL request to download. The request object is deep-copied as part of the initialization process. Changes made to request after this method returns do not affect the request that is used for the loading process.
 @param aDelegate The delegate for the download. This object will receive delegate messages as the download progresses. Delegate messages will be sent on the thread which calls this method. For the download to work correctly the calling thread’s run loop must be operating in the default run loop mode.
 @return An initialized NSURLDownload object for request.
 */
- (id)initWithRequest:(NSURLRequest *)aRequest delegate:(id)aDelegate;

///---------------------------------------------------------------------------------------
/// @name Resuming Partial Downloads
///---------------------------------------------------------------------------------------

/** Returns an initialized NSURLDownload object that will resume downloading the specified data to the specified file and begins the download.

 @param resumeData Specifies the data to resume downloading.
 @param aDelegate The delegate for the download. This object will receive delegate messages as the download progresses. Delegate messages will be sent on the thread which calls this method. For the download to work correctly the calling thread’s run loop must be operating in the default run loop mode.
 @param path The location for the downloaded data.
 @return An initialized NSURLDownload object for request.
*/
- (id)initWithResumeData:(NSData *)resumeData delegate:(id)aDelegate path:(NSString *)path;

/** 
 */
+ (BOOL)canResumeDownloadDecodedWithEncodingMIMEType:(NSString *)MIMEType;
/**
 */
@property (nonatomic, retain) NSData* resumeData;
///---------------------------------------------------------------------------------------
/// @name Cancelling a Download
///---------------------------------------------------------------------------------------

/** Cancels the receiver’s download and deletes the downloaded file.
 */
- (void)cancel;

/** Sets the destination path of the downloaded file.
 
 @param path The path for the downloaded file.
 @param allowOverwrite YES if an existing file at path can be replaced, NO otherwise.
 @discussion If allowOverwrite is NO and a file already exists at path, a unique filename will be created for the downloaded file by appending a number to the filename. 
 The delegate can implement download:didCreateDestination: to determine the filename used when the file is written to disk. 
 */
- (void)setDestination:(NSString *)path allowOverwrite:(BOOL)allowOverwrite;

@property (nonatomic, retain) NSURLRequest* request;

@property (nonatomic, retain) NSString* path;
@property (nonatomic) BOOL deletesFileUponFailure;

/** 
 */
+ (BOOL)downloadFromURL:(NSURL *)theURL toPath:(NSString *)path;


@end

/** The NSURLDownloadDelegate protocol defines methods that allow an object to receive informational callbacks about the asynchronous load of a download’s URL request. Other delegate methods provide facilities that allow the delegate to customize the process of performing an asynchronous URL load.
 
 Note that these delegate methods will be called on the thread that started the asynchronous load operation for the associated NSURLDownload object.
 
 - A downloadDidBegin: message will be sent to the delegate immediately upon starting the download.
 - Zero or more download:willSendRequest:redirectResponse: messages will be sent to the delegate before any further messages are sent if it is determined that the download must redirect to a new location. The delegate can allow the redirect, modify the destination or deny the redirect.
 - Zero or more download:didReceiveAuthenticationChallenge: messages will be sent to the delegate if it is necessary to authenticate in order to download the request and NSURLDownload does not already have authenticated credentials.
 - Zero or more download:didCancelAuthenticationChallenge: messages will be sent to the delegate if NSURLDownload cancels the authentication challenge due to encountering a protocol implementation error.
 - Zero or more download:didReceiveResponse: messages will be sent to the delegate before receiving a download:didReceiveDataOfLength: message. The only case where download:didReceiveResponse: is not sent to a delegate is when the protocol implementation encounters an error before a response could be created.
 - Zero or more download:didReceiveDataOfLength: messages will be sent before downloadDidFinish: or download:didFailWithError: is sent to the delegate.
 - Zero or one download:decideDestinationWithSuggestedFilename: will be sent to the delegate when sufficient information has been received to determine the suggested filename for the downloaded file. The delegate will not receive this message if setDestination:allowOverwrite: has already been sent to the NSURLDownload instance.
 - A download:didCreateDestination: message will be sent to the delegate when the NSURLDownload instance creates the file on disk.
 - If NSURLDownload determines that the downloaded file is in a format that it is able to decode (MacBinary, Binhex or gzip), the delegate will receive a download:shouldDecodeSourceDataOfMIMEType:. The delegate should return YES to decode the data, NO otherwise.
 - Unless an NSURLDownload instance receives a cancel message, the delegate will receive one and only one downloadDidFinish: or download:didFailWithError: message, but never both. In addition, once either of messages are sent, the delegate will receive no further messages for the given NSURLDownload.
 
 */
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
