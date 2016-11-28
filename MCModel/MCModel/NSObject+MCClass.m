//
//  NSObject+MCClass.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "NSObject+MCClass.h"

@implementation NSObject (MCClass)

+ (void)mc_enumerateClasses:(MCClassesEnumeration)enumeration {
    if (enumeration == nil) {
        return;
    }
    BOOL stop = NO;
    
    Class c = self;
    while (c && !stop) {
        enumeration(c, &stop);
        c = class_getSuperclass(c);
        if ([MCModelHelper isFoundationClass:c]) {
            break;
        }
    }
}
+ (void)mc_enumerateAllClasses:(MCClassesEnumeration)enumeration {
    if (enumeration == nil) {
        return;
    }
    BOOL stop = NO;

    Class c = self;
    while (c && !stop) {
        enumeration(c, &stop);
        c = class_getSuperclass(c);
    }
}

@end
