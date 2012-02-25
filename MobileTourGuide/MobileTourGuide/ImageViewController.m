//
//  ImageViewController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/25/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController

@synthesize image;
@synthesize display;

- (void)viewDidLoad {
    display.image = [UIImage imageWithContentsOfFile:@"/Users/Scott/Documents/School/Vanderbilt/Sophomore/2nd Semester/HCI/Mobile-Tour-Guide/MobileTourGuide/MobileTourGuide/Fall-Day-300x300.png"];
    
    NSData *imgUrl = [NSData dataWithContentsOfURL:[NSURL URLWithString:image]];
    display.image = [UIImage imageWithData:imgUrl];
}

- (void)viewDidUnload {
    [self setDisplay:nil];
    [super viewDidUnload];
}
@end
