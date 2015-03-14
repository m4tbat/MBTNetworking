//
//  MBTSampleRequests.h
//  MBTNetworking
//
//  Created by Matteo Battaglio on 08/03/15.
//  Copyright (c) 2015 Matteo Battaglio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBTHTTPRequest.h>

@interface MBTSampleRequests : NSObject

+ (MBTHTTPRequest *)get;

+ (MBTHTTPRequest *)headers;

@end
