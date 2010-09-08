//
//  JLKVObserver.h
//  Celestial
//
//  Created by jlopez on 9/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLKVObserver : NSObject {
@private
  void (^block)();
  BOOL isNested;
}

@property (nonatomic, readonly) id observedObject;
@property (nonatomic, readonly) NSString *keyPath;
@property (nonatomic, assign) NSKeyValueObservingOptions observingOptions;
@property (nonatomic, assign) BOOL allowNestedCalls;

- (void)startObservingObject:(id)object keyPath:(NSString *)keyPath block:(void (^)())block;
- (void)stopObserving;
- (BOOL)isObserving;

@end
