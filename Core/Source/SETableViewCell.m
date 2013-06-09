//
//  SETableViewCell.m
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

#import "SETableViewCell.h"
#import "SELogging.h"
#import <objc/runtime.h>

#define kCellNib @"com.sergioestevao.cellNibKey"
#define kCellTemplate @"com.sergioestevao.cellTemplateKey"

@implementation SETableViewCell

+ (UITableViewCell*)loadCell:(UINib *)aNib {
    NSArray *nibObjects = [aNib instantiateWithOwner:nil options:nil];
    if(!(/*nibObjects.count == 1 && */[nibObjects[0] isKindOfClass:[self class]])){
        ALog(@"Nib should contain one top level cell view object.");
        return nil;
    }
    return nibObjects[0];
}

+ (void)ensureTemplate {
    if (!objc_getAssociatedObject(self, kCellTemplate)) {
        // if the template is not loaded, associated with this class
        UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:[NSBundle mainBundle]];
        UITableViewCell *cellTemplate = [self loadCell:nib];
        objc_setAssociatedObject(self, kCellNib, nib, OBJC_ASSOCIATION_RETAIN);
        objc_setAssociatedObject(self, kCellTemplate, cellTemplate, OBJC_ASSOCIATION_RETAIN);
    };
}

+ (id)cell {
    [self ensureTemplate];
    UINib *nib = objc_getAssociatedObject(self, kCellNib);
    id cell = [self loadCell:nib];
    return cell;
    
}

+ (NSString*)reuseIdentifier {
    [self ensureTemplate];
    UITableViewCell * templateCell = objc_getAssociatedObject(self, kCellTemplate);
    return templateCell.reuseIdentifier;
}

+ (CGFloat) height {
    [self ensureTemplate];
    UITableViewCell * templateCell = objc_getAssociatedObject(self, kCellTemplate);
    return templateCell.contentView.frame.size.height;
}

+ (CGFloat) width {
    [self ensureTemplate];
    UITableViewCell * templateCell = objc_getAssociatedObject(self, kCellTemplate);
    return templateCell.contentView.frame.size.width;
}


@end
