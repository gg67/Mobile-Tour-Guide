//
//  LocationDetailController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/20/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "LocationDetailController.h"

@implementation LocationDetailController

//@interface LocationDetailController
//
//@end

@synthesize aDescription, aVideo, anImage, anHours, indexSel, currentLoc, delegate, selection, description, hours, onAgenda, addAgenda, alreadyOnAgenda;

- (void)viewDidLoad {

    [super viewDidLoad];
    self.currentLoc = [selection valueForKey:@"location"];

    self.description.text = [currentLoc description];
    NSString *newHours = @"Hours: ";
    self.hours.text = [newHours stringByAppendingString:currentLoc.hours];
    self.aVideo = currentLoc.video;
    self.anImage = currentLoc.image;
    self.anHours = currentLoc.hours;
    
    if (onAgenda) {
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
    self.aDescription = nil;
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
                                                    message:[NSString stringWithFormat:@"This is currently a prototype. Full version coming soon!"]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (IBAction)audioAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh oh!"
                                                    message:[NSString stringWithFormat:@"This is currently a prototype. Full version coming soon!"]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)videoPressed:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:aVideo]];  
}

- (IBAction)addAgenda:(id)sender {
    onAgenda = YES;
    alreadyOnAgenda.hidden = NO;
    addAgenda.hidden = YES;
    currentLoc.onAgenda = onAgenda;
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
