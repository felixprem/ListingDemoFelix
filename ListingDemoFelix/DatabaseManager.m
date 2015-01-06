//
//  DatabaseManager.m
//  ListingDemoFelix
//
//  Created by Felix on 08/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "DatabaseManager.h"

@implementation DatabaseManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (id)sharedInstance {
    static DatabaseManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark- Core Data Init

- (NSManagedObjectContext *) managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"ListingDemoProducts.sqlite"]];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:[self managedObjectModel]];
    if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil URL:storeUrl options:nil error:&error]) {
        /*Error for store creation should be handled in here*/
    }
    
    return _persistentStoreCoordinator;
}

- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

#pragma mark - Project Specific Data

-(NSArray*)fetchAllRequest
{
    __block NSArray * results = nil;
    [self.managedObjectContext performBlockAndWait:^{
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
        NSError * error = nil;
        results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (error){
            NSLog(@"ERROR! %@", error);
        }
    }];
    
    return results;
}

-(void)removeAllData
{
    NSArray *allResponses = [self fetchAllRequest];
    if ([allResponses count]) {
        for (Product *requestObject in allResponses) {
            [self.managedObjectContext deleteObject:requestObject];
        }
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Couldn't Delete all: %@", [error localizedDescription]);
        }
        else{
            NSLog(@"Deleted All");
        }
    }
}

-(void)addProduct:(ServiceProduct*)product completion:(DataTransactionCompletion)completion
{
    Product *refProduct = [NSEntityDescription insertNewObjectForEntityForName:@"Product"
                                                                  inManagedObjectContext:self.managedObjectContext];
    
    refProduct.trackName=product.trackName;
    refProduct.artworkUrl512=product.artworkUrl512;
    refProduct.genres=product.genres;
    refProduct.screenshotUrls=product.screenshotUrls;
    refProduct.sellerName=product.sellerName;
    refProduct.version=product.version;
    refProduct.price=[NSNumber numberWithFloat:product.price];
    refProduct.artworkUrl100=product.artworkUrl100;

    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save: %@", [error localizedDescription]);
        completion(NO);
    }
    else{
        NSLog(@"Data Saved");
        completion(YES);
    }
}

@end

