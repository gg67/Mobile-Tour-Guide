//
//  LocationDetailController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/20/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "LocationDetailController.h"
#import <QuartzCore/QuartzCore.h>
#import "ImageViewController.h"

@implementation LocationDetailController
@synthesize photo;

@synthesize indexSel, currentLoc, delegate, selection;
@synthesize description, hours, addAgenda, alreadyOnAgenda;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    //The rounded corner part, where you specify your view's corner radius:
    description.layer.cornerRadius = 11;
    description.clipsToBounds = YES;
    description.layer.borderColor = [[UIColor grayColor] CGColor];
    description.layer.borderWidth = .5;
    
    self.currentLoc = [selection valueForKey:@"location"];

    // Set description text
    self.description.text = [currentLoc description];
    
    // Set the hours of operation
    NSString *newHours = @"Hours: ";
    self.hours.text = [newHours stringByAppendingString:currentLoc.hours];
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
    [self setPhoto:nil];
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

- (void)viewWillAppear:(BOOL)animated {
    self.photo.adjustsImageWhenHighlighted = NO;
    self.photo.layer.cornerRadius = 9;
    self.photo.clipsToBounds = YES;
    
    self.photo.layer.borderColor = [[UIColor grayColor] CGColor];
    self.photo.layer.borderWidth = .5;
    
    [photo setImage:[UIImage imageNamed:@"02-redo.png"] forState:UIControlStateNormal];
    
    NSData *imgUrl = [NSData dataWithContentsOfURL:[NSURL URLWithString:currentLoc.image]];
    [photo setImage:[UIImage imageWithData:imgUrl]
           forState:UIControlStateNormal];
    [photo setImage:[UIImage imageWithData:imgUrl]
           forState:UIControlStateHighlighted];
    
    // Check if onAgenda.
    if (currentLoc.onAgenda) {
        alreadyOnAgenda.hidden = NO;
        addAgenda.hidden = YES;
    }
    else {
        alreadyOnAgenda.hidden = YES;
        addAgenda.hidden = NO;
    }

    
    [super viewWillAppear:animated];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    
    ImageViewController *destination = segue.destinationViewController;
    destination.title = currentLoc.name;
    [destination setValue:currentLoc.image forKey:@"image"];
    
}


@end
