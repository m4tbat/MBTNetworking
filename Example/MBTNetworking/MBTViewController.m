//
//  MBTViewController.m
//  MBTNetworking
//
//  Created by Matteo Battaglio on 03/08/2015.
//  Copyright (c) 2014 Matteo Battaglio. All rights reserved.
//

#import "MBTViewController.h"

#import <MBTNetworkManager.h>
#import "MBTSampleRequests.h"
#import "MBTHTTPBinGetModel.h"
#import "MBTHTTPBinHeadersModel.h"

@interface MBTViewController ()

@end

@implementation MBTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MBTNetworkManager *manager = [[MBTNetworkManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://httpbin.org"]];
    
    [manager performRequest:[MBTSampleRequests get]].then(^(MBTHTTPBinGetModel *getModel, NSURLSessionTask *task) {
        NSLog(@"Origin: %@", getModel.origin);
        NSLog(@"User-Agent: %@", getModel.headers.userAgent);
        
        return [manager performRequest:[MBTSampleRequests headers]];
    }).then(^(MBTHTTPBinHeadersModel *headersModel, NSURLSessionTask *task) {
        NSLog(@"Headers: %@", headersModel);
    }).catch(^(NSError *error) {
        NSLog(@"Error: %@", error);
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
