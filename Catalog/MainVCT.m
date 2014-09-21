//
//  MainVCT.m
//  Catalog
//
//  Created by Zhihua Yang on 9/15/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import "MainVCT.h"
#import "MasterViewController.h"
#import "ItemStore.h"

@interface MainVCT ()

@end

@implementation MainVCT


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"Reports";
  

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[ItemStore sharedStore]reports]count];//1;//[self.reports count];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell.
    // Get the Product object
    NSMutableArray* product = [[[ItemStore sharedStore]reports] objectAtIndex:[indexPath row]];
    Product * p = [product objectAtIndex:0];
    
    if ([p.name isEqualToString:@"NULL"]) {
        cell.textLabel.text = @"Create Report";//[[[ItemStore sharedStore]reports] objectAtIndex:[indexPath row]];

    }else{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/mm/yyyy hh:mm"];
        NSDate *now = [NSDate date];
        NSString *formattedDate = [formatter stringFromDate:now];
        cell.textLabel.text = [NSString stringWithFormat:@"Report: %@",formattedDate];

    }
    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"dive"]) {
        
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MasterViewController *nvc = [[MasterViewController alloc]init];
        
        nvc=[segue destinationViewController];
        NSLog(@"im here   ,%@",indexPath);
        nvc.products = [[[ItemStore sharedStore]reports] objectAtIndex:[indexPath row]];
        
        /*
         NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         DetailViewController *dvc = [[DetailViewController alloc]init];
         dvc=[segue destinationViewController];
         
         dvc.detailItem = [self.products objectAtIndex:[indexPath row]];

         */
        
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
