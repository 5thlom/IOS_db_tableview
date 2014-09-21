//
//  DetailViewController.m
//  Catalog
//
//  Created by Zhihua Yang on 8/14/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        Product* theProduct = (Product*) self.detailItem;
        
        //  Set the text of the labels to the values passed in the Product object
        [self.nameLabel setText:theProduct.name];
        [self.detailsLabel setText:theProduct.details];
        [self.yearLabel setText:theProduct.years];
        [self.workLabbel setText:theProduct.works];
        
        //[self.manufacturerLabel setText:theProduct.manufacturer];
        //[self.detailsLabel setText:theProduct.details];
        //[self.priceLabel setText:[NSString stringWithFormat:@"%.2f",theProduct.price]];
        //[self.quantityLabel setText:[NSString stringWithFormat:@"%d",
        //                             theProduct.quantity]];
        //[self.countryLabel setText:theProduct.countryOfOrigin];

        //self.detailDescriptionLabel.text = @"wtf";
        
        //[self.detailDescriptionLabel setText:theProduct.manufacturer];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Details";
    [self.workLabbel sizeToFit];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
