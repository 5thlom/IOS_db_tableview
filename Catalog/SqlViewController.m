//
//  SqlViewController.m
//  Catalog
//
//  Created by Zhihua Yang on 8/30/14.
//  Copyright (c) 2014 Zhihua Yang. All rights reserved.
//

#import "SqlViewController.h"
#import "MasterViewController.h"
#import "ItemStore.h"

@interface SqlViewController ()

@end

@implementation SqlViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    
    return self;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"Result Datas";
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[ItemStore sharedStore]setFlag:true]; NSLog(@"val = %i",[[ItemStore sharedStore]getFlag]);
    [[ItemStore sharedStore]setSqlstmt:[self.inputstr.text UTF8String]];
    //self.colorDescription.color = self.view.backgroundColor;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
  
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)cancel:(id)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];       }
/*
 
 
 - (IBAction)dismiss:(id)sender
 {
 [self.presentingViewController dismissViewControllerAnimated:YES
 completion:NULL];
 }
 
 
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
