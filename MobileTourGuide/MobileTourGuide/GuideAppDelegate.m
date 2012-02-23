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
    
    location1.name = @"Undergraduate Admissions";
    location2.name = @"Kissam";
    location3.name = @"Rand";
    location4.name = @"Featheringill";
    location5.name = @"Rec Center";
    
    location1.category = @"Adminstrative";
    location2.category = @"Residence Hall";
    location3.category = @"Dining Hall";
    location4.category = @"Class Building";
    location5.category = @"Athletics / Recreation";
    
    location1.description = @"Admissions description";
    location2.description = @"Kissam description";
    location3.description = @"Rand description";
    location4.description = @"FGH description";
    location5.description = @"Rec description";
    
    location1.image = @"Admissions image";
    location2.image = @"Kissam image";
    location3.image = @"Rand image";
    location4.image = @"FGH image";
    location5.image = @"Rec image";

    location1.video = @"Admissions video";
    location2.video = @"Kissam video";
    location3.video = @"Rand video";
    location4.video = @"FGH video";
    location5.video = @"Rec video";
    
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
