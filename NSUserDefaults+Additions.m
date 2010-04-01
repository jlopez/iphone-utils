//
//  NSUserDefaults+Additions.m
//  Additions
//
//  Created by jlopez on 2/26/10.
//  Copyright 2010 JLA. All rights reserved.
//

#import "NSUserDefaults+Additions.h"


@implementation NSUserDefaults (JLAdditions)


+ (void)setupDefaults {
  NSMutableDictionary *defaults = [NSMutableDictionary dictionaryWithCapacity:8];

  //Get the bundle path
  NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"Root" ofType:@"plist" inDirectory:@"Settings.bundle"];

  //Get the Preferences Array from the dictionary
  NSDictionary *settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:plistFile];
  NSArray *preferencesArray = [settingsDictionary objectForKey:@"PreferenceSpecifiers"];
  for (id specifier in preferencesArray) {
    NSString *key = [specifier objectForKey:@"Key"];
    NSString *defaultValue = [specifier objectForKey:@"DefaultValue"];

    if (key && defaultValue)
      [defaults setObject:defaultValue forKey:key];
  }

  // Register defaults
  [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}


@end
