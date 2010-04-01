//
//  UIBarButtonItem+Additions.h
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIBarButtonItem (JLAdditions)

+ (id)barButtonWithSystemItem:(UIBarButtonSystemItem)systemItem target:(id)target action:(SEL)action;

@end
