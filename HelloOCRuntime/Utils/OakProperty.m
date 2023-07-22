//
//  OakProperty.m
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import "OakProperty.h"

@import Foundation;
@import ObjectiveC;

@implementation OakProperty

- (instancetype)initWithName:(NSString *)name attributes:(NSString *)attributes {
  self = [super init];
  if (self) {
    self.name = name;
    self.attributes = attributes;
  }
  return self;
}

- (NSString *)description {
  return [[NSString alloc] initWithFormat:@"<%p: name: %@, attributes: %@>", self, self.name, self.attributes];
}

@end


NSArray<OakProperty *> * oak_propertics(Class klass) {
  NSMutableArray<OakProperty *>* oak_properties = [NSMutableArray array];
  unsigned int count_of_properties = 0;
  objc_property_t* properties = class_copyPropertyList(klass, &count_of_properties);
  for (NSUInteger i = 0; i < count_of_properties; i++) {
    objc_property_t property = properties[i];
    const char* property_name = property_getName(property);
    const char* property_attributes = property_getAttributes(property);
    NSString* name = [[NSString alloc] initWithUTF8String:property_name];
    NSString* attributes = [[NSString alloc] initWithUTF8String:property_attributes];
    [oak_properties addObject:[[OakProperty alloc] initWithName:name attributes:attributes]];
  }
  free(properties);
  return [oak_properties copy];
}
