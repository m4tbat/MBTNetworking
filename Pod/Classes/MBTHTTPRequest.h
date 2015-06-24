//
//  MBTHTTPRequest.h
//  MBTNetworking
//
//  Created by Matteo Battaglio on 04/08/14.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLJSONAdapter.h>
#import <PromiseKit.h>

typedef NS_ENUM(NSInteger, MBTHTTPRequestMethod) {
    MBT_GET,
    MBT_POST,
    MBT_PUT,
    MBT_DELETE,
    MBT_HEAD,
    MBT_PATCH
};

@interface MBTHTTPRequest : NSObject

@property (assign, nonatomic) MBTHTTPRequestMethod method;
@property (copy, nonatomic) NSString *path;
@property (strong, nonatomic) NSDictionary *params;
@property (strong, nonatomic) Class modelClass;
@property (copy, nonatomic) NSString *jsonRootPath;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                       modelClass:(Class)modelClass;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                       modelClass:(Class)modelClass;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                          headers:(NSDictionary *)headers
                       modelClass:(Class)modelClass
                     jsonRootPath:(NSString *)jsonRootPath;

- (PMKPromise *)parseResponseObject:(id)responseObject;

@end
