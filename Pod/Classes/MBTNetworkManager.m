//
//  MBTNetworkManager.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 02/08/14.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import "MBTNetworkManager.h"
#import <AFNetworking.h>

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

- (NSURLSessionDataTask *)performRequest:(MBTHTTPRequest *)request {
    NSURLSessionDataTask *task;
    void (^successBlock)(NSURLSessionDataTask *task, id responseObject) = ^void(NSURLSessionDataTask *task, id responseObject) {
        if (request.responseBlock) {
            request.responseBlock(task, responseObject, nil);
        }
    };
    void (^failureBlock)(NSURLSessionDataTask *task, id responseObject) = ^void(NSURLSessionDataTask *task, NSError *error) {
        if (request.responseBlock) {
            request.responseBlock(task, nil, error);
        }
    };
    
    switch (request.method) {
        case GET:
            task = [self.httpManager GET:request.path
                              parameters:request.params
                                 success:successBlock
                                 failure:failureBlock];
            break;
        case POST:
            task = [self.httpManager POST:request.path
                               parameters:request.params
                                  success:successBlock
                                  failure:failureBlock];
            break;
        case PUT:
            task = [self.httpManager PUT:request.path
                              parameters:request.params
                                 success:successBlock
                                 failure:failureBlock];
            break;
        case DELETE:
            task = [self.httpManager DELETE:request.path
                                 parameters:request.params
                                    success:successBlock
                                    failure:failureBlock];
            break;
        default:
            task = nil;
            break;
    }
    
    return task;
}

@end
