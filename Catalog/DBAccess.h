//
//  DBAccess.h
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

// This includes the header for the SQLite library.
#import <sqlite3.h>
#import "Product.h"
#import "SqlViewController.h"

@interface DBAccess : NSObject



- (NSMutableArray*) getAllProducts;
- (void) closeDatabase;
- (void)initializeDatabase;

@end

