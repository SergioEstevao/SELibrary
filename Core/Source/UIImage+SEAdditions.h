//
//  UIImage+SEAdditions.h
//  SELibrary
//
//  Created by Sergio Estevao on 07/12/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

/** UIImage (SEAdditions) extends the UIImage class to provide custom functionality.
 
 */
@interface UIImage (SEAdditions)

extern CGSize const CGSizeUnknow;

/** Return the size of an image stored in an URL wihout decompressing the file.
 @param imageFileURL URL of image to check
 */
+ (CGSize) sizeOfImageInURL:(NSURL*)imageFileURL;

/*! Check if the 'imageFileURL' is an valid image file.
  @param imageFileURL URL of image to check
 */
+ (BOOL) isValidImage:(NSURL*)imageFileURL;


/** Save image to Url in the JPEG format.
 @param url file URL to save the image
 @param compression the quality of the resulting JPEG image, expressed as a value from 0.0 to 1.0. The value 0.0 represents the maximum compression (or lowest quality) while the value 1.0 represents the least compression (or best quality
 */
- (void) writeAsJPEGToURL:(NSURL *)url withCompression:(CGFloat) compression;

/** Save image to Url in the PNG format.
 @param url file URL to save the image
 */
- (void) writeAsPNGToURL:(NSURL *)url;
    
@end
