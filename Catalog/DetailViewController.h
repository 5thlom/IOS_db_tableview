//
//  DetailViewController.h
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView* nameLabel;
@property (strong, nonatomic) IBOutlet UITextView* detailsLabel;
@property (strong, nonatomic) IBOutlet UITextView* workLabbel;
@property (strong, nonatomic) IBOutlet UITextView* yearLabel;

@property (strong, nonatomic) id detailItem;



@end
