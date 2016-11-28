//
//  NSObject+MCModel.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "NSObject+MCModel.h"

@implementation NSObject (MCModel)

- (instancetype)mc_initWithKeyValues:(NSDictionary *)keyValues {
    [[self class] mc_enumerateProperties:^(MCProperty *property, BOOL *stop) {
        
        NSLog(@"%@",property.name);
        id value;
        value = [keyValues objectForKey:property.name];
        if (value == nil || property.type.isKVCDisabled == YES) {
            return;
        }
        [self setValue:value forKey:property.name];
    }];
    return self;
}

+ (instancetype)mc_objectWithKeyValues:(NSDictionary *)keyValues {
    return [[self alloc]mc_initWithKeyValues:keyValues];
}

@end
