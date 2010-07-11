//
//  JLCellEditor.h
//  LanguageBuddy
//
//  Created by jlopez on 7/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JLCellEditor : NSObject {
@private
  id delegate;
  UITableView *tableView;
  UITextView *textView;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) UITableView *tableView;

- (void)editCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)endCellEditing;

@end


@interface NSObject (JLCellEditorDelegate)

- (void)tableViewCellDidEndEditingWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath;

@end