//
//  UIColor+ALJMisc.h
//  SELibrary
//
//  Created by Sergio Estevao on 08/12/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

/** UIColor (SEAdditions) extends the UIColor class to provide custom functionality.
 
 */
@interface UIColor (SEAdditions)

/** Returns a color wich is configures with the rgbValue
 @param rgbValue An integer wich represents a color // e.g. 0xffee33
 */
+ (UIColor*)colorWithRGB:(NSInteger)rgbValue;

/** Returns a color wich is configures with the red green blu Values
 @param red An integer wich represents the red component of a color in the range of 0 to 255
 @param green An integer wich represents the red component of a color in the range of 0 to 255
 @param blue An integer wich represents the red component of a color in the range of 0 to 255
 */
+ (UIColor*)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

@end