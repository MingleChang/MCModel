//
//  ViewController.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/28.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "ViewController.h"
#import "MCDog.h"
#import "MCBigDog.h"
#import "MCModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *lDic = @{@"name":@"joke",@"age":@(10)};
    
    MCDog *lDog = [MCDog mc_objectWithKeyValues:lDic];
    NSLog(@"%@",lDog);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
