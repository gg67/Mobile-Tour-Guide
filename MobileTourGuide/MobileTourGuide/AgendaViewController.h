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

@property (retain, nonatomic) NSMutableArray *locations;
@property (retain, nonatomic) NSString *aName;
@property (retain, nonatomic) NSString *aImagePath;
@property (retain, nonatomic) NSString *aDescription;
@property (retain, nonatomic) NSString *aVideoPath;
@property (retain, nonatomic) NSIndexPath *indexSel;

@end

