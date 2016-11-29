//
//  NSObject+MCModel.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"

@interface NSObject (MCModel) <MCModelKeyValues>

+ (instancetype)mc_objectWithKeyValues:(NSDictionary *)keyValues;
- (NSMutableDictionary *)mc_keyValues;

@end
