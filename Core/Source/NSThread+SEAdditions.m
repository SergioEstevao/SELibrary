//
//  NSThread+SEAdditions.m
//  SELibrary
//
//  Created by Sergio Estevao on 05/09/2012.
//  Copyright (c) 2012 Sergio Estevao. All rights reserved.
//

#import "NSThread+SEAdditions.h"

@implementation NSThread (SEAdditions)

+ (void)performBlockOnMainThread:(void (^)())block{
	[[NSThread mainThread] performBlock:block];
}

+ (void)performBlockInBackground:(void (^)())block{
	[NSThread performSelectorInBackground:@selector(runBlock:)
                               withObject:[block copy]];
}

+ (void)runBlock:(void (^)())block{
	block();
}


- (void)performBlock:(void (^)())block{
    
	if ([[NSThread currentThread] isEqual:self])
        block();
	else
        [self performBlock:block waitUntilDone:NO];
}

- (void)performBlock:(void (^)())block waitUntilDone:(BOOL)wait{
    
	[NSThread performSelector:@selector(runBlock:)
					 onThread:self
				   withObject:[block copy]
				waitUntilDone:wait];
}

- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay{
    
	[self performSelector:@selector(performBlock:)
			   withObject:[block copy]
               afterDelay:delay];
}

@end
