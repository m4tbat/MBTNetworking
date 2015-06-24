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

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             selStr(args): @"args",
             selStr(headers): @"headers",
             selStr(origin): @"origin",
             selStr(url): @"url"
             };
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)headersJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MBTHTTPBinHeadersModel class]];
}

@end
