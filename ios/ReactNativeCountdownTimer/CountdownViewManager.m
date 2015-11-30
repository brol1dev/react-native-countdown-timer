//
//  CountdownViewManager.m
//  ReactNativeCountdownTimer
//
//  Created by Eric Vargas on 11/30/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "CountdownViewManager.h"

#import <UIKit/UIKit.h>

#import "CountdownView.h"

@implementation CountdownViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [[CountdownView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
}

@end
