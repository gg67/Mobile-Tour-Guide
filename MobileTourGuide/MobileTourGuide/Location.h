//
//  Location.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/21/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (retain, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *image;
@property (retain, nonatomic) NSString *description;
@property (strong, nonatomic) UIButton *video;
@property (retain, nonatomic) NSString *category;

@end
