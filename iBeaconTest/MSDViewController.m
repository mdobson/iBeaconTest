//
//  MSDViewController.m
//  iBeaconTest
//
//  Created by Matthew Dobson on 6/3/14.
//  Copyright (c) 2014 Matthew Dobson. All rights reserved.
//

#import "MSDViewController.h"

@import CoreLocation;

@interface MSDViewController ()

@property (strong, nonatomic) CLLocationManager *manager;

@end

@implementation MSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    NSLog(@"Found Beacon");
    NSLog(@"BEACONS: %@", beacons);
}

- (IBAction)startRanging:(id)sender {
    NSLog(@"Starting");
    NSUUID * uuid = [[NSUUID alloc] initWithUUIDString:@"E2A9E247-1F9C-47B8-9A6B-813AD63F3D58"];

    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"Matts Room"];
    
    [self.manager startMonitoringForRegion:region];
    [self.manager startRangingBeaconsInRegion:region];
}

@end
