//
//  SEArrayDataSource.m
//  SELibrary
//
//  Created by Sérgio Estêvão on 13/09/2013.
//
//

#import "SEArrayDataSource.h"
#import "SELogging.h"

@implementation SEArrayDataSource

- (id) init {
    return [self initWithItems:@[] cellIdentifier:@"" configureCellBlock:^(UITableViewCell *cell, id item) {
        cell.textLabel.text = [item description];
    }];
}

- (id) initWithItems:(NSArray *)items cellIdentifier:(NSString *) cellIdentifier
  configureCellBlock:(ConfigureCellBlock) configureCellBlock {
    self = [self initWithSections:@[[NSNull null]] items:@[items] cellIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
    
    return self;
}

- (id) initWithSections:(NSArray *)sections items:(NSArray *)items cellIdentifier:(NSString *) cellIdentifier
  configureCellBlock:(ConfigureCellBlock) configureCellBlock {
    self = [super init];
    if (self == nil) return nil;
    ZAssert(sections.count == items.count, @"Number of sections must match number of items arrays");
    _sections = sections;
    _items = items;
    self.cellIdentifier = cellIdentifier;
    self.configureCellBlock = [configureCellBlock copy];
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath*)indexPath {
    return self.items[indexPath.section][(NSUInteger)indexPath.row];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.items[section] count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                              forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell,item);
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (_sections[section] == [NSNull null]) return nil;
    return [_sections[section] description];
}

@end
