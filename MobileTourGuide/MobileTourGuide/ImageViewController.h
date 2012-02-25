//
//  ImageViewController.h
//  MobileTourGuide
//
//  Created by Scott Andrus on 2/25/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (strong, nonatomic) NSString *image;
@property (weak, nonatomic) IBOutlet UIImageView *display;

@end
