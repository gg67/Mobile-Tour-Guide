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
@property (strong, nonatomic) NSString *aName;
@property (strong, nonatomic) NSString *aImagePath;
@property (strong, nonatomic) NSString *aDescription;
@property (strong, nonatomic) NSString *aVideoPath;

@end

