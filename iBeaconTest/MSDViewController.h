//
//  MSDViewController.h
//  iBeaconTest
//
//  Created by Matthew Dobson on 6/3/14.
//  Copyright (c) 2014 Matthew Dobson. All rights reserved.
//

#import <UIKit/UIKit.h>

@import CoreLocation;

@interface MSDViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet UILabel *b1_major;
@property (nonatomic, retain) IBOutlet UILabel *b1_minor;
@property (nonatomic, retain) IBOutlet UILabel *b1_distance;

@property (nonatomic, retain) IBOutlet UILabel *b2_major;
@property (nonatomic, retain) IBOutlet UILabel *b2_minor;
@property (nonatomic, retain) IBOutlet UILabel *b2_distance;

@end
