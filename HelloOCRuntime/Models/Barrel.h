//
//  Barrel.h
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Barrel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSNumber* size;
@property (nonatomic, copy) NSString* name;

@end

NS_ASSUME_NONNULL_END
