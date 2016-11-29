//
//  MCModelConfigure.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#ifndef __MCModelConfigure__H__
#define __MCModelConfigure__H__

#import <Foundation/Foundation.h>
@class MCProperty;
@class MCPropertyType;

typedef void (^MCClassesEnumeration)(Class c, BOOL *stop);
typedef void (^MCPropertyEnumeration)(MCProperty *property, BOOL *stop);

#ifdef DEBUG
#define MCModelLog(...) NSLog(__VA_ARGS__)
#else
#define MCModelLog(...)
#endif

/*
 @encode(),各种类型对应的TypeCode
 此处是根据官方文档
 https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1
 所得
 */
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeChar;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeInt;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeShort;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeLong;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeLongLong;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeUnsignedChar;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeUnsignedInt;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeUnsignedShort;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeUnsignedLong;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeUnsignedLongLong;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeFloat;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeDouble;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeBool;

FOUNDATION_EXTERN NSString* const MCModelPropertyTypeVoid;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeCharacterString;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeId;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeClass;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeSEL;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeUnknown;
/*
 此处是测试所得
 */
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeIvar;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeMethod;
FOUNDATION_EXTERN NSString* const MCModelPropertyTypeBlock;

/*
 NSObject一些默认属性，这些属性不应该进行模型转换
 */
FOUNDATION_EXTERN NSString* const MCObjectPropertyHash;
FOUNDATION_EXTERN NSString* const MCObjectPropertySuperClass;
FOUNDATION_EXTERN NSString* const MCObjectPropertyDescription;
FOUNDATION_EXTERN NSString* const MCObjectPropertyDebugDescription;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityCustomRotors;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityIdentifier;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityElements;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityCustomActions;
FOUNDATION_EXTERN NSString* const MCObjectPropertyIsAccessibilityElement;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityLabel;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityHint;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityValue;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityTraits;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityFrame;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityPath;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityActivationPoint;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityLanguage;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityElementsHidden;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityViewIsModal;
FOUNDATION_EXTERN NSString* const MCObjectPropertyShouldGroupAccessibilityChildren;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityNavigationStyle;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAccessibilityHeaderElements;
FOUNDATION_EXTERN NSString* const MCObjectPropertyTraitStorageList;
FOUNDATION_EXTERN NSString* const MCObjectPropertyAutoContentAccessingProxy;
FOUNDATION_EXTERN NSString* const MCObjectPropertyClassForKeyedArchiver;
FOUNDATION_EXTERN NSString* const MCObjectPropertyObservationInfo;

#endif
