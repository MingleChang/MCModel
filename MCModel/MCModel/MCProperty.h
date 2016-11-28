//
//  MCProperty.h
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"

@interface MCProperty : NSObject

@property(nonatomic, assign)objc_property_t property;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)Class srcClass;

@property(nonatomic, strong)MCPropertyType *type;

+ (MCProperty *)propertyWithObjProperty:(objc_property_t)property;

@end
