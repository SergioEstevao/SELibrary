//
//  SETableViewCell.h
//  SELibrary
//
//  Created by Sergio Estevao on 08/01/2013.
//
//

#import <UIKit/UIKit.h>

/** SETableViewCell implements common creation and configuration code for UITableViewCell.
 
 */
@interface SETableViewCell : UITableViewCell

/** Returns a new cell from the associated nib that has the same name as the class name.
 */
+ (id)cell;

/** Returns the width of cell. Assuming this values doesn't change since the loading of the cell from the nib
 */
+ (CGFloat)width;

/** Returns the height of cell. Assuming this values doesn't change since the loading of the cell from the nib
 */
+ (CGFloat)height;

/** Returns the reuseIdentifier that is specified in the nib file.
 */
+ (NSString*)reuseIdentifier;

@end
