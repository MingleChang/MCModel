//
//  NSObject+MCProperty.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"

@interface NSObject (MCProperty)

+ (void)mc_enumerateProperties:(MCPropertyEnumeration)enumeration;

@end
