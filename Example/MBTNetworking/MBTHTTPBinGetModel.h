//
//  MBTHTTPBinGetModel.h
//  MBTNetworking
//
//  Created by Matteo Battaglio on 08/03/15.
//  Copyright (c) 2015 Matteo Battaglio. All rights reserved.
//

#import "MBTModel.h"

@class MBTHTTPBinHeadersModel;

@interface MBTHTTPBinGetModel : MBTModel

@property (nonatomic, strong) NSDictionary *args;
@property (nonatomic, strong) MBTHTTPBinHeadersModel *headers;
@property (nonatomic, strong) NSString *origin;
@property (nonatomic, strong) NSURL *url;

@end
