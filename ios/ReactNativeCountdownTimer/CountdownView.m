//
//  CountdownView.m
//  ReactNativeCountdownTimer
//
//  Created by Eric Vargas on 11/30/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "CountdownView.h"

@interface CountdownView ()

@property (strong, nonatomic) CAShapeLayer *circleLayer;

@end

@implementation CountdownView

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.radius = 50.0;
    self.frame = [self circleFrame];
    [self configure];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if (self) {
    self.radius = 50.0;
    self.frame = [self circleFrame];
    [self configure];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.radius = 50.0;
    self.frame = [self circleFrame];
    [self configure];
  }
  return self;
}

- (void)configure
{
  self.circleLayer = [[CAShapeLayer alloc] init];
  self.circleLayer.frame = self.bounds;
  self.circleLayer.lineWidth = 2;
  self.circleLayer.fillColor = [UIColor whiteColor].CGColor;
  self.circleLayer.strokeColor = [UIColor redColor].CGColor;
  [self.layer addSublayer:self.circleLayer];
}

- (CGRect)circleFrame
{
  CGRect circleFrame = CGRectMake(0, 0, self.radius * 2, self.radius * 2);
  circleFrame.origin.x = CGRectGetMidX(self.circleLayer.bounds) - CGRectGetMidX(circleFrame);
  circleFrame.origin.y = CGRectGetMidY(self.circleLayer.bounds) - CGRectGetMidY(circleFrame);
  return circleFrame;
}

- (UIBezierPath *)circlePath
{
  return [UIBezierPath bezierPathWithOvalInRect:[self circleFrame]];
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  self.circleLayer.frame = self.bounds;
  self.circleLayer.path = [[self circlePath] CGPath];
}

@end
