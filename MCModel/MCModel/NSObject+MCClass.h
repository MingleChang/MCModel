//
//  NSObject+MCClass.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"

@interface NSObject (MCClass)

+ (void)mc_enumerateClasses:(MCClassesEnumeration)enumeration;
+ (void)mc_enumerateAllClasses:(MCClassesEnumeration)enumeration;

@end
