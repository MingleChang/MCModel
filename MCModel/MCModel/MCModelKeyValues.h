//
//  MCModelKeyValues.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/29.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MCModelKeyValues <NSObject>

@optional;
+ (NSDictionary *)mc_replacedKeyFromPropertyName;
+ (NSDictionary *)mc_objectClassInArray;

@end
