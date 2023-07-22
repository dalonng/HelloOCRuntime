# HelloOCRuntime
Learn Objective-C runtime

## 获取 property
```objective-c
//  class_copyPropertyList
@interface Oak : NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSNumber* size;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong) Barrel* barrel;
@end
  
@interface Oak(Ext)
@property (nonatomic, assign) BOOL isWine;
@end
```

```shell
Oak properties: (
    "<0x60000022a740: name: isWine, attributes: TB,N>",
    "<0x60000022bfc0: name: count, attributes: Tq,N,V_count>",
    "<0x60000022bfe0: name: size, attributes: T@\"NSNumber\",&,N,V_size>",
    "<0x60000021f620: name: name, attributes: T@\"NSString\",C,N,V_name>",
    "<0x60000021e9c0: name: barrel, attributes: T@\"Barrel\",&,N,V_barrel>"
)
```



通过 `class_copyPropertyList` 可以获取一个类中声明的所有 `@property`，包括在分类中。

但是不会取到基类中的属性。
