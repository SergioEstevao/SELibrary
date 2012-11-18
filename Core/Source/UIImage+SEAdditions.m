//
//  UIImage+ALJMisc.m
//  SELibrary
//
//  Created by Sergio Estevao on 07/12/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

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

    if (imageSource != NULL) {
        CFRelease(imageSource);
        return YES;
    }

    return NO; 
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

+ (BOOL) hasImageValidSize:(NSURL*)imageFileURL{
    CGSize size = [UIImage sizeOfImageInURL:imageFileURL];
    
    if ( size.width >= 1024 && size.height >= 1024){
        return NO;
    }

    return YES;
}

@end