//
//  ServiceManager.m
//  ListingDemoFelix
//
//  Created by Felix on 11/6/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "ServiceManager.h"
#import "AFNetworking.h"

static NSString * const baseURL = @"https://itunes.apple.com/";

@implementation ServiceManager

+ (id)sharedInstance {
    static ServiceManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

-(id)init
{
    self=[super init];
    if (self) {
        
    }
    return self;
}

-(void)searchAppStore:(NSString*)searchTerm completion:(ServiceCompletion)completion
{
    NSString *string = [NSString stringWithFormat:@"%@search?entity=software&term=%@", baseURL,[searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *result = (NSDictionary *)responseObject;

        completion(YES,result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
}

@end
