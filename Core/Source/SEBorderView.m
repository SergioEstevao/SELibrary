//
//  SEBorderView.m
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

#import "SEBorderView.h"

@implementation SEBorderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _borderWidth = 1.0;
        _borderLayout = SEBorderLayoutAll;
        _borderColor = [UIColor blackColor];
        self.contentMode = UIViewContentModeRedraw;
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
