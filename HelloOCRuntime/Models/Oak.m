//
//  Oak.m
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import "Oak.h"
@import ObjectiveC;

static const void * kOak;

@implementation OakBase

@end

@implementation Oak

@end



@implementation Oak(Ext)

- (BOOL)isWine {
  NSNumber* value = objc_getAssociatedObject(self, kOak);
  if (![value isKindOfClass:[NSNumber class]]) {
    return NO;
  }
  return value.boolValue;
}

- (void)setIsWine:(BOOL)isWine {
  objc_setAssociatedObject(self, kOak, [NSNumber numberWithBool:isWine], OBJC_ASSOCIATION_ASSIGN);
}

@end
