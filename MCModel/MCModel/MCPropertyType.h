//
//  MCPropertyType.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"

@interface MCPropertyType : NSObject

@property(nonatomic, copy)NSString *typeCode;
@property(nonatomic, assign, readonly, getter=isIdType)BOOL idType;
@property(nonatomic, assign, readonly, getter=isNumberType)BOOL numberType;
@property (nonatomic, assign, readonly, getter=isBoolType)BOOL boolType;
@property (nonatomic, assign, readonly)Class typeClass;
@property (nonatomic, assign, readonly, getter = isFromFoundation)BOOL fromFoundation;
@property (nonatomic, assign, readonly, getter = isKVCDisabled)BOOL KVCDisabled;

+ (MCPropertyType *)propertyTypeWithTypeCode:(NSString *)typeCode;

@end
