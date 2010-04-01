//
//  UITableView+Additions.h
//  Additions
//
//  Created by jlopez on 2/25/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UITableView (JLAdditions)

- (id)dequeueCellWithStyle:(UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier;
- (id)dequeueReusableCellOfClass:(Class)cls;
- (id)placeholderCellWithText:(NSString *)text;

@end
