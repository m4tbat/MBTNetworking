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

+ (instancetype)requestWithMethod:(MBTHTTPRequestMethod)method
                             path:(NSString *)path
                           params:(NSDictionary *)params
                       modelClass:(Class)modelClass;

- (instancetype)initWithMethod:(MBTHTTPRequestMethod)method
                          path:(NSString *)path
                        params:(NSDictionary *)params
                    modelClass:(Class)modelClass;

- (id)parseResponseObject:(id)responseObject error:(NSError **)error;

@end
