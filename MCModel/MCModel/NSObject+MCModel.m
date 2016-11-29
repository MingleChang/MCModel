//
//  NSObject+MCModel.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "NSObject+MCModel.h"

@implementation NSObject (MCModel)

#pragma mark - JSONObject To Model
- (instancetype)mc_setupKeyValues:(id)keyValues {
    keyValues = [keyValues mc_JSONObject];
    [[self class] mc_enumerateProperties:^(MCProperty *property, BOOL *stop) {
        MCPropertyType *lType = property.type;
        Class lPropertyClass = lType.typeClass;
        id value;
        value = [keyValues objectForKey:property.name];
        if (value == nil || value == [NSNull null] || property.type.isKVCDisabled == YES) {
            return;
        }
        if (!lType.isFromFoundation && lPropertyClass ) {
            value = [lPropertyClass mc_objectWithKeyValues:value];
        }
        [self setValue:value forKey:property.name];
    }];
    return self;
}

+ (instancetype)mc_objectWithKeyValues:(NSDictionary *)keyValues {
    return [[self alloc]mc_setupKeyValues:keyValues];
}

+ (NSMutableArray *)mc_objectArrayWithKeyValuesArray:(id)keyValuesArray {
    keyValuesArray = [keyValuesArray mc_JSONObject];
    if ([MCModelHelper isFoundationClass:self]) {
        return keyValuesArray;
    }
    
    NSMutableArray *lArray = [NSMutableArray array];
    for (NSDictionary *keyValues in keyValuesArray) {
        if ([keyValues isKindOfClass:[NSArray class]]){
            [lArray addObject:[self mc_objectArrayWithKeyValuesArray:keyValues]];
        } else {
            id lModel = [self mc_objectWithKeyValues:keyValues];
            if (lModel) {
                [lArray addObject:lModel];
            }
        }
    }
    return lArray;
}
#pragma mark - Model To JSONObject
- (NSMutableDictionary *)mc_keyValues {
    NSMutableDictionary *lKeyValues = [NSMutableDictionary dictionary];
    [[self class] mc_enumerateProperties:^(MCProperty *property, BOOL *stop) {
        id value = [self valueForKey:property.name];
        if (value == nil) {
            return;
        }
        MCPropertyType *lType = property.type;
        Class lPropertyClass = lType.typeClass;
        if (!lType.isFromFoundation && lPropertyClass) {
            value = [value mc_keyValues];
        } else if ([value isKindOfClass:[NSArray class]]) {
            value = [NSObject mc_keyValuesArrayWithObjectArray:value];
        } else if (lPropertyClass == [NSURL class]) {
            value = [value absoluteString];
        }
        lKeyValues[property.name] = value;
    }];
    return lKeyValues;
}

+ (NSMutableArray *)mc_keyValuesArrayWithObjectArray:(NSArray *)objectArray {
    NSMutableArray *lKeyValuesArray = [NSMutableArray array];
    for (id object in objectArray) {
        [lKeyValuesArray addObject:[object mc_keyValues]];
    }
    
    return lKeyValuesArray;
}

#pragma mark - To JSON
- (NSData *)mc_JSONData {
    if ([self isKindOfClass:[NSString class]]) {
        return [((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([self isKindOfClass:[NSData class]]) {
        return (NSData *)self;
    }else {
        return [NSJSONSerialization dataWithJSONObject:[self mc_JSONObject] options:NSJSONWritingPrettyPrinted error:nil];
    }
}
- (id)mc_JSONObject {
    if ([self isKindOfClass:[NSString class]]) {
        return [NSJSONSerialization JSONObjectWithData:[((NSString *)self) dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    } else if ([self isKindOfClass:[NSData class]]) {
        return [NSJSONSerialization JSONObjectWithData:(NSData *)self options:NSJSONReadingAllowFragments error:nil];
    }else {
        return self;
    }
}
- (NSString *)mj_JSONString {
    if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    } else if ([self isKindOfClass:[NSData class]]) {
        return [[NSString alloc] initWithData:(NSData *)self encoding:NSUTF8StringEncoding];
    }else {
        return [[NSString alloc] initWithData:[self mc_JSONData] encoding:NSUTF8StringEncoding];
    }
}
@end
