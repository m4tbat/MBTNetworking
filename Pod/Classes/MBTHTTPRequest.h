//
//  MBTHTTPRequest.h
//  MBTNetworking
//
//  Created by Matteo Battaglio on 04/08/14.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLJSONAdapter.h>

typedef NS_ENUM(NSInteger, MBTHTTPRequestMethod) {
    GET,
    POST,
    PUT,
    DELETE
};

@interface MBTHTTPRequest : NSObject

@property (assign, nonatomic) MBTHTTPRequestMethod method;
@property (copy, nonatomic) NSString *path;
@property (strong, nonatomic) NSDictionary *params;

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params;

- (instancetype)initWithMethod:(MBTHTTPRequestMethod)method
                          path:(NSString *)path
                        params:(NSDictionary *)params;

- (Class)responseObjectClass;

- (id)parseResponseObject:(id)responseObject error:(NSError **)error;

@end
