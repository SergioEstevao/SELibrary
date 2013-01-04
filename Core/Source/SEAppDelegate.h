//
//  SEAppDelegate.h
//  SELibrary
//
//  Created by Sergio Estevao on 07/09/2012.
//  Copyright (c) 2012 Sergio Estevao. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Implementation of the AppDelegate that uses a service approach to connect to the different application components.
 */
@interface SEAppDelegate : UIResponder <UIApplicationDelegate>

/** The list of services that react to the UIApplicationDelegate. Elements of this list must implement UIApplicationDelegate protocol.
 */
- (NSArray *) services;

@end
