//
//  MCModelHelper.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/28.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCModelHelper.h"

@implementation MCModelHelper

+ (NSArray *)defaultPropertyNames {
    return @[MCObjectPropertyHash,
             MCObjectPropertySuperClass,
             MCObjectPropertyDescription,
             MCObjectPropertyDebugDescription,
             MCObjectPropertyAccessibilityCustomRotors,
             MCObjectPropertyAccessibilityIdentifier,
             MCObjectPropertyAccessibilityElements,
             MCObjectPropertyAccessibilityCustomActions,
             MCObjectPropertyIsAccessibilityElement,
             MCObjectPropertyAccessibilityLabel,
             MCObjectPropertyAccessibilityHint,
             MCObjectPropertyAccessibilityValue,
             MCObjectPropertyAccessibilityTraits,
             MCObjectPropertyAccessibilityFrame,
             MCObjectPropertyAccessibilityPath,
             MCObjectPropertyAccessibilityActivationPoint,
             MCObjectPropertyAccessibilityLanguage,
             MCObjectPropertyAccessibilityElementsHidden,
             MCObjectPropertyAccessibilityViewIsModal,
             MCObjectPropertyShouldGroupAccessibilityChildren,
             MCObjectPropertyAccessibilityNavigationStyle,
             MCObjectPropertyAccessibilityHeaderElements,
             MCObjectPropertyTraitStorageList,
             MCObjectPropertyAutoContentAccessingProxy,
             MCObjectPropertyClassForKeyedArchiver,
             MCObjectPropertyObservationInfo];
}

+ (BOOL)isDefaultPropertyName:(NSString *)propertyName {
    if ([[MCModelHelper defaultPropertyNames] containsObject:propertyName]) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSSet *)foundationClasses {
    NSSet *lFoundationClasses = [NSSet setWithObjects:
                                 [NSObject class],
                                 [NSURL class],
                                 [NSDate class],
                                 [NSValue class],
                                 [NSData class],
                                 [NSError class],
                                 [NSArray class],
                                 [NSDictionary class],
                                 [NSSet class],
                                 [NSString class],
                                 [NSAttributedString class], nil];
    return lFoundationClasses;
}

+ (BOOL)isFoundationClass:(Class)c {
    if ([[MCModelHelper foundationClasses] containsObject:c]) {
        return YES;
    }else{
        return NO;
    }
}
@end
