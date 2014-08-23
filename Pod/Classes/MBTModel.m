//
//  MBTModel.m
//  metoo White Label
//
//  Created by Matteo Battaglio on 06/08/14.
//  Copyright (c) 2014 metoo. All rights reserved.
//

#import "MBTModel.h"

@implementation MBTModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    [NSException raise:@"MBTModel.JSONKeyPathsByPropertyKeyException" format:@"%@ does not implement mandatory MTLJSONSerializing's JSONKeyPathsByPropertyKey method", NSStringFromClass([self class])];
    return nil;
}

@end
