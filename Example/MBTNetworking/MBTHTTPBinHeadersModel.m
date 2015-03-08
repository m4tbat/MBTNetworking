//
//  MBTHTTPBinHeadersModel.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 08/03/15.
//  Copyright (c) 2015 Matteo Battaglio. All rights reserved.
//

#import "MBTHTTPBinHeadersModel.h"

@implementation MBTHTTPBinHeadersModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ selStr(accept): @"Accept",
              selStr(acceptEncoding): @"Accept-Encoding",
              selStr(acceptLanguage): @"Accept-Language",
              selStr(cookie): @"Cookie",
              selStr(host): @"Host",
              selStr(referer): @"Referer",
              selStr(userAgent): @"User-Agent" };
}

@end

