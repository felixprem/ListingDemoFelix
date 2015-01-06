//
//  MainContentViewController.m
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "MainContentViewController.h"
#import "ServiceManager.h"
#import "DatabaseManager.h"

#import "IconsPanelTableViewController.h"
#import "SelectedDetailViewController.h"
#import "BottomMenuViewController.h"
#import "MBProgressHUD.h"
#import "Product.h"

@interface MainContentViewController ()<BottomMenuDelegate>
{
    IconsPanelTableViewController *iconsPanelVC;
    SelectedDetailViewController *selectedDetailVC;
    BottomMenuViewController *bottomMenuVC;
    NSArray *productsArray;
    NSInteger selectedTab;
}
@property (weak, nonatomic) IBOutlet UIView *iconsPanelView;
@property (weak, nonatomic) IBOutlet UIView *selectedDetailView;
@property (weak, nonatomic) IBOutlet UIView *bottomMenuView;

@end

@implementation MainContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    productsArray=[NSArray new];
    for (UIViewController* vc in self.childViewControllers) {
        if ([vc isKindOfClass:IconsPanelTableViewController.class]) {
            iconsPanelVC = (IconsPanelTableViewController*)vc;
        }
        else if ([vc isKindOfClass:SelectedDetailViewController.class]) {
            selectedDetailVC = (SelectedDetailViewController*)vc;
        }
        else if ([vc isKindOfClass:BottomMenuViewController.class]) {
            bottomMenuVC = (BottomMenuViewController*)vc;
            [bottomMenuVC.bottomMenuTabBar setSelectedItem:[bottomMenuVC.bottomMenuTabBar.items objectAtIndex:0]];
        }
    }
    [_selectedDetailView setHidden:YES];
    selectedDetailVC.icondPanelVC=iconsPanelVC;
    [selectedDetailVC setDelegateToIconPanel];
    bottomMenuVC.delegate=self;
    selectedTab=0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self reloadData];
}

-(void)reloadData
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    switch (selectedTab) {
        case 0:
            [self fetchAndShowItemsFromServer];
            break;
            
        case 1:
            [self fetchAndShowFavouriteItems];
            break;
            
        default:
            break;
    }
    
}

-(void)fetchAndShowFavouriteItems
{
    NSArray *favouritesArray = [[DatabaseManager sharedInstance] fetchAllRequest];
    if (productsArray!=nil) {
        productsArray=nil;
    }
    productsArray = [self getArrayOfProductsFromDB:favouritesArray];
    iconsPanelVC.productsArray=productsArray;
    [iconsPanelVC.tableView reloadData];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if ([productsArray count]) {
        [self showFirstProduct];
        [selectedDetailVC.favouriteButton setHidden:YES];
    }
}

-(void)fetchAndShowItemsFromServer
{
    [[ServiceManager sharedInstance] searchAppStore:_searchText completion:^(BOOL completionStatus, NSDictionary *responseDict) {
        if (productsArray!=nil) {
            productsArray=nil;
        }
        [_selectedDetailView setHidden:NO];
        productsArray = [self getArrayOfProductsFromDict:responseDict];
        iconsPanelVC.productsArray=productsArray;
        [iconsPanelVC.tableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        if ([productsArray count]) {
            [self showFirstProduct];
            [selectedDetailVC.favouriteButton setHidden:NO];
        }
    }];
}

-(NSArray*)getArrayOfProductsFromDict:(NSDictionary*)responseDict
{
    NSMutableArray *tempArray = [NSMutableArray new];
    for (NSDictionary *tempDict in [responseDict objectForKey:@"results"]) {
        ServiceProduct *refProduct = [ServiceProduct new];
        refProduct.trackName = [tempDict valueForKey:@"trackName"];
        refProduct.artworkUrl512 = [tempDict valueForKey:@"artworkUrl512"];
        refProduct.artworkUrl100 = [tempDict valueForKey:@"artworkUrl100"];
        refProduct.genres = [tempDict valueForKey:@"genres"];
        refProduct.screenshotUrls = [tempDict valueForKey:@"screenshotUrls"];
        refProduct.sellerName = [tempDict valueForKey:@"sellerName"];
        refProduct.price = [[tempDict valueForKey:@"price"] floatValue];
        refProduct.version = [tempDict valueForKey:@"version"];
        [tempArray addObject:refProduct];
    }
    
    return tempArray;
}

-(NSArray*)getArrayOfProductsFromDB:(NSArray*)dbArray
{
    NSMutableArray *tempArray = [NSMutableArray new];
    for (Product *tempProd in dbArray) {
        ServiceProduct *refProduct = [ServiceProduct new];
        refProduct.trackName = tempProd.trackName;
        refProduct.artworkUrl512 = tempProd.artworkUrl512;
        refProduct.artworkUrl100 = tempProd.artworkUrl100;
        refProduct.genres = tempProd.genres;
        refProduct.screenshotUrls = tempProd.screenshotUrls;
        refProduct.sellerName = tempProd.sellerName;
        refProduct.price = [tempProd.price floatValue];
        refProduct.version = tempProd.version;
        [tempArray addObject:refProduct];
    }
    
    return tempArray;
}

-(void)showFirstProduct
{
    [selectedDetailVC showProduct:[productsArray objectAtIndex:0]];
}

-(void)bottomMenuSelectedIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            selectedTab=index;
        }
            break;
        case 1:
        {
            selectedTab=index;
        }
            break;
            
        default:
            break;
    }
    [self reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
