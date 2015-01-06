//
//  BottomMenuViewController.h
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomMenuDelegate;
@interface BottomMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITabBar *bottomMenuTabBar;

@property(weak)id<BottomMenuDelegate> delegate;
@end

/*
 Notifies when tab selection changes
 */

@protocol BottomMenuDelegate <NSObject>

-(void)bottomMenuSelectedIndex:(NSInteger)index;

@end
