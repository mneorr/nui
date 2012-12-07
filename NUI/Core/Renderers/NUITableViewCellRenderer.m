//
//  NUITableViewCellRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITableViewCellRenderer.h"

@implementation NUITableViewCellRenderer

+ (void)render:(UITableViewCell*)cell withClass:(NSString*)class_name
{
    // Set background color
    if ([STYLESHEET hasProperty:@"background-color" withClass:class_name]) {
        UIView *background = [[UIView alloc] initWithFrame:cell.frame];
        background.backgroundColor = [STYLESHEET getColor:@"background-color" withClass:class_name];
        cell.backgroundView = background;
    }
    
    // Set background gradient
    if ([STYLESHEET hasProperty:@"background-color-top" withClass:class_name]) {
        CGRect backgroundViewFrame = cell.contentView.frame;
        cell.backgroundView = [[UIView alloc] initWithFrame:backgroundViewFrame];
        CAGradientLayer *gradient = [NUIGraphics
                                     gradientLayerWithTop:[STYLESHEET getColor:@"background-color-top" withClass:class_name]
                                     withBottom:[STYLESHEET getColor:@"background-color-bottom" withClass:class_name]
                                     withFrame:cell.bounds];
        [cell.backgroundView.layer addSublayer:gradient];
    }
    
    // Set fonts
    [NUIRenderer renderLabel:cell.textLabel withClass:class_name withSuffix:@""];
    [NUIRenderer renderLabel:cell.detailTextLabel withClass:class_name withSuffix:@"Detail"];
    
}

@end
