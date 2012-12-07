//
//  NUIAppearance.m
//  NUI
//
//  Created by Tom Benner on 11/21/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "NUIAppearance.h"

@implementation NUIAppearance

+ (void)initializeWithStylesheet:(NSString *)fileName
{
    [STYLESHEET loadStylesheet:fileName];

    [self initUINavigationBar];
    [self initUIBarButtonItem];
}

+ (void)initUINavigationBar
{
    
    NSString *ui_class_name = @"UINavigationBar";
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:ui_class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
    }
    
    if ([STYLESHEET hasProperty:@"background-image" withClass:ui_class_name]) {
        [[UINavigationBar appearance] setBackgroundImage:[STYLESHEET getImage:@"background-image" withClass:ui_class_name] forBarMetrics:UIBarMetricsDefault];
    }
    
    if ([STYLESHEET hasProperty:@"background-tint-color" withClass:ui_class_name]) {
        [[UINavigationBar appearance] setTintColor:[STYLESHEET getColor:@"background-tint-color" withClass:ui_class_name]];
    }
    
    if ([STYLESHEET hasProperty:@"background-color" withClass:ui_class_name]) {
        [[UINavigationBar appearance] setBackgroundImage:[STYLESHEET getImageFromColor:@"background-color" withClass:ui_class_name] forBarMetrics:UIBarMetricsDefault];
    }
    
}

+ (void)initUIBarButtonItem
{
    
    NSString *ui_class_name = @"UIBarButtonItem";
    
    NSDictionary *titleTextAttributes = [NUIUtilities titleTextAttributesForClass:ui_class_name];
    
    if ([[titleTextAttributes allKeys] count] > 0) {
        [[UIBarButtonItem appearance] setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    
    if ([STYLESHEET hasProperty:@"background-color" withClass:ui_class_name]) {
        UIImage *backgroundColorImage = [NUIGraphics barButtonWithColor:[STYLESHEET getColor:@"background-color" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackgroundImage:backgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([STYLESHEET hasProperty:@"background-tint-color" withClass:ui_class_name]) {
        [[UIBarButtonItem appearance] setTintColor:[STYLESHEET getColor:@"background-tint-color" withClass:ui_class_name]];
    }
    
    if ([STYLESHEET hasProperty:@"background-image" withClass:ui_class_name]) {
        [[UIBarButtonItem appearance] setBackgroundImage:[STYLESHEET getImage:@"background-image" withClass:ui_class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    NSString *ui_back_class_name = @"UIBackBarButtonItem";
    
    if ([STYLESHEET hasProperty:@"background-color" withClass:ui_back_class_name]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[STYLESHEET getColor:@"background-color" withClass:ui_back_class_name]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else if ([STYLESHEET hasProperty:@"background-color" withClass:ui_class_name]) {
        UIImage *backBackgroundColorImage = [NUIGraphics backButtonWithColor:[STYLESHEET getColor:@"background-color" withClass:ui_class_name]];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backBackgroundColorImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if ([STYLESHEET hasProperty:@"background-image" withClass:ui_back_class_name]) {
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[STYLESHEET getImage:@"background-image" withClass:ui_back_class_name] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
}

@end
