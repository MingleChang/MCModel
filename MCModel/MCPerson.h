//
//  MCPerson.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/29.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCDog.h"
@interface MCPerson : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)double height;
@property (nonatomic, strong)MCDog *dog;
@end
