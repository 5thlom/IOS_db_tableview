//
//  MasterViewController.m
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import "MasterViewController.h"
#import "SqlViewController.h"
#import "DetailViewController.h"
#import "ItemStore.h"
#import "Product.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}

@end


@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"Result Datas";
    
   // NSLog(@"val = %i",[[ItemStore sharedStore]getFlag]);
   if([[ItemStore sharedStore]getFlag]){
        DBAccess *dbAccess = [[DBAccess alloc] init];
        
        //  Get the products array from the database
        self.products = [dbAccess getAllProducts];
       if ([[ItemStore sharedStore]alernFlag]) {
           Product * p =[[Product alloc]init];
           p.name = @"ErrorSql";
           [self.products addObject:p];
       }
       [[[ItemStore sharedStore]reports]addObject:self.products];
       
        //  Close the database because we are finished with it
        [dbAccess closeDatabase];
       [[ItemStore sharedStore]setFlag:false];
    }
    
    NSLog(@"flag in masterview = %i",[[ItemStore sharedStore]alernFlag]);
    
    
    if ([[ItemStore sharedStore]alernFlag]) {
        [self showAlert];
        
        [[ItemStore sharedStore]setAlernFlag:false];
    }

 
    [self.tableView reloadData];
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
 //   self.navigationItem.rightBarButtonItem = addButton;
    
   // self.products = self.datas.products;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell.
    // Get the Product object
    Product* product = [self.products objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = product.name;//product.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Product *p = _products[indexPath.row];
        [_products removeObjectIdenticalTo:p];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    
    
    
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *dvc = [[DetailViewController alloc]init];
        dvc=[segue destinationViewController];

        dvc.detailItem = [self.products objectAtIndex:[indexPath row]];

        
    }
    
    if([[segue identifier] isEqualToString:@"new"]){
        SqlViewController *sqlvcm = [[SqlViewController alloc]init];
        sqlvcm = [segue destinationViewController];
        //self.flag = true;
        
    }
}



-(void)showAlert{
    NSString *mes = [NSString stringWithUTF8String:[[ItemStore sharedStore]getSqlstmt]];
    UIAlertView *message = [[UIAlertView alloc]initWithTitle:@"Error Openning DataBase with your Sql Statement: "
                                                     message:mes
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    
    [message show];
}


-(IBAction)toggleEditingMode:(id)sender{
    if ([self.tableView isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        [self.tableView setEditing:NO animated:YES];
        [sender setTitle:@"Edit"forState:UIControlStateNormal];
        NSLog(@"asfafa");
    }
    else {
        [sender setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.tableView setEditing:YES animated:YES];
    }}

-(IBAction)cancel:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];       }

@end
