//
//  DBAccess.m
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//


#import "DBAccess.h"
#import "ItemStore.h"

@implementation DBAccess

// Reference to the SQLite database.
sqlite3* database;

-(id) init
{
    //  Call super init to invoke superclass initiation code
    if ((self = [super init]))
    {
        //  set the reference to the database
        [self initializeDatabase];
    }
    return self;
}

// Open the database connection
- (void)initializeDatabase {
    
    // Get the database from the application bundle.
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"ex2"
                      ofType:@"db"];
    
    // Open the database.
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)
    {
        NSLog(@"Opening Database");
    }
    else
    {
        // Call close to properly clean up
        sqlite3_close(database);
        NSAssert1(0, @"Failed to open database: ‘%s’.",
                  sqlite3_errmsg(database));
    }
}


-(void) closeDatabase
{
    // Close the database.
    if (sqlite3_close(database) != SQLITE_OK) {
        NSAssert1(0, @"Error: failed to close database: ‘%s’.",
                  sqlite3_errmsg(database));
    }
}

- (NSMutableArray*) getAllProducts
{
    //  The array of products that we will create
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    //  The SQL statement that we plan on executing against the database
   /* const char *sql = "SELECT product.ID,product.Name, \
    Manufacturer.name,product.details,product.price,\
    product.quantityonhand, country.country, \
    product.image FROM Product,Manufacturer, \
    Country where manufacturer.manufacturerid=product.manufacturerid \
    and product.countryoforiginid=country.countryid";
    */
    
    //const char *sql = "select * from lang";
    char*sql = [[ItemStore sharedStore]getSqlstmt];
    if (sql != nil) {
    
    //  The SQLite statement object that will hold our result set
    sqlite3_stmt *statement;
    
    // Prepare the statement to compile the SQL query into byte-code
    int sqlResult = sqlite3_prepare_v2(database, sql, -1, &statement, NULL);
    
    if ( sqlResult== SQLITE_OK) {
        // Step through the results - once for each row.
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //  allocate a Product object to add to products array
            Product  *product = [[Product alloc] init];
            // The second parameter is the column index (0 based) in
            // the result set.
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *year = (char *)sqlite3_column_text(statement, 3);
            char *details = (char *)sqlite3_column_text(statement, 2);
            char *works = (char *)sqlite3_column_text(statement, 4);
            //char *image = (char *)sqlite3_column_text(statement, 7);
            
            //  Set all the attributes of the product
            product.ID = sqlite3_column_int(statement, 0);
            product.name = (name) ? [NSString stringWithUTF8String:name] : @"";
            product.works = (works) ? [NSString stringWithUTF8String:works] : @"";
            product.details = (details) ? [NSString stringWithUTF8String:details] : @"";
            //product.price = sqlite3_column_double(statement, 4);
           
            product.years = (year) ? [NSString stringWithUTF8String:year] : @"";
            //product.image = (image) ? [NSString stringWithUTF8String:image] : @"";
            
            // Add the product to the products array
            [products addObject:product];
            
        }
        // finalize the statement to release its resources
        sqlite3_finalize(statement);
    }
    else {
        NSLog(@"Problem with the database:");
        NSLog(@"%d",sqlResult);
        [[ItemStore sharedStore]setAlernFlag:true];

    }
    }
    
    return products;
    
}
@end
