//
//  SEBorderView.h
//  SELibrary
//
//  Created by Sergio Estevao on 08/01/2013.
//
//

#import <UIKit/UIKit.h>

/** SEBorderLayout defines the available border positionings
 */
typedef NS_ENUM(NSInteger, SEBorderLayout) {
    SEBorderLayoutNone = 0,
    SEBorderLayoutTop = 1 << 0,
    SEBorderLayoutLeft = 1 << 1,
    SEBorderLayoutBottom = 1 << 2,
    SEBorderLayoutRight = 1 << 3,
    SEBorderLayoutAll = SEBorderLayoutTop | SEBorderLayoutLeft | SEBorderLayoutBottom | SEBorderLayoutRight
};

/**
 SEBorderView provides the ability to control the drawing of a border around a view.
 It's possible to change the border's positioning, width and color.
 */
@interface SEBorderView : UIView

/** Set the border style. */
@property (nonatomic, assign) SEBorderLayout borderLayout;

/** Set the border width. */
@property (nonatomic, assign) CGFloat borderWidth;

/** Set the border color. */
@property (nonatomic, strong) UIColor *borderColor;

@end
