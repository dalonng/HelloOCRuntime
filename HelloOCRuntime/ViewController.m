//
//  ViewController.m
//  HelloOCRuntime
//
//  Created by d on 2023/07/22.
//

#import "ViewController.h"
#import "OakOProperty.h"
#import "Oak.h"
#import "Barrel.h"
#import "HelloOCRuntime-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"Oak properties: %@", oak_propertics([Oak class]));
  [OakSwift main];
}


@end
