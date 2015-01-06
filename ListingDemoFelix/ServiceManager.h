//
//  ServiceManager.h
//  ListingDemoFelix
//
//  Created by Felix on 11/6/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ServiceCompletion)(BOOL completionStatus, NSDictionary *responseDict);
@interface ServiceManager : NSObject
+ (id)sharedInstance;
-(void)searchAppStore:(NSString*)searchTerm completion:(ServiceCompletion)completion;
@end
