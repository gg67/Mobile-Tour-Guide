//
//  GuideAppDelegate.m
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/16/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "GuideAppDelegate.h"
#import "AgendaViewController.h"
#import "Location.h"

@implementation GuideAppDelegate 

@synthesize locations;
@synthesize window = _window;
@synthesize navController;

#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    AgendaViewController *agenda = [[AgendaViewController alloc] initWithStyle:UITableViewStylePlain];
//    self.navController = [[UINavigationController alloc] initWithRootViewController:agenda];
//    [self.window addSubview:navController.view];
    
    locations = [NSMutableArray arrayWithCapacity:5];
    Location *location1 = [[Location alloc] init];
    Location *location2 = [[Location alloc] init];
    Location *location3 = [[Location alloc] init];
    Location *location4 = [[Location alloc] init];
    Location *location5 = [[Location alloc] init];
    
    location1.name = @"Admissions";
    location2.name = @"Kissam Quad";
    location3.name = @"Rand Hall";
    location4.name = @"Featheringill Hall";
    location5.name = @"Rec Center";
    
    location1.category = @"Adminstrative";
    location2.category = @"Residence Hall";
    location3.category = @"Dining Hall";
    location4.category = @"Class Building";
    location5.category = @"Athletics / Recreation";
    
    location1.description = @"This 1993 addition to campus incorporates a portion of old West Side Hall, the university's first dining facility. Thousands of prospective students begin their Vanderbilt journeys with a tour of the campus which begins from this point. Nearly 20,000 applications to the university's first-year class of 1,650 are received and reviewed at this location.";
    
    location2.description = @"Almost every Vanderbilt student has heard rumors regarding Kissam Quadrangle, the residential area on the corner of 21st and West End. Whether it is that a homeless man has begun to live in Kissam or that they shampoo the carpets weekly in order to keep them clean, it is more than likely most Vanderbilt students view Kissam in a negative light. The six existing Kissam Quadrangle buildings, located near the intersection of West End Avenue and 21st Avenue South, will be demolished to make way for the two colleges that will be connected by a shared facility providing gathering space, “grab-and-go” dining options, a classroom, offices and meeting rooms.";
    
    location3.description = @"Sarratt Student Center and the adjoining Rand Hall are light and bright and humming with activity. With assorted dining options, the Vanderbilt Bookstore, the popular Baseball Glove Lounge for studying, art studios, art gallery, cinema, post office, meeting rooms, and offices, Sarratt and Rand pulse with the heartbeat of Vanderbilt.";
    
    location4.description = @"A distinctive tower marks the entrance of Featheringill Hall, one of four buildings housing the Vanderbilt School of Engineering. Inside, Featheringill features a three-story atrium, which serves as a focal for student interaction and social events, more than 50 teaching and research laboratories with the latest equpment and computer resources, and project rooms.";
    
    location5.description = @"It is the mission of the Office of Campus Recreation to assist in the development and education of the whole person. The Office achieves this goal by providing comprehensive fitness, recreation, and wellness programs in a state of the art facility to the diverse population of students and the Vanderbilt community at large. The wide variety of programs provide opportunities to develop the individual's positive self-esteem, relationships with others, and effective communication and leadership skills. The Student Recreation Center additionally serves as an avenue for individuals to achieve a stress free, holistic approach to a healthy lifestyle.";
    
    location1.image = @"Admissions image";
    location2.image = @"Kissam image";
    location3.image = @"Rand image";
    location4.image = @"FGH image";
    location5.image = @"Rec image";

    location1.video = @"http://www.youtube.com/watch?v=p0IoNXrtNGY";
    location2.video = @"http://www.youtube.com/watch?v=HlbY6BUQ4Vg";
    location3.video = @"http://www.youtube.com/watch?v=U5b8cymDlT4";
    location4.video = @"http://www.youtube.com/watch?v=4JZQ4qgYvEY";
    location5.video = @"http://www.youtube.com/watch?v=1wuxnc-yBK0";
    
    location1.hours = @"9 A.M. to 5 P.M.";
    location2.hours = @"9 A.M. to 5 P.M.";
    location3.hours = @"9 A.M. to 5 P.M.";
    location4.hours = @"9 A.M. to 5 P.M.";
    location5.hours = @"9 A.M. to 5 P.M.";
    
    [locations addObject:location1];
    [locations addObject:location2];
    [locations addObject:location3];
    [locations addObject:location4];
    [locations addObject:location5];
    
    UITabBarController *tabBarController = 
    (UITabBarController *)self.window.rootViewController;
	
    UINavigationController *navigationController = 
    [[tabBarController viewControllers] objectAtIndex:0];
	
    AgendaViewController *locationsViewController = 
    [[navigationController viewControllers] objectAtIndex:0];
	locationsViewController.locations = locations;
    
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
