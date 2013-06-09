//
//  NSThread+SEAdditions.h
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
