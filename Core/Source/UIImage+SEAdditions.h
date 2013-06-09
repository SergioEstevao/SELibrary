//
//  UIImage+SEAdditions.h
//
// Copyright (c) 2013 Sergio Estevao (http://sergioestevao.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
