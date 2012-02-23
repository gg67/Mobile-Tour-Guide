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
@synthesize locations, aName, aCategory, aDescription, aVideo, anImage, anHours, indexSel, editedSelection;

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
//    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
//                                                                   style:UIBarButtonItemStyleBordered 
//                                                                  target:self
//                                                                  action:@selector(toggleMove)];
//    self.navigationItem.leftBarButtonItem = moveButton;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    self.locations = nil;
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
    location.onAgenda = YES;
    
    cell.textLabel.text = location.name;
	cell.detailTextLabel.text = location.category;
    
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

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSUInteger fromRow = [fromIndexPath row];
    NSUInteger toRow = [toIndexPath row];
    id object = [locations objectAtIndex:fromRow];
    [locations removeObjectAtIndex:fromRow];
    [locations insertObject:object atIndex:toRow];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (IBAction)redAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh oh!"
                                                    message:[NSString stringWithFormat:@"This is currently a prototype. Full version coming soon!"]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

#pragma mark -
#pragma mark Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (IBAction)toggleMove {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing) {
        [self.navigationItem.leftBarButtonItem setTitle:@"Done"];
    }
    else {
        [self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
    
    LocationDetailController *destination = segue.destinationViewController;
    
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        // prepare selection info
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        Location *loc = [self.locations objectAtIndex:indexPath.row];
        NSDictionary *selection;
        if (editedSelection == nil) {
            selection = [NSDictionary dictionaryWithObjectsAndKeys:
                                       indexPath, @"indexPath",
                                       loc, @"location",
                                       nil];
        }
        else {
            selection = editedSelection;
        }
       
        [destination setValue:selection forKey:@"selection"];
        
        destination.title = loc.name;
    }
    
}


@end
