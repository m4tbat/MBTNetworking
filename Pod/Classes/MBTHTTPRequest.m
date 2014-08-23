//
//  MBTHTTPRequest.m
//  metoo White Label
//
//  Created by Matteo Battaglio on 04/08/14.
//  Copyright (c) 2014 metoo. All rights reserved.
//

#import "MBTHTTPRequest.h"

@interface MBTHTTPRequest ()

@end

@implementation MBTHTTPRequest

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                    responseBlock:(MBTHTTPResponseBlock)responseBlock {
    return [[[self class] alloc] initWithMethod:method path:path params:params responseBlock:responseBlock];
}

- (instancetype)initWithMethod:(MBTHTTPRequestMethod)method
                          path:(NSString *)path
                        params:(NSDictionary *)params
                 responseBlock:(MBTHTTPResponseBlock)responseBlock {
    self = [super init];
    if (self) {
        _method = method;
        _path = path;
        _params = params;
        __weak typeof(self) weakSelf = self;
        _responseBlock = ^void(NSURLSessionDataTask *task, id responseObject, NSError *error) {
            id parsedObject = error ? nil : [weakSelf parseResponseObject:responseObject error:&error];
            
            if (responseBlock) {
                responseBlock(task, parsedObject, error);
            }
        };
    }
    return self;
}

- (id)parseResponseObject:(id)responseObject error:(NSError **)error {
    if ([responseObject isKindOfClass:[NSString class]] || [responseObject isKindOfClass:[NSNumber class]]) {
        return responseObject;
    }
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        return [MTLJSONAdapter modelOfClass:[self responseObjectClass] fromJSONDictionary:responseObject error:error];
    }
    else if ([responseObject isKindOfClass:[NSArray class]]) {
        return [MTLJSONAdapter modelsOfClass:[self responseObjectClass] fromJSONArray:responseObject error:error];
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

- (Class)responseObjectClass {
    [NSException raise:@"MBTHTTPRequest.responseObjectClassException" format:@"%@ does not override mandatory MBTHTTPRequest's responseObjectClass method", NSStringFromClass([self class])];
    return nil;
}

@end
