//
//  MBTModel.h
//  metoo White Label
//
//  Created by Matteo Battaglio on 06/08/14.
//  Copyright (c) 2014 metoo. All rights reserved.
//

#import <Mantle.h>

#define selStr(sel) NSStringFromSelector(@selector(sel))

@interface MBTModel : MTLModel <MTLJSONSerializing>

@end
