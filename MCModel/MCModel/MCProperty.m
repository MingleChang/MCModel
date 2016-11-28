//
//  MCProperty.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCProperty.h"

@implementation MCProperty

- (instancetype)initWithObjProperty:(objc_property_t)property {
    self = [super init];
    if (self) {
        self.property = property;
    }
    return self;
}

+ (MCProperty *)propertyWithObjProperty:(objc_property_t)property {
    MCProperty *lProperty = [[MCProperty alloc] initWithObjProperty:property];
    return lProperty;
}

- (void)setProperty:(objc_property_t)property {
    _property = property;
    
    _name = @(property_getName(property));
    NSString *attrs = @(property_getAttributes(property));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 1;
    if (dotLoc == NSNotFound) {
        code = [attrs substringFromIndex:loc];
    } else {
        code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc)];
    }
    self.type = [MCPropertyType propertyTypeWithTypeCode:code];
}

@end
