//
//  DatabaseManager.h
//  ListingDemoFelix
//
//  Created by Felix on 08/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Product.h"
#import "ServiceProduct.h"

typedef void (^DataTransactionCompletion)(BOOL completionStatus);

@interface DatabaseManager : NSObject
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

+(DatabaseManager*)sharedInstance;

-(NSArray*)fetchAllRequest;
-(void)removeAllData;
-(void)addProduct:(ServiceProduct*)product completion:(DataTransactionCompletion)completion;

@end
