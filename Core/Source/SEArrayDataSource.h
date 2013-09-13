//
//  SEArrayDataSource.h
//  SELibrary
//
//  Created by Sérgio Estêvão on 13/09/2013.
//
//

#import <Foundation/Foundation.h>

typedef void(^ConfigureCellBlock)(UITableViewCell * cell, id item);

/** SEArrayDataSource implements the UITableViewDataSource using a NSArray as the source of data.
 
 */
@interface SEArrayDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray * sections;
@property (nonatomic, strong) NSArray * items;
@property (nonatomic, copy) NSString * cellIdentifier;
@property (nonatomic, strong) ConfigureCellBlock configureCellBlock;

- (id) initWithItems:(NSArray *)items cellIdentifier:(NSString *) cellIdentifier
                    configureCellBlock:(ConfigureCellBlock) configureCellBlock;

- (id) initWithSections:(NSArray *)sections items:(NSArray *)items cellIdentifier:(NSString *) cellIdentifier
    configureCellBlock:(ConfigureCellBlock) configureCellBlock;

@end
