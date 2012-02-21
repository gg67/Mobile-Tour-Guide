//
//  LocationDetailController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/20/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "LocationDetailController.h"

@implementation LocationDetailController

@synthesize label = _label;
@synthesize message = _message;

- (void)viewWillAppear:(BOOL)animated {
    _label.text = _message;
    [super viewWillAppear:animated];
}

- (void)viewDidUnload {
    self.label = nil;
    self.message = nil;
    [super viewDidUnload];
}

@end
