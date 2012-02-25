//
//  AgendaViewController.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface AgendaViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *locations;

@property (strong, nonatomic) NSDictionary *editedSelection;

@property (strong, nonatomic) Location *myLoc;

@property BOOL haveVisited;

@property (strong, nonatomic) NSIndexPath *indexSel;

@end

