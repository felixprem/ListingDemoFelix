//
//  BottomMenuViewController.m
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "BottomMenuViewController.h"

@interface BottomMenuViewController ()<UITabBarDelegate>

@end

@implementation BottomMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(bottomMenuSelectedIndex:)]) {
        [self.delegate bottomMenuSelectedIndex:item.tag%100];
    }
}

@end
