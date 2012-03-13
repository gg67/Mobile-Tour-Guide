//
//  TourViewController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "TourViewController.h"
#import "PlacesViewController.h"

@implementation TourViewController
@synthesize tourList;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"View loaded");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
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


#pragma mark -
#pragma mark Table Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"sections pass");
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"rows pass");
    return [tourList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellforrowpass");
    NSString *identifier = @"LocationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    PlacesViewController *tour = [self.tourList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = tour.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    
    PlacesViewController *destination = segue.destinationViewController;
    
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        // prepare selection info
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        PlacesViewController *tour = [self.tourList objectAtIndex:indexPath.row];
        NSDictionary *selection;
        
        NSMutableArray *categories = [NSMutableArray arrayWithCapacity:6];
        
        for (size_t i = 0; i < 5; i++) {
            [categories addObject:[NSMutableArray arrayWithCapacity:6]];
        }
        
        for (size_t i = 0; i < (size_t)[tour.locations count]; i++) {
            if ([[tour.locations objectAtIndex:i] category] == @"Administrative") {
                [[categories objectAtIndex:0] addObject:[tour.locations objectAtIndex:i]];
            }
            if ([[tour.locations objectAtIndex:i] category] == @"Residence Hall") {
                [[categories objectAtIndex:1] addObject:[tour.locations objectAtIndex:i]];
            }
            if ([[tour.locations objectAtIndex:i] category] == @"Dining Hall") {
                [[categories objectAtIndex:2] addObject:[tour.locations objectAtIndex:i]];
            }
            if ([[tour.locations objectAtIndex:i] category] == @"Class Building") {
                [[categories objectAtIndex:3] addObject:[tour.locations objectAtIndex:i]];
            }
            if ([[tour.locations objectAtIndex:i] category] == @"Athletics / Recreation") {
                [[categories objectAtIndex:4] addObject:[tour.locations objectAtIndex:i]];
            }
        }
        
        selection = [NSDictionary dictionaryWithObjectsAndKeys:
                     indexPath, @"indexPath",
                     categories, @"location",
                     tour.agenda, @"agenda",
                     NO, @"isSectioned",
                     nil];
        
        [destination setValue:selection forKey:@"selection"];
        
        destination.title = tour.name;
    }
}


@end
