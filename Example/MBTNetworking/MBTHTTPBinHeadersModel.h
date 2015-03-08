//
//  MBTHTTPBinHeadersModel.h
//  MBTNetworking
//
//  Created by Matteo Battaglio on 08/03/15.
//  Copyright (c) 2015 Matteo Battaglio. All rights reserved.
//

#import "MBTModel.h"

@interface MBTHTTPBinHeadersModel : MBTModel

@property (nonatomic, strong) NSString *accept;
@property (nonatomic, strong) NSString *acceptEncoding;
@property (nonatomic, strong) NSString *acceptLanguage;
@property (nonatomic, strong) NSString *cookie;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *referer;
@property (nonatomic, strong) NSString *userAgent;

@end

