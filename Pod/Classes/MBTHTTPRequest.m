//
//  MBTHTTPRequest.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 04/08/14.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import "MBTHTTPRequest.h"

@interface MBTHTTPRequest ()

@end

@implementation MBTHTTPRequest

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                       modelClass:(__unsafe_unretained Class)modelClass {
    return [[self alloc] initWithMethod:method path:path params:params modelClass:modelClass];
}

- (instancetype)initWithMethod:(MBTHTTPRequestMethod)method
                          path:(NSString *)path
                        params:(NSDictionary *)params
                    modelClass:(__unsafe_unretained Class)modelClass {
    self = [super init];
    if (self) {
        _method = method;
        _path = path;
        _params = params;
        _modelClass = modelClass;
    }
    return self;
}

- (id)parseResponseObject:(id)responseObject error:(NSError **)error {
    if ([responseObject isKindOfClass:[NSString class]] || [responseObject isKindOfClass:[NSNumber class]]) {
        return responseObject;
    }
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        return [MTLJSONAdapter modelOfClass:self.modelClass fromJSONDictionary:responseObject error:error];
    }
    else if ([responseObject isKindOfClass:[NSArray class]]) {
        return [MTLJSONAdapter modelsOfClass:self.modelClass fromJSONArray:responseObject error:error];
    }
    else {
        if (error != NULL) {
			NSDictionary *userInfo = @{
                                       NSLocalizedDescriptionKey: [NSString stringWithFormat:NSLocalizedString(@"responseObject class is neither NSDictionary nor NSArray, but %@", nil), [responseObject class]],
                                       NSLocalizedFailureReasonErrorKey: [NSString stringWithFormat:NSLocalizedString(@"responseObject class must be NSDictionary or NSArray", nil), [responseObject class]],
                                       };
			*error = [NSError errorWithDomain:MTLJSONAdapterErrorDomain code:MTLJSONAdapterErrorInvalidJSONDictionary userInfo:userInfo];
		}
        
        return nil;
    }
}

@end
