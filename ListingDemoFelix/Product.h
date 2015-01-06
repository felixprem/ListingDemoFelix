//
//  Product.h
//  ListingDemoFelix
//
//  Created by Go on 09/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * trackName;
@property (nonatomic, retain) NSString * artworkUrl512;
@property (nonatomic, retain) id genres;
@property (nonatomic, retain) id screenshotUrls;
@property (nonatomic, retain) NSString * sellerName;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * artworkUrl100;

@end
