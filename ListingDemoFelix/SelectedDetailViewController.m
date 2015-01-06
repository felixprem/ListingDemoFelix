//
//  SelectedDetailViewController.m
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "SelectedDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Product.h"
#import "ServiceProduct.h"
#import "DatabaseManager.h"

@interface SelectedDetailViewController ()<IconPanelDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *portfolioImageView;
@property (strong, nonatomic) IBOutlet UILabel *appTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *appSellerLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) ServiceProduct *serviceProduct;

- (IBAction)addToFavouritesClicked:(id)sender;
@end

@implementation SelectedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray-pattern"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didSelectProduct:(ServiceProduct *)referenceProduct
{
    [self showProduct:referenceProduct];
}

-(void)showProduct:(ServiceProduct *)referenceProduct

{
    _serviceProduct=referenceProduct;
    [_portfolioImageView setImageWithURL:[NSURL URLWithString:referenceProduct.artworkUrl512] placeholderImage:[UIImage imageNamed:@"loading"]];
    [_appTitleLabel setText:referenceProduct.trackName];
    [_appSellerLabel setText:referenceProduct.sellerName];
    if ([referenceProduct.genres objectAtIndex:0]) {
        [_categoryLabel setText:([referenceProduct.genres objectAtIndex:0])];
    }
    [_priceLabel setText:[NSString stringWithFormat:@"$ %.2f",referenceProduct.price]];

}

-(void)setDelegateToIconPanel
{
    _icondPanelVC.delegate=self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addToFavouritesClicked:(id)sender {
    
    [[DatabaseManager sharedInstance] addProduct:_serviceProduct completion:^(BOOL completionStatus) {
        if (completionStatus) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Produce added to favourites" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
            
        }
    }];
}

@end

/*
 product.trackName;
 product.artworkUrl512;
 product.genres;
 product.screenshotUrls;
 product.sellerName;
 product.version;
 product.price;
 product.artworkUrl100;
 */
