//
//  NUIUtilities.m
//  NUI
//
//  Created by Tom Benner on 11/22/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIUtilities.h"

@implementation NUIUtilities

+ (NSDictionary*)titleTextAttributesForClass:(NSString*)class_name
{
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    if ([STYLESHEET hasProperty:@"font-name" withClass:class_name]) {
        [titleTextAttributes setObject:[UIFont fontWithName:[STYLESHEET get:@"font-name" withClass:class_name] size:[STYLESHEET getFloat:@"font-size" withClass:class_name]] forKey:UITextAttributeFont];
    }
    
    if ([STYLESHEET hasProperty:@"font-color" withClass:class_name]) {
        [titleTextAttributes setObject:[STYLESHEET getColor:@"font-color" withClass:class_name] forKey:UITextAttributeTextColor];
    }
    
    if ([STYLESHEET hasProperty:@"text-shadow-color" withClass:class_name]) {
        [titleTextAttributes setObject:[STYLESHEET getColor:@"text-shadow-color" withClass:class_name] forKey:UITextAttributeTextShadowColor];
    }
    
    if ([STYLESHEET hasProperty:@"text-shadow-offset" withClass:class_name]) {
        [titleTextAttributes setObject:[NSValue valueWithUIOffset:[STYLESHEET getOffset:@"text-shadow-offset" withClass:class_name]] forKey:UITextAttributeTextShadowOffset];
    }
    
    return titleTextAttributes;
}

@end
