//
//  NUIBarButtonItemRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIBarButtonItemRenderer.h"

@implementation NUIBarButtonItemRenderer

+ (void)render:(UIBarButtonItem*)item withClass:(NSString*)class_name
{   
    
    if ([STYLESHEET hasProperty:@"background-image" withClass:class_name]) {
        [item setBackgroundImage:[STYLESHEET getImage:@"background-image" withClass:class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([STYLESHEET hasProperty:@"background-tint-color" withClass:class_name]) {
        [item setTintColor:[STYLESHEET getColor:@"background-tint-color" withClass:class_name]];
    }
    if ([STYLESHEET hasProperty:@"background-color" withClass:class_name]) {
        UIImage *backgroundColorImage = [NUIGraphics barButtonWithColor:[STYLESHEET getColor:@"background-color" withClass:class_name]];
        [item setBackgroundImage:backgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [item setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
}

@end
