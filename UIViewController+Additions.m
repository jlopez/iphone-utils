//
//  UINavigationController+Additions.m
//  Additions
//
//  Created by jlopez on 2/26/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "UIViewController+Additions.h"


@implementation UIViewController (JLAdditions)


static UIViewController *rootViewController = nil;
+ (UIViewController *)rootViewController {
  return rootViewController;
}


+ (void)setRootViewController:(UIViewController *)controller {
  if (rootViewController == nil)
    rootViewController = controller;
}


+ (UIViewController *)topViewController {
  UIViewController *viewController = rootViewController;
  while (viewController.modalViewController)
    viewController = viewController.modalViewController;
  return viewController;
}


@end
