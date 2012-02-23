//
//  LocationDetailController.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/20/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface LocationDetailController : UIViewController

@property (strong, nonatomic) NSString *aDescription;
@property (strong, nonatomic) NSString *aVideo;
@property (strong, nonatomic) NSString *anImage;
@property (strong, nonatomic) NSString *anHours;

@property (strong, nonatomic) NSIndexPath *indexSel;
@property (strong, nonatomic) Location *currentLoc;

@property (strong, nonatomic) IBOutlet UITextView *description;
@property (strong, nonatomic) IBOutlet UILabel *hours;

@property BOOL onAgenda;

@property (strong, nonatomic) IBOutlet UIButton *addAgenda;
@property (strong, nonatomic) IBOutlet UILabel *alreadyOnAgenda;

@property (copy, nonatomic) NSDictionary *selection;
@property (weak, nonatomic) id delegate;

@end
