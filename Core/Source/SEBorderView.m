//
//  SEBorderView.m
//  SELibrary
//
//  Created by Sergio Estevao on 08/01/2013.
//
//

#import "SEBorderView.h"

@implementation SEBorderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _borderWidth = 1.0;
        _borderLayout = SEBorderLayoutAll;
        _borderColor = [UIColor blackColor];
    }
    return self;
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

-(void)setBorderLayout:(SEBorderLayout)borderLayout
{
    _borderLayout = borderLayout;
    [self setNeedsDisplay];
}

-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [_borderColor CGColor]);
    CGContextSetLineWidth(ctx, _borderWidth);
    
    CGFloat halfWidth = _borderWidth / 2.0;
    CGRect insetBounds = CGRectZero;
    insetBounds.origin.x = halfWidth;
    insetBounds.origin.y = halfWidth;
    insetBounds.size.width = self.bounds.size.width - halfWidth;
    insetBounds.size.height = self.bounds.size.height - halfWidth;
    
    if(self.borderLayout & SEBorderLayoutTop) {
        CGContextMoveToPoint(ctx, 0, insetBounds.origin.y);
        CGContextAddLineToPoint(ctx, self.bounds.size.width, insetBounds.origin.y);
    }
    
    if(self.borderLayout & SEBorderLayoutRight) {
        CGContextMoveToPoint(ctx, insetBounds.size.width, 0);
        CGContextAddLineToPoint(ctx, insetBounds.size.width, self.bounds.size.height);
    }
    
    if(self.borderLayout & SEBorderLayoutBottom) {
        CGContextMoveToPoint(ctx, self.bounds.size.width, insetBounds.size.height);
        CGContextAddLineToPoint(ctx, 0, insetBounds.size.height);
    }
    
    if(self.borderLayout & SEBorderLayoutLeft) {
        CGContextMoveToPoint(ctx, insetBounds.origin.x, self.bounds.size.height);
        CGContextAddLineToPoint(ctx, insetBounds.origin.x, 0);
    }
    
    CGContextSaveGState(ctx);
    CGContextSetAllowsAntialiasing(ctx, false);
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
}

@end
