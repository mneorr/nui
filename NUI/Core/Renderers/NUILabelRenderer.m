//
//  NUILabelRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUILabelRenderer.h"

@implementation NUILabelRenderer

+ (void)render:(UILabel*)label withClass:(NSString*)class_name
{
    [self render:label withClass:class_name withSuffix:@""];
}

+ (void)render:(UILabel*)label withClass:(NSString*)class_name withSuffix:(NSString*)suffix
{
    NSString *property;
    
    if (![suffix isEqualToString:@""]) {
        class_name = [NSString stringWithFormat:@"%@%@", class_name, suffix];
    }
    
    property = @"font-color";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        label.textColor = [STYLESHEET getColor:property withClass:class_name];
    }
    
    property = @"font-color-highlighted";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        label.highlightedTextColor = [STYLESHEET getColor:property withClass:class_name];
    }
    
    property = @"font-name";
    NSString *size_property = @"font-size";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        label.font = [UIFont fontWithName:[STYLESHEET get:property withClass:class_name] size:[STYLESHEET getFloat:size_property withClass:class_name]];
    }
    
    property = @"text-alpha";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        label.alpha = [STYLESHEET getFloat:property withClass:class_name];
    }
    
    property = @"text-auto-fit";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        [label setAdjustsFontSizeToFitWidth:[STYLESHEET getBoolean:property withClass:class_name]];
    }
    
    property = @"text-shadow-color";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        label.shadowColor = [STYLESHEET getColor:property withClass:class_name];
    }
    
    property = @"text-shadow-offset";
    if ([STYLESHEET hasProperty:property withClass:class_name]) {
        label.shadowOffset = [STYLESHEET getSize:property withClass:class_name];
    }
}

@end
