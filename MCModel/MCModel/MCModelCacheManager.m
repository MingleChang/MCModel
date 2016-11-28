//
//  MCModelCacheManager.m
//  MCModel
//
//  Created by 常峻玮 on 16/11/27.
//  Copyright © 2016年 Mingle. All rights reserved.
//

#import "MCModelCacheManager.h"

@interface MCModelCacheManager ()

@end

@implementation MCModelCacheManager

+ (MCModelCacheManager *)manager {
    static MCModelCacheManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MCModelCacheManager alloc] init];
    });
    return manager;
}

@end
