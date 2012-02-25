//
//  LocationDetailController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/20/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "LocationDetailController.h"
#import <QuartzCore/QuartzCore.h>

@implementation LocationDetailController

@synthesize indexSel, currentLoc, delegate, selection;
@synthesize description, hours, addAgenda, alreadyOnAgenda;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    //The rounded corner part, where you specify your view's corner radius:
    description.layer.cornerRadius = 9;
    description.clipsToBounds = YES;
    description.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.currentLoc = [selection valueForKey:@"location"];

    // Set description text
    self.description.text = [currentLoc description];
    
    // Set the hours of operation
    NSString *newHours = @"Hours: ";
    self.hours.text = [newHours stringByAppendingString:currentLoc.hours];
    
    // Check if onAgenda.
    if (currentLoc.onAgenda) {
        alreadyOnAgenda.hidden = NO;
        addAgenda.hidden = YES;
    }
    else {
        alreadyOnAgenda.hidden = YES;
        addAgenda.hidden = NO;
    }
    
    //[[self view] setBackgroundColor:[UIColor yellowColor]];
    //colorWithPatternImage:[UIImage imageNamed:@"/Users/Scott/Downloads/linen.jpg"]
}

- (void)viewDidUnload {
    self.title = nil;
    self.indexSel = nil;
    self.currentLoc = nil;
    self.delegate = nil;
    self.selection = nil;
    self.description = nil;
    self.hours = nil;
    self.addAgenda = nil;
    self.alreadyOnAgenda = nil;
    //self.myImage = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (IBAction)redAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh oh!"
                                                    message:[NSString stringWithFormat:@"This is currently a simulated prototype. This button would activate Check In functionality."]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (IBAction)audioAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh oh!"
                                                    message:[NSString stringWithFormat:@"This is currently a simulated prototype. This button would start an audio version of the tour script."]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)videoPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentLoc.video]];  
}

- (IBAction)addAgenda:(id)sender {
    NSMutableArray *agenda = [selection valueForKey:@"agenda"];
    alreadyOnAgenda.hidden = NO;
    addAgenda.hidden = YES;
    currentLoc.onAgenda = YES;
    NSLog(@"added");
    [agenda addObject:currentLoc];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    // prepare selection info
    NSIndexPath *indexPath = [selection objectForKey:@"indexPath"];
    NSDictionary *editedSelection = [NSDictionary dictionaryWithObjectsAndKeys:
                                     indexPath, @"indexPath",
                                     currentLoc, @"location",
                                     nil];
    [delegate setValue:editedSelection forKey:@"editedSelection"];
    [delegate setValue:currentLoc forKey:@"myLoc"];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
