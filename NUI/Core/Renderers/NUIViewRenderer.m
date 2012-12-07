//
//  NUIViewRenderer.m
//  NUIDemo
//
//  Created by Tom Benner on 11/24/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIViewRenderer.h"

@implementation NUIViewRenderer

+ (void)render:(UIView*)view withClass:(NSString*)class_name
{
    if ([STYLESHEET hasProperty:@"background-image" withClass:class_name]) {
        [view setBackgroundColor: [STYLESHEET getColorFromImage:@"background-image" withClass: class_name]];
    } else if ([STYLESHEET hasProperty:@"background-color" withClass:class_name]) {
        [view setBackgroundColor: [STYLESHEET getColor:@"background-color" withClass: class_name]];
    }
}

@end
