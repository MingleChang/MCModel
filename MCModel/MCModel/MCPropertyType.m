//
//  MCPropertyType.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCPropertyType.h"

@interface MCPropertyType ()

@property(nonatomic, assign, readwrite, getter=isIdType)BOOL idType;
@property(nonatomic, assign, readwrite, getter=isNumberType)BOOL numberType;
@property (nonatomic, assign, readwrite, getter=isBoolType)BOOL boolType;
@property (nonatomic, assign, readwrite)Class typeClass;
@property (nonatomic, assign, readwrite, getter = isFromFoundation)BOOL fromFoundation;
@property (nonatomic, assign, readwrite, getter = isKVCDisabled)BOOL KVCDisabled;

@end

@implementation MCPropertyType

- (instancetype)initWithTypeCode:(NSString *)typeCode {
    self = [super init];
    if (self) {
        self.typeCode = typeCode;
    }
    return self;
}

+ (MCPropertyType *)propertyTypeWithTypeCode:(NSString *)typeCode {
    MCPropertyType *lType = [[MCPropertyType alloc] initWithTypeCode:typeCode];
    return lType;
}

- (void)setTypeCode:(NSString *)typeCode {
    if ([_typeCode isEqualToString:typeCode]) {
        return;
    }
    _typeCode = typeCode;
    
    if ([typeCode isEqualToString:MCModelPropertyTypeId]) {
        self.idType = YES;
    } else if (typeCode.length == 0) {
        self.KVCDisabled = YES;
    } else if (typeCode.length > 3 && [typeCode hasPrefix:@"@\""]) {
        // 去掉@"和"，截取中间的类型名称
        _typeCode = [typeCode substringWithRange:NSMakeRange(2, typeCode.length - 3)];
        self.typeClass = NSClassFromString(_typeCode);
        self.fromFoundation = [MCModelHelper isFoundationClass:self.typeClass];
        self.numberType = [self.typeClass isSubclassOfClass:[NSNumber class]];
        
    } else if ([typeCode isEqualToString:MCModelPropertyTypeSEL] ||
               [typeCode isEqualToString:MCModelPropertyTypeIvar] ||
               [typeCode isEqualToString:MCModelPropertyTypeMethod]) {
        self.KVCDisabled = YES;
    }
    
    NSArray *numberTypes = @[MCModelPropertyTypeChar,MCModelPropertyTypeInt,MCModelPropertyTypeShort,MCModelPropertyTypeLong,MCModelPropertyTypeLongLong,MCModelPropertyTypeUnsignedChar,MCModelPropertyTypeUnsignedInt,MCModelPropertyTypeUnsignedShort,MCModelPropertyTypeUnsignedLong,MCModelPropertyTypeUnsignedLongLong,MCModelPropertyTypeFloat,MCModelPropertyTypeDouble,MCModelPropertyTypeBool];
    if ([numberTypes containsObject:_typeCode]) {
        self.numberType = YES;
        if ([_typeCode isEqualToString:MCModelPropertyTypeBool]) {
            self.boolType = YES;
        }
    }
}

@end
