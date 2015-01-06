//
//  IconsPanelTableViewController.m
//  ListingDemoFelix
//
//  Created by Felix on 11/5/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "IconsPanelTableViewController.h"
#import "UIImageView+AFNetworking.h"
#import "IconPanelTableViewCell.h"

@interface IconsPanelTableViewController ()

@end

@implementation IconsPanelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_productsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IconPanelTableViewCell *cell = (IconPanelTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"iconPanelCell" forIndexPath:indexPath];
    
    NSURL *imageUrl = [NSURL URLWithString:[[_productsArray objectAtIndex:indexPath.row] valueForKey:@"artworkUrl100"]];
    [cell.iconImageView setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"loading"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectProduct:)]) {
        
        ServiceProduct *refProduct = [ServiceProduct new];
        refProduct.trackName = [[_productsArray objectAtIndex:indexPath.row] valueForKey:@"trackName"];
        refProduct.artworkUrl512 = [[_productsArray objectAtIndex:indexPath.row] valueForKey:@"artworkUrl512"];
        refProduct.genres = [[_productsArray objectAtIndex:indexPath.row] valueForKey:@"genres"];
        refProduct.screenshotUrls = [[_productsArray objectAtIndex:indexPath.row] valueForKey:@"screenshotUrls"];
        refProduct.sellerName = [[_productsArray objectAtIndex:indexPath.row] valueForKey:@"sellerName"];
        refProduct.price = [[[_productsArray objectAtIndex:indexPath.row] valueForKey:@"price"] floatValue];
        
        [self.delegate didSelectProduct:refProduct];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
