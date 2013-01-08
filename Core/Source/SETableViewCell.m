//
//  SETableViewCell.m
//  SELibrary
//
//  Created by Sergio Estevao on 08/01/2013.
//
//

#import "SETableViewCell.h"
#import "SELogging.h"
#import <objc/runtime.h>

#define kCellNib @"TSDCellNibKey"
#define kCellTemplate @"TSDCellTemplateKey"

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
