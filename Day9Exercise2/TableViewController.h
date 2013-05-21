//
//  TableViewController.h
//  Day9Exercise2
//
//  Created by Raul Huerta on 26/04/2013.
//  Copyright (c) 2013 Unbounded Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Movie.h"

@interface TableViewController : UITableViewController <ViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *movieArray;

@end
