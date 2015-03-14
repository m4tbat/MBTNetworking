//
//  MBTSampleRequests.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 08/03/15.
//  Copyright (c) 2015 Matteo Battaglio. All rights reserved.
//

#import "MBTSampleRequests.h"
#import "MBTHTTPBinGetModel.h"
#import "MBTHTTPBinHeadersModel.h"

@implementation MBTSampleRequests

+ (MBTHTTPRequest *)get {
    return [MBTHTTPRequest requestWithMethod:MBT_GET path:@"/get" params:nil modelClass:[MBTHTTPBinGetModel class]];
}

+ (MBTHTTPRequest *)headers {
    return [MBTHTTPRequest requestWithMethod:MBT_GET path:@"/headers" params:nil modelClass:[MBTHTTPBinHeadersModel class] jsonRootPath:@"headers"];
}

@end
