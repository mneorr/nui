//
//  NUITextFieldRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUITextFieldRenderer.h"

@implementation NUITextFieldRenderer

+ (void)render:(UITextField*)text_field withClass:(NSString*)class_name
{
    // Set font   
    if ([STYLESHEET hasProperty:@"font-name" withClass:class_name]) {
        [text_field setFont:[UIFont fontWithName:[STYLESHEET get:@"font-name" withClass:class_name] size:[STYLESHEET getFloat:@"font-size" withClass:class_name]]];
    }
    
    // Set border style   
    if ([STYLESHEET hasProperty:@"border-color" withClass:class_name]) {
        [text_field setBorderStyle:[STYLESHEET getBorderStyle:@"border-color" withClass:class_name]];
    }
    
    // Set height
    if ([STYLESHEET hasProperty:@"height" withClass:class_name]) {
        CGRect buttonFrame = text_field.frame;
        CGSize originalSize = buttonFrame.size;
        buttonFrame.size = CGSizeMake(originalSize.width, [STYLESHEET getFloat:@"height" withClass: class_name]);
        text_field.frame = buttonFrame;
    }
}

@end
