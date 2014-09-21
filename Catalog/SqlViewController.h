//
//  SqlViewController.h
//  Catalog
//
//  Created by Zhihua Yang on 8/30/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBAccess.h"
#import "MasterViewController.h"
@class MasterViewController;

@interface SqlViewController : UIViewController

@property (nonatomic,strong) NSString *sqlst;
@property (strong, nonatomic) IBOutlet UITextField* inputstr;
@property (strong, nonatomic) NSMutableArray* products;



-(IBAction)cancel:(id)sender;

@end
