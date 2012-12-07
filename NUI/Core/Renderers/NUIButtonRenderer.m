//
//  NUIButtonRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIButtonRenderer.h"

@implementation NUIButtonRenderer

+ (void)render:(UIButton*)button withClass:(NSString*)class_name
{
    // Set height
    if ([STYLESHEET hasProperty:@"height" withClass:class_name]) {
        CGRect frame = button.frame;
        CGSize originalSize = frame.size;
        frame.size = CGSizeMake(originalSize.width, [STYLESHEET getFloat:@"height" withClass:class_name]);
        button.frame = frame;
    }
    
    // Set background color
    if ([STYLESHEET hasProperty:@"background-color" withClass:class_name]) {
        [button setBackgroundColor:[STYLESHEET getColor:@"background-color" withClass:class_name]];
    }
    
    // Set background gradient
    if ([STYLESHEET hasProperty:@"background-color-top" withClass:class_name]) {
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[STYLESHEET getColor:@"background-color-top" withClass:class_name]
                                     withBottom:[STYLESHEET getColor:@"background-color-bottom" withClass:class_name]
                                     withFrame:button.bounds];
        [button.layer insertSublayer:gradient atIndex:0];
    }
    
    // Set background image
    if ([STYLESHEET hasProperty:@"background-image" withClass:class_name]) {
        [button setBackgroundImage:[STYLESHEET getImage:@"background-image" withClass:class_name] forState:UIControlStateNormal];
    }
    if ([STYLESHEET hasProperty:@"background-image-highlighted" withClass:class_name]) {
        [button setBackgroundImage:[STYLESHEET getImage:@"background-image-highlighted" withClass:class_name] forState:UIControlStateHighlighted];
    }
    
    [NUIRenderer renderLabel:button.titleLabel withClass:class_name];
    
    // Set font color
    if ([STYLESHEET hasProperty:@"font-color" withClass:class_name]) {
        [button setTitleColor:[STYLESHEET getColor:@"font-color" withClass:class_name] forState:UIControlStateNormal];
    }
    if ([STYLESHEET hasProperty:@"font-color-highlighted" withClass:class_name]) {
        [button setTitleColor:[STYLESHEET getColor:@"font-color-highlighted" withClass:class_name] forState:UIControlStateHighlighted];
    }
    
    CALayer *layer = [button layer];
    
    // Set corners
    if ([STYLESHEET hasProperty:@"corner-radius" withClass:class_name]) {
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:[STYLESHEET getFloat:@"corner-radius" withClass:class_name]];
    }
    
    // Set border color
    if ([STYLESHEET hasProperty:@"border-color" withClass:class_name]) {
        [layer setBorderColor:[[STYLESHEET getColor:@"border-color" withClass:class_name] CGColor]];
    }
    
    // Set border width
    if ([STYLESHEET hasProperty:@"border-width" withClass:class_name]) {
        [layer setBorderWidth:[STYLESHEET getFloat:@"border-width" withClass:class_name]];
    }
}

@end
