//
//  UIImage+SEAdditions.m
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

#import "UIImage+SEAdditions.h"

@implementation UIImage (SEAdditions)


- (void) writeAsJPEGToURL:(NSURL *)url withCompression:(CGFloat) compression{
    [UIImageJPEGRepresentation(self, compression) writeToURL:url atomically:YES];
}

- (void) writeAsPNGToURL:(NSURL *)url {
    [UIImagePNGRepresentation(self) writeToURL:url atomically:YES];
}

/*!
 Check if the 'imageFileURL' is an valid image file.
 */
+ (BOOL) isValidImage:(NSURL*)imageFileURL {
    if ( imageFileURL == nil){
        return NO;
    }
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)imageFileURL, NULL);

    if (imageSource == NULL) {
        return NO;
    }
    
    NSDictionary * dicOptions = @{(NSString *)kCGImageSourceShouldCache:(NSNumber *)kCFBooleanFalse};
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, (__bridge CFDictionaryRef)dicOptions);
    
    if (imageProperties == NULL) {
        CFRelease(imageSource);
        return NO;
    }

    CFRelease(imageProperties);
    CFRelease(imageSource);
    return YES;
}

CGSize const CGSizeUnknow = {-1.0f, -1.0f};

/*! 
 Return the size of an image reading from `imageFileURL'. 
 */
+ (CGSize) sizeOfImageInURL:(NSURL*)imageFileURL {
    if (imageFileURL == nil){
        return CGSizeUnknow;
    }
    
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)imageFileURL, NULL);

    if (imageSource == NULL) {
        // Error loading image
        return CGSizeUnknow;
    }

    CGFloat width = 0.0f, height = 0.0f;
    NSDictionary * dicOptions = @{(NSString *)kCGImageSourceShouldCache:(NSNumber *)kCFBooleanFalse};
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, (__bridge CFDictionaryRef)dicOptions);

    if (imageProperties == NULL) {
        CFRelease(imageSource);
        return CGSizeUnknow;
    }
    CFNumberRef widthNum  = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
    if (widthNum != NULL) {
        CFNumberGetValue(widthNum, kCFNumberFloatType, &width);
    }

    CFNumberRef heightNum = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
    if (heightNum != NULL) {
        CFNumberGetValue(heightNum, kCFNumberFloatType, &height);
    }

    CFRelease(imageProperties);
    CFRelease(imageSource);

    return CGSizeMake(width, height);

}

@end