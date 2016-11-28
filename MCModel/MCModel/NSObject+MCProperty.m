//
//  NSObject+MCProperty.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "NSObject+MCProperty.h"

@implementation NSObject (MCProperty)

+ (void)mc_enumerateProperties:(MCPropertyEnumeration)enumeration {
    NSArray *cachedProperties = [self mc_properties];
    BOOL stop = NO;
    for (MCProperty *property in cachedProperties) {
        enumeration(property, &stop);
        if (stop) {
            break;
        }
    }
}

+ (NSMutableArray *)mc_properties{
    NSMutableArray *lProperties = [NSMutableArray array];
    [self mc_enumerateClasses:^(__unsafe_unretained Class c, BOOL *stop) {
        unsigned int outCount = 0;
        objc_property_t *properties = class_copyPropertyList(c, &outCount);
        
        for (NSInteger i=0; i<outCount; i++) {
            MCProperty *lProperty = [MCProperty propertyWithObjProperty:properties[i]];
            if ([MCModelHelper isDefaultPropertyName:lProperty.name]) {
                break;
            }
            [lProperties addObject:lProperty];
        }
        free(properties);
    }];
    return lProperties;
}

@end
