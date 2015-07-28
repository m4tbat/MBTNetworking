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
                       modelClass:(Class)modelClass {
    return [self requestWithMethod:method path:path params:nil modelClass:modelClass];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                       modelClass:(__unsafe_unretained Class)modelClass {
    return [self requestWithMethod:method path:path params:params headers:nil modelClass:modelClass];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass {
    return [self requestWithMethod:method path:path params:nil headers:headers modelClass:modelClass];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass {
    return [self requestWithMethod:method path:path params:params headers:headers modelClass:modelClass jsonRootPath:nil];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath {
    return [self requestWithMethod:method path:path params:nil modelClass:modelClass jsonRootPath:jsonRootPath];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath {
    return [self requestWithMethod:method path:path params:params headers:nil modelClass:modelClass jsonRootPath:jsonRootPath];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath {
    return [self requestWithMethod:method path:path params:nil headers:headers modelClass:modelClass jsonRootPath:jsonRootPath];
}

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                          headers:(NSDictionary *)headers
                       modelClass:(__unsafe_unretained Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath {
    return [[self alloc] initWithMethod:method path:path params:params headers:headers modelClass:modelClass jsonRootPath:jsonRootPath];
}

- (instancetype)initWithMethod:(MBTHTTPRequestMethod)method
                          path:(NSString *)path
                        params:(NSDictionary *)params
                       headers:(NSDictionary *)headers
                    modelClass:(__unsafe_unretained Class)modelClass
                  jsonRootPath:(NSString *)jsonRootPath {
    self = [super init];
    if (self) {
        _method = method;
        _path = path;
        _params = params;
        _modelClass = modelClass;
        _jsonRootPath = jsonRootPath;
    }
    return self;
}

- (PMKPromise *)parseResponseObject:(id)responseObject {
    assert([responseObject isKindOfClass:[NSString class]] ||
           [responseObject isKindOfClass:[NSNumber class]] ||
           [responseObject isKindOfClass:[NSArray class]] ||
           [responseObject isKindOfClass:[NSDictionary class]]);
    
    return [PMKPromise new:^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
        NSError *error = nil;
        id parsedObject = nil;
        
        if ([responseObject isKindOfClass:[NSString class]] || [responseObject isKindOfClass:[NSNumber class]]) {
            parsedObject = responseObject;
        } else if ([responseObject isKindOfClass:[NSArray class]]) {
            parsedObject = [MTLJSONAdapter modelsOfClass:self.modelClass fromJSONArray:responseObject error:&error];
        } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
            id unwrappedObject = self.jsonRootPath ? responseObject[self.jsonRootPath] : responseObject;
            if ([unwrappedObject isKindOfClass:[NSString class]] || [unwrappedObject isKindOfClass:[NSNumber class]]) {
                parsedObject = unwrappedObject;
            } else if ([unwrappedObject isKindOfClass:[NSArray class]]) {
                parsedObject = [MTLJSONAdapter modelsOfClass:self.modelClass fromJSONArray:unwrappedObject error:&error];
            } else if ([unwrappedObject isKindOfClass:[NSDictionary class]]) {
                parsedObject = [MTLJSONAdapter modelOfClass:self.modelClass fromJSONDictionary:unwrappedObject error:&error];
            }
        }
        
        if (!error) {
            fulfill(parsedObject);
        } else {
            reject(error);
        }
    }];
}

@end
