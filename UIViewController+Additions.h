//
//  UINavigationController+Additions.h
//  Additions
//
//  Created by jlopez on 2/26/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIViewController (JLAdditions)

+ (UIViewController *)rootViewController;
+ (UIViewController *)topViewController;
+ (void)setRootViewController:(UIViewController *)controller;

@end
