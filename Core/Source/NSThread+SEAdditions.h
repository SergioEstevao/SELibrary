//
//  NSThread+SEAdditions.h
//  SELibrary
//
//  Created by Sergio Estevao on 05/09/2012.
//  Copyright (c) 2012 Sergio Estevao. All rights reserved.
//

/** NSThread (SEAdditions) extends the NSThread class to provide block execution funcionality.
 
 */
@interface NSThread (SEAdditions)

/** Performs the block in the main thread
 @param block the block to execute
 */
+ (void)performBlockOnMainThread:(void (^)())block;

/** Performs the block in the background queue thread
 @param block the block to execute
 */
+ (void)performBlockInBackground:(void (^)())block;

/** Performs the block in the instance Thread
 @param block the block to execute
 */
- (void)performBlock:(void (^)())block;

/** Performs the block in the Thread and waits for the execution
 @param block the block to execute
 @param wait A Boolean that specifies whether the current thread blocks until after the specified block is performed on the receiver on the specified thread. Specify YES to block this thread; otherwise, specify NO to have this method return immediately.
 */
- (void)performBlock:(void (^)())block waitUntilDone:(BOOL)wait;

/** Performs the block in the Thread after the delay specified
 @param block the block to execute
 @param delay the amount of time to wait before executing the block
 */
- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay;

@end
