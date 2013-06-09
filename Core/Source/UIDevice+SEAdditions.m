//
//  UIDevice+SEAdditions.m
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

#import "UIDevice+SEAdditions.h"

@implementation UIDevice (SEAdditions)

/** Returns YES if the device the application is running is an iPad"
 
 */
+ (BOOL) isPad {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

/** Returns YES if the device the application is running is an iPhone"
 
 */
+ (BOOL) isPhone {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

NSString* NSStringFromUIDeviceBatteryState(UIDeviceBatteryState batteryState)
{
    NSString *batteryString;
    switch (batteryState)
    {
        case UIDeviceBatteryStateCharging:
            batteryString =  @"UIDeviceBatteryStateCharging";
            break;
        case UIDeviceBatteryStateFull:
            batteryString =  @"UIDeviceBatteryStateFull";
            break;
        case UIDeviceBatteryStateUnplugged:
            batteryString =  @"UIDeviceBatteryStateUnplugged";
            break;
        case UIDeviceBatteryStateUnknown:
            batteryString =  @"UIDeviceBatteryStateUnknown";
            break;
        default:
            batteryString = nil;
            break;
    }
    return batteryString;
}

NSString* NSStringFromUIDeviceOrientation(UIDeviceOrientation orientation)
{
    NSString *orientationString;
    switch (orientation)
    {
        case UIDeviceOrientationPortrait:
            orientationString =  @"UIDeviceOrientationPortrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            orientationString =  @"UIDeviceOrientationPortraitUpsideDown";
            break;
        case UIDeviceOrientationLandscapeLeft:
            orientationString =  @"UIDeviceOrientationLandscapeLeft";
            break;
        case UIDeviceOrientationLandscapeRight:
            orientationString =  @"UIDeviceOrientationLandscapeRight";
            break;
        case UIDeviceOrientationFaceUp:
            orientationString =  @"UIDeviceOrientationFaceUp";
            break;
        case UIDeviceOrientationFaceDown:
            orientationString =  @"UIDeviceOrientationFaceDown";
            break;
        case UIDeviceOrientationUnknown:
            orientationString = @"UIDeviceOrientationUnknown";
            break;
        default:
            orientationString = nil;
            break;
    }
    return orientationString;
}

@end
