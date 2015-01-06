//
//  ServiceProduct.h
//  ListingDemoFelix
//
//  Created by Go on 09/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceProduct : NSObject
@property (nonatomic, retain) NSString * trackName;
@property (nonatomic, retain) NSString * artworkUrl512;
@property (nonatomic, retain) NSArray *genres;
@property (nonatomic, retain) NSArray *screenshotUrls;
@property (nonatomic, retain) NSString * sellerName;
@property (nonatomic, retain) NSString * version;
@property (assign) float price;
@property (nonatomic, retain) NSString * artworkUrl100;
@end

