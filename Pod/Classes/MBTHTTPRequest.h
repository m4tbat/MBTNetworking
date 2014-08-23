//
//  MBTHTTPRequest.h
//  metoo White Label
//
//  Created by Matteo Battaglio on 04/08/14.
//  Copyright (c) 2014 metoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLJSONAdapter.h>

typedef NS_ENUM(NSInteger, MBTHTTPRequestMethod) {
    GET,
    POST,
    PUT,
    DELETE
};

typedef void(^MBTHTTPResponseBlock)(NSURLSessionDataTask *task, id responseObject, NSError *error);

@interface MBTHTTPRequest : NSObject

@property (assign, nonatomic) MBTHTTPRequestMethod   method;
@property (copy, nonatomic) NSString                *path;
@property (strong, nonatomic) NSDictionary          *params;
@property (copy, nonatomic) MBTHTTPResponseBlock     responseBlock;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                    responseBlock:(MBTHTTPResponseBlock)responseBlock;

- (instancetype)initWithMethod:(MBTHTTPRequestMethod)method
                          path:(NSString *)path
                        params:(NSDictionary *)params
                 responseBlock:(MBTHTTPResponseBlock)responseBlock;

- (Class)responseObjectClass;

@end
