//
//  AgendaViewController.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "AgendaViewController.h"
#import "LocationDetailController.h"
#import "Location.h"


@implementation AgendaViewController
@synthesize locations, aName, aImagePath, aDescription, aVideoPath, indexSel;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self.tableView reloadData];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    self.locations = nil;
    self.aName = nil;
    self.aImagePath = nil;
    self.aDescription = nil;
    self.aVideoPath = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.locations count];
}

#pragma mark -
#pragma mark Table Data Source Methods


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *identifier = @"LocationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    Location *location = [self.locations objectAtIndex:indexPath.row];
    cell.textLabel.text = location.name;
	cell.detailTextLabel.text = location.category;
    
//    aName = [[NSString alloc] initWithString:[[locations valueForKey:@"name"] objectAtIndex:indexSel.row]];
//    aImagePath = [[NSString alloc] initWithString:[[locations valueForKey:@"image"] objectAtIndex:indexSel.row]];
//    aDescription = [[NSString alloc] initWithString:[[locations valueForKey:@"description"] objectAtIndex:indexSel.row]];
//    aVideoPath = [[NSString alloc] initWithString:[[locations valueForKey:@"video"] objectAtIndex:indexSel.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.locations removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}   
}

#pragma mark -
#pragma mark Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    
    LocationDetailController *destination = segue.destinationViewController;
    
    destination.title = aName;
    destination.description = aDescription;
    
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        // prepare selection info
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        id object = [self.locations objectAtIndex:indexPath.row];
        NSDictionary *selection = [NSDictionary dictionaryWithObjectsAndKeys:
                                   indexPath, @"indexPath",
                                   object, @"object",
                                   nil];
        [destination setValue:selection forKey:@"selection"];
    }
    
}


@end
