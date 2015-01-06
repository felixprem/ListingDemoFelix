//
//  MainContentViewController.h
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

/*
 Base layout holding three view controllers
 Bottom Menu - Tab bar
 Icons Panel - List of Apps - Icons view
 Selected Detail View - Shows details of selected App
 */

#import <UIKit/UIKit.h>

@interface MainContentViewController : UIViewController
@property(nonatomic,strong)NSString *searchText;
@end
