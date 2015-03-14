# MBTNetworking

[![Version](https://img.shields.io/cocoapods/v/MBTNetworking.svg?style=flat)](http://cocoadocs.org/docsets/MBTNetworking)
[![License](https://img.shields.io/cocoapods/l/MBTNetworking.svg?style=flat)](http://cocoadocs.org/docsets/MBTNetworking)
[![Platform](https://img.shields.io/cocoapods/p/MBTNetworking.svg?style=flat)](http://cocoadocs.org/docsets/MBTNetworking)

## Usage

Here's an excerpt from the super-minimal example project which demonstrates instantiating the manager pointing to http://httpbin.org, performing two sequential requests to get some data, and consuming the parsed response objects:

```Objective-C
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
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MBTNetworking is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "MBTNetworking"

## Author

Matteo Battaglio, http://twitter.com/@m4dbat

## License

MBTNetworking is available under the MIT license. See the LICENSE file for more info.

