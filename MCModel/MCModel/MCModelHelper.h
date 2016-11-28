//
//  MCModelHelper.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/28.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"

@interface MCModelHelper : NSObject

+ (NSArray *)defaultPropertyNames;
+ (BOOL)isDefaultPropertyName:(NSString *)propertyName;
+ (NSArray *)foundationClasses;
+ (BOOL)isFoundationClass:(Class)c;

@end
