//
//  GuideAppDelegate.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "GuideAppDelegate.h"
#import "AgendaViewController.h"
#import "PlacesViewController.h"
#import "TourViewController.h"
#import "Location.h"

@implementation GuideAppDelegate 

@synthesize locations;
@synthesize agenda;
@synthesize tours;
@synthesize categories;
@synthesize navController;
@synthesize window = _window;

#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    AgendaViewController *agenda = [[AgendaViewController alloc] initWithStyle:UITableViewStylePlain];
//    self.navController = [[UINavigationController alloc] initWithRootViewController:agenda];
//    [self.window addSubview:navController.view];
    
    agenda = [NSMutableArray arrayWithCapacity:3];
    locations = [NSMutableArray arrayWithCapacity:6];
    categories = [NSMutableArray arrayWithCapacity:5];
    tours = [NSMutableArray arrayWithCapacity:3];
    Location *location1 = [[Location alloc] init];
    Location *location2 = [[Location alloc] init];
    Location *location3 = [[Location alloc] init];
    Location *location4 = [[Location alloc] init];
    Location *location5 = [[Location alloc] init];
    Location *location6 = [[Location alloc] init];
    
    location1.name = @"Admissions";
    location2.name = @"Kissam Quad";
    location3.name = @"Rand Hall";
    location4.name = @"Featheringill Hall";
    location5.name = @"Rec Center";
    location6.name = @"Commons Center";
    
    location1.category = @"Administrative";
    location2.category = @"Residence Hall";
    location3.category = @"Dining Hall";
    location4.category = @"Class Building";
    location5.category = @"Athletics / Recreation";
    location6.category = @"Dining Hall";
    
    location1.description = @"This 1993 addition to campus incorporates a portion of old West Side Hall, the university's first dining facility. Thousands of prospective students begin their Vanderbilt journeys with a tour of the campus which begins from this point. Nearly 20,000 applications to the university's first-year class of 1,650 are received and reviewed at this location.";
    
    location2.description = @"Almost every Vanderbilt student has heard rumors regarding Kissam Quadrangle, the residential area on the corner of 21st and West End. Whether it is that a homeless man has begun to live in Kissam or that they shampoo the carpets weekly in order to keep them clean, it is more than likely most Vanderbilt students view Kissam in a negative light.\n\nThe six existing Kissam Quadrangle buildings, located near the intersection of West End Avenue and 21st Avenue South, will be demolished to make way for the two colleges that will be connected by a shared facility providing gathering space, “grab-and-go” dining options, a classroom, offices and meeting rooms.";
    
    location3.description = @"Sarratt Student Center and the adjoining Rand Hall are light and bright and humming with activity. With assorted dining options, the Vanderbilt Bookstore, the popular Baseball Glove Lounge for studying, art studios, art gallery, cinema, post office, meeting rooms, and offices, Sarratt and Rand pulse with the heartbeat of Vanderbilt.";
    
    location4.description = @"A distinctive tower marks the entrance of Featheringill Hall, one of four buildings housing the Vanderbilt School of Engineering. Inside, Featheringill features a three-story atrium, which serves as a focal for student interaction and social events, more than 50 teaching and research laboratories with the latest equpment and computer resources, and project rooms.";
    
    location5.description = @"It is the mission of the Office of Campus Recreation to assist in the development and education of the whole person. The Office achieves this goal by providing comprehensive fitness, recreation, and wellness programs in a state of the art facility to the diverse population of students and the Vanderbilt community at large. The wide variety of programs provide opportunities to develop the individual's positive self-esteem, relationships with others, and effective communication and leadership skills. The Student Recreation Center additionally serves as an avenue for individuals to achieve a stress free, holistic approach to a healthy lifestyle.";
    
    location6.description = @"The Commons Center is the community crossroads of the Commons living learning community. It has it all: the Dining Hall and great food; a living room with a concert grade grand piano, and the occasional live musical performance; a small rec room with cardio equipment, free weights, and weight machines; meeting and study rooms; and academic support services like the Writing Studio and the CASPAR premajor advising center.\n\nStudents from across campus come here for a meal, a quiet place to study, an event, or a meeting with a professor. The third floor of the Commons Center is the home of the Department of Political Science, the Center for the Study of Democratic Institutions, the Latin American Public Opinion Project, and the Research on Individuals, Politics, and Society Lab.";
    
    location1.image = @"http://www.unionky.edu/Images/Photos/Events/2007/Alumni_Gatherings/NKY_Nashville/BlairSkidmore.jpg";
    location2.image = @"http://admissions.vanderbilt.edu/insidedores/manage/wp-content/uploads/Fall-Day-300x300.jpg";
    location3.image = @"https://img-s.foursquare.com/derived_pix/KV3D3IMOOUYZBQA4PUKK224FCF0XKV0JS4RI3FVCEN5DZABR_300x300.jpg";
    location4.image = @"http://www.vanderbilt.edu/studentcenters/wp-content/uploads/FEA138.jpg?quick_view=1";
    location5.image = @"http://farm3.staticflickr.com/2528/4026583256_453db1129d_o.jpg";
    location6.image = @"http://commons.vanderbilt.edu/images/dininghall.jpg";

    location1.video = @"http://www.youtube.com/watch?v=p0IoNXrtNGY";
    location2.video = @"http://www.youtube.com/";
    location3.video = @"http://www.youtube.com/watch?v=U5b8cymDlT4";
    location4.video = @"http://www.youtube.com/watch?v=4JZQ4qgYvEY";
    location5.video = @"http://www.youtube.com/watch?v=1wuxnc-yBK0";
    location6.video = @"http://www.youtube.com/";
    
    location1.hours = @"10 AM to 5 PM Mon - Sat";
    location2.hours = @"8 AM to 8 PM every day";
    location3.hours = @"7 AM to 12 PM weekdays";
    location4.hours = @"9 AM to 5 PM every day";
    location5.hours = @"5:30 AM to 11 PM every day";
    location6.hours = @"7 AM to 12 PM weekdays";
    
    [locations addObject:location1];
    [locations addObject:location2];
    [locations addObject:location3];
    [locations addObject:location4];
    [locations addObject:location5];
    [locations addObject:location6];
    
    [agenda addObject:location1];
    [agenda addObject:location2];
    [agenda addObject:location3];
    
    for (size_t i = 0; i < 5; i++) {
        [categories addObject:[NSMutableArray arrayWithCapacity:6]];
    }
    
    for (size_t i = 0; i < (size_t)[locations count]; i++) {
        if ([[locations objectAtIndex:i] category] == @"Administrative") {
            [[categories objectAtIndex:0] addObject:[locations objectAtIndex:i]];
        }
        if ([[locations objectAtIndex:i] category] == @"Residence Hall") {
            [[categories objectAtIndex:1] addObject:[locations objectAtIndex:i]];
        }
        if ([[locations objectAtIndex:i] category] == @"Dining Hall") {
            [[categories objectAtIndex:2] addObject:[locations objectAtIndex:i]];
        }
        if ([[locations objectAtIndex:i] category] == @"Class Building") {
            [[categories objectAtIndex:3] addObject:[locations objectAtIndex:i]];
        }
        if ([[locations objectAtIndex:i] category] == @"Athletics / Recreation") {
            [[categories objectAtIndex:4] addObject:[locations objectAtIndex:i]];
        }
    }
    
    PlacesViewController *tourOne = [[PlacesViewController alloc] init];
    [tours addObject:tourOne];
    tourOne.name = @"Main Line";
    tourOne.locations = locations;
    tourOne.agenda = agenda;
    
    PlacesViewController *tourTwo = [[PlacesViewController alloc] init];
    [tours addObject:tourTwo];
    tourTwo.name = @"Around the World";
    tourTwo.locations = locations;
    tourTwo.agenda = agenda;
    
    UITabBarController *tabBarController = 
    (UITabBarController *)self.window.rootViewController;
	
    UINavigationController *navigationController = 
    [[tabBarController viewControllers] objectAtIndex:0];
	
    AgendaViewController *agendaViewController = 
    [[navigationController viewControllers] objectAtIndex:0];
	agendaViewController.locations = agenda;
    
    UINavigationController *tourNavController =
    [[tabBarController viewControllers] objectAtIndex:1];
    
    TourViewController *tourViewController =
    [[tourNavController viewControllers] objectAtIndex:0];
    tourViewController.tourList = tours;
    
    UINavigationController *placesNavigationController = 
    [[tabBarController viewControllers] objectAtIndex:2];
    
    PlacesViewController *placesViewController =
    [[placesNavigationController viewControllers] objectAtIndex:0];
    placesViewController.locations = categories;
    placesViewController.agenda = agenda;
    placesViewController.isSectioned = YES;
    
    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
