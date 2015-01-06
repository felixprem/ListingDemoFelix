//
//  IconsPanelTableViewController.h
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceProduct.h"

@protocol IconPanelDelegate;
@interface IconsPanelTableViewController : UITableViewController
@property (weak) id<IconPanelDelegate> delegate;
@property (nonatomic,strong)NSArray *productsArray;
@end

/*
 Notifies when a product is selected and details are to be displayed
 */

@protocol IconPanelDelegate <NSObject>
@required
-(void)didSelectProduct:(ServiceProduct*)referenceProduct;
@end
