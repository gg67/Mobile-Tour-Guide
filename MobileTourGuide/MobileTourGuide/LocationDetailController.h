//
//  LocationDetailController.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/20/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationDetailController : UIViewController

@property (strong, nonatomic) NSString *description;

- (id)initWithName:(NSString *)aName
         imagePath:(NSString *)aImagePath
       description:(NSString *)aDescription
         videoPath:(NSString *)aVideoPath;

@end
