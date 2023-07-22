//
//  OakProperty.h
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OakProperty : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* attributes;

@end

// MARK: - oak_propertics

extern NSArray<OakProperty *> * oak_propertics(Class klass);


NS_ASSUME_NONNULL_END


