//
//  Oak.h
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OakBase : NSObject
@property (nonatomic, copy) NSString* baseName;
@end

@class Barrel;

@interface Oak : OakBase

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat value;
@property (nonatomic, strong) NSNumber* size;
@property (nonatomic, copy) NSString* name;

@property (nonatomic, strong) Barrel* barrel;

@end

@interface Oak(Ext)

@property (nonatomic, assign) BOOL isWine;

@end

NS_ASSUME_NONNULL_END
