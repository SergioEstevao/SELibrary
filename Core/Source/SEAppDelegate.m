//
//  RDSAppDelegate.m
//  ShellIRM
//
//  Created by Sergio Estevao on 07/09/2012.
//  Copyright (c) 2012 Sergio Estevao. All rights reserved.
//

#import "SEAppDelegate.h"

@interface SEAppDelegate ()

@end

@implementation SEAppDelegate

- (NSArray *) services {
    return nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        [service application:application didFinishLaunchingWithOptions:launchOptions];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationDidEnterBackground:)]){
            [service applicationWillResignActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationDidEnterBackground:)]){
            [service applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationWillEnterForeground:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationDidBecomeActive:)]){
            [service applicationDidBecomeActive:application];
        }
    }

}

- (void)applicationWillTerminate:(UIApplication *)application
{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(applicationWillTerminate:)]){
            [service applicationWillTerminate:application];
        }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    id<UIApplicationDelegate> service;
    BOOL result = NO;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]){
            result |= [service application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    id<UIApplicationDelegate> service;
    BOOL result = NO;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:handleOpenURL:)]){
            result |= [service application:application handleOpenURL:url];
        }
    }
    return result;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]){
            [service application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }

}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    id<UIApplicationDelegate> service;
    for(service in self.services){
        if ([service respondsToSelector:@selector(application:didReceiveRemoteNotification:)]){
            [service application:application didReceiveRemoteNotification:userInfo];
        }
    }

}

@end