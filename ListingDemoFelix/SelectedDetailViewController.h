//
//  SelectedDetailViewController.h
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconsPanelTableViewController.h"
@interface SelectedDetailViewController : UIViewController
@property (nonatomic, strong)IconsPanelTableViewController *icondPanelVC;
@property (weak, nonatomic) IBOutlet UIButton *favouriteButton;
-(void)setDelegateToIconPanel;
-(void)showProduct:(ServiceProduct *)referenceProduct;
@end
