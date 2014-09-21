//
//  Product.h
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject {
    int ID;
    NSString* name;
    NSString* works;
    NSString* details;
    NSString* years;
    //float price;
    //int quantity;
    //NSString* countryOfOrigin;
    //NSString* image;
}

@property (nonatomic) int ID;
@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *details;

@property (strong, nonatomic) NSString *works;

@property (strong, nonatomic) NSString *years;




@end
