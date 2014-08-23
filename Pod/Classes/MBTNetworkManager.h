//
//  MBTNetworkManager.h
//  MBTNetworking
//
//  Created by Matteo Battaglio on 02/08/14.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "MBTHTTPRequest.h"

@interface MBTNetworkManager : NSObject

- (instancetype)initWithBaseURL:(NSURL *)baseURL;

- (NSURLSessionDataTask *)performRequest:(MBTHTTPRequest *)request;

@end
