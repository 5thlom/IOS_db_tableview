//
//  MasterViewController.h
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "DBAccess.h"
#import "SqlViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray* products;
//@property (nonatomic)BOOL flag ;

-(void)showAlert;
-(IBAction)toggleEditingMode:(id)sender;
@end
