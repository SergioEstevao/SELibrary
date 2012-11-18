//
//  UIColor+ALJMisc.m
//  Sergio Estevao
//
//  Created by Sergio Estevao on 08/12/2011.
//  Copyright 2011 Sergio Estevao. All rights reserved.
//

#import "UIColor+SEAdditions.h"

@implementation UIColor (SEAdditions)

+ (UIColor*)colorWithRGB:(NSInteger)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0f
                            blue:((float)(rgbValue & 0xFF))/255.0f
                           alpha:1.0];
}

+ (UIColor*)colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue{
    return [UIColor colorWithRed:(float)red/255.0f
                           green:(float)green/255.0f
                            blue:(float)blue/255.0f
                           alpha:1.0];

}

@end
