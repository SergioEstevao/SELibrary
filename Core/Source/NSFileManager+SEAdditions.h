//
//  NSFileManager+SEAdditions.h
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

#import <Foundation/Foundation.h>

/** NSFileManager (SEAdditions) extends the NSFileManager class to provide custom functionality.
    Read this link for more info: http://developer.apple.com/library/mac/#documentation/FileManagement/Conceptual/FileSystemProgrammingGUide/FileSystemOverview/FileSystemOverview.html
 */
@interface NSFileManager (SEAdditions)

/** Returns the application documents directory.
 Use this directory to store critical user documents and app data files. Critical data is any data that cannot be recreated by your app, such as user-generated content.
 The contents of this directory can be made available to the user through file sharing. The contents of this directory are backed up by iTunes. */
+ (NSURL *) applicationDocumentsDirectory;

/** Returns the application temporary directory.
 Use this directory to write temporary files that do not need to persist between launches of your app. Your app should remove files from this directory when it determines they are no longer needed. (The system may also purge lingering files from this directory when your app is not running.)
 In iOS 2.1 and later, the contents of this directory are not backed up by iTunes.
 */
+ (NSURL *) applicationTemporaryDirectory;

/** Returns the application caches directory.
 Use this directory to write any app-specific support files that your app can re-create easily. Your app is generally responsible for managing the contents of this directory and for adding and deleting files as needed.
 In iOS 2.2 and later, the contents of this directory are not backed up by iTunes. In addition, iTunes removes files in this directory during a full restoration of the device.
 On iOS 5.0 and later, the system may delete the Caches directory on rare occasions when the system is very low on disk space. This will never occur while an app is running. However, you should be aware that iTunes restore is not necessarily the only condition under which the Caches directory can be erased. */
+ (NSURL *) applicationCacheDirectory;

/** Returns the application support directory.
 Use this directory to store all app data files except those associated with the user’s documents. For example, you might use this directory to store app-created data files, configuration files, templates, or other fixed or modifiable resources that are managed by the app. An app might use this directory to store a modifiable copy of resources contained initially in the app’s bundle. A game might use this directory to store new levels purchased by the user and downloaded from a server.
 All content in this directory should be placed in a custom subdirectory whose name is that of your app’s bundle identifier or your company.
 In iOS, the contents of this directory are backed up by iTunes.
 */
+ (NSURL *) applicationSupportDirectory;

/** Adds a attribute to file or folder for it to be skipped on the iTunes or iCloud backups
 @param URL the file or folder path
 @return return true is attribute was applied.
 */
- (BOOL) addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

@end
