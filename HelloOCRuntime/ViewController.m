//
//  ViewController.m
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import "ViewController.h"
#import "OakProperty.h"
#import "Oak.h"
#import "Barrel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSArray<OakProperty *>* properties = oak_propertics([Oak class]);
  NSLog(@"Oak properties: %@", properties);
}


@end
