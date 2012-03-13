//
//  PlacesViewController.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface PlacesViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *locations;
@property (strong, nonatomic) NSMutableArray *selection;
@property (strong, nonatomic) NSDictionary *editedSelection;
@property (strong, nonatomic) NSIndexPath *indexSel;
@property (strong, nonatomic) NSMutableArray *agenda;
@property (strong, nonatomic) NSString *name;
@property BOOL isSectioned;
@property (weak, nonatomic) IBOutlet UITextView *description;

@end
