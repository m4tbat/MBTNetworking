//
//  MBTHTTPBinGetModel.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 08/03/15.
//  Copyright (c) 2015 Matteo Battaglio. All rights reserved.
//

#import "MBTHTTPBinGetModel.h"
#import "MBTHTTPBinHeadersModel.h"

@implementation MBTHTTPBinGetModel

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[MBTHTTPBinHeadersModel class]];
}

@end
