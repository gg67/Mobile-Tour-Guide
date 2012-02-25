//
//  Location.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/21/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *video;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *hours;
@property BOOL onAgenda;


@end
