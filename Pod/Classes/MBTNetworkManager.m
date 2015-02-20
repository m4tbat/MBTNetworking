//
//  MBTNetworkManager.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 02/08/14.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import "MBTNetworkManager.h"
#import <AFNetworking.h>
#import <Promise.h>

@interface MBTNetworkManager ()

@property (nonatomic, strong) AFHTTPSessionManager *httpManager;

@end

@implementation MBTNetworkManager

#pragma mark - Public

- (id)initWithBaseURL:(NSURL *)baseURL {
    self = [super init];
    if (self) {
        self.httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    }
    return self;
}

- (PMKPromise *)performRequest:(MBTHTTPRequest *)request {
    PMKPromise *promise;
    switch (request.method) {
        case GET:
            promise = [self.httpManager GET:request.path parameters:request.params];
            break;
        case POST:
            promise = [self.httpManager POST:request.path parameters:request.params];
            break;
        case PUT:
            promise = [self.httpManager PUT:request.path parameters:request.params];
            break;
        case DELETE:
            promise = [self.httpManager DELETE:request.path parameters:request.params];
            break;
        default:
            promise = nil;
            break;
    }
    
    return promise.then(^(id responseObject, NSURLSessionTask *task) {
        NSError *error = nil;
        id parsedObject = [request parseResponseObject:responseObject error:&error];
        return [PMKPromise new:^(PMKPromiseFulfiller fulfill, PMKPromiseRejecter reject) {
            if (error) {
                reject(error);
            } else {
                fulfill(PMKManifold(parsedObject, task));
            }
        }];
    });
}

- (AFHTTPRequestSerializer *)requestSerializer {
    return self.httpManager.requestSerializer;
}

- (void)setRequestSerializer:(AFHTTPRequestSerializer<AFURLRequestSerialization> *)requestSerializer {
    self.httpManager.requestSerializer = requestSerializer;
}

- (AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer {
    return self.httpManager.responseSerializer;
}

- (void)setResponseSerializer:(AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer {
    self.httpManager.responseSerializer = responseSerializer;
}

@end
