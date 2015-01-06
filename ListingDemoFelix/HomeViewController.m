//
//  HomeViewController.m
//  ListingDemoFelix
//
//  Created by Felix on 11/4/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "HomeViewController.h"
#import "MainContentViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"mainSegue"]){
        MainContentViewController *mainVC = (MainContentViewController *)[segue destinationViewController];
        if ([_searchTextField.text length]) {
            mainVC.searchText=_searchTextField.text;
        }
        else{
            mainVC.searchText=@"games";//default
        }
        
    }
}


@end
