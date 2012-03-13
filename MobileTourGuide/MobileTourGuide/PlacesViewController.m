//
//  PlacesViewController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "PlacesViewController.h"
#import "Location.h"
#import "LocationDetailController.h"
#import <QuartzCore/QuartzCore.h>

@implementation PlacesViewController
@synthesize description;

@synthesize locations, editedSelection, indexSel, agenda, name, selection, isSectioned;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    if ([selection valueForKey:@"location"] != nil) {
        locations = [selection valueForKey:@"location"];
        agenda = [selection valueForKey:@"agenda"];
        isSectioned = (BOOL)[selection valueForKey:@"isSectioned"];
    }
    
    if (!isSectioned) {
        //The rounded corner part, where you specify your view's corner radius:
        description.layer.cornerRadius = 11;
        description.clipsToBounds = YES;
        description.layer.borderColor = [[UIColor grayColor] CGColor];
        description.layer.borderWidth = .5;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDescription:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"view reloaded");
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
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

#pragma mark - Table Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (isSectioned) {
        return [locations count];
    }
    else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (isSectioned) {
        return [[locations objectAtIndex:section] count];
    }
    else {
        size_t count = 0;
        for (size_t i = 0; i < (size_t)[locations count]; i++) {
            for (size_t j = 0; j < (size_t)[[locations objectAtIndex:i] count]; j++) {
                count++;
            }
        }
        return count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (isSectioned) {
        if (section == 0)
            return @"Administrative";
        if (section == 1)
            return @"Residence Hall";
        if (section == 2)
            return @"Dining Hall";
        if (section == 3)
            return @"Class Building";
        if (section == 4)
            return @"Athletics / Recreation";
        else
            return @"Wait, wtf did you do?";
    }
    else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"LocationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    Location *location;
    if (isSectioned) {
        NSMutableArray *category = [locations objectAtIndex:[indexPath section]];
        location = [category objectAtIndex:[indexPath row]];
    }
    else {
        size_t selLoc = 0;
        for (size_t i = 0; i < (size_t)[locations count]; i++) {
            for (size_t j = 0; j < (size_t)[[locations objectAtIndex:i] count]; j++) {
                if (selLoc == indexPath.row) {
                    location = [[locations objectAtIndex:i] objectAtIndex:j];
                }
                selLoc++;
            }
        }
    }
    
    cell.textLabel.text = [location name];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Light" size:12];
	//cell.detailTextLabel.text = location.category;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (IBAction)redAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh oh!"
                                                    message:[NSString stringWithFormat:@"This is currently a simulated prototype. This button would activate Check In functionality!"]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    
    LocationDetailController *destination = segue.destinationViewController;
    
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        // prepare selection info
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        
        Location *location;
        if (isSectioned) {
            NSMutableArray *category = [locations objectAtIndex:[indexPath section]];
            location = [category objectAtIndex:[indexPath row]];
        }
        else {
            size_t currentLoc = 0;
            for (size_t i = 0; i < (size_t)[locations count]; i++) {
                for (size_t j = 0; j < (size_t)[[locations objectAtIndex:i] count]; j++) {
                    if (currentLoc == indexPath.row) {
                        location = [[locations objectAtIndex:i] objectAtIndex:j];
                    }
                    currentLoc++;
                }
            }
        }
        
        NSDictionary *newSelection;
        
        newSelection = [NSDictionary dictionaryWithObjectsAndKeys:
                     indexPath, @"indexPath",
                     location, @"location",
                     agenda, @"agenda",
                     nil];
        
        [destination setValue:newSelection forKey:@"selection"];
        
        destination.title = location.name;
    }
}

@end
