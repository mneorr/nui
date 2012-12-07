//
//  NUITabBar.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITabBar.h"

@implementation NUITabBar

@synthesize nuiClass = _nuiClass;

- (void)initNUI
{
    self.nuiClass = @"TabBar";
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initNUI];
    [self awakeFromNibNUI];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self initNUI];
    [self drawRectNUI:rect];
}

- (void)awakeFromNibNUI
{
    [NUIRenderer renderTabBar:self withClass:_nuiClass];
}

- (void)drawRectNUI:(CGRect)rect
{   
    [self initNUI];
    
    if ([STYLESHEET hasProperty:@"background-color-top" withClass:_nuiClass]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[STYLESHEET getColor:@"background-color-top" withClass:_nuiClass]
                                     withBottom:[STYLESHEET getColor:@"background-color-bottom" withClass:_nuiClass]
                                     withFrame:self.frame];
        [gradient renderInContext:UIGraphicsGetCurrentContext()];
    } else if ([STYLESHEET hasProperty:@"background-color" withClass:_nuiClass]) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColor(context, CGColorGetComponents([[STYLESHEET getColor:@"background-color" withClass:_nuiClass] CGColor]));
        CGContextFillRect(context, rect);
    }
}

@end
