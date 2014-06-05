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
    
    if (beacons.count > 0) {
        CLBeacon *beacon1 = beacons[0];
        
        if (beacon1.proximity == CLProximityFar) {
            self.b1_distance.text = @"Far";
        } else if (beacon1.proximity == CLProximityNear) {
            self.b1_distance.text = @"Near";
        } else if (beacon1.proximity == CLProximityImmediate) {
            UILocalNotification *notif = [[UILocalNotification alloc] init];
            notif.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
            notif.alertBody = @"You're near a beacon!";
            notif.timeZone = [NSTimeZone defaultTimeZone];
            [[UIApplication sharedApplication] scheduleLocalNotification:notif];
            
            self.b1_distance.text = @"Super Close!";
        } else {
            self.b1_distance.text = @"Unk";
        }
        self.b1_major.text = [beacon1.major stringValue];
        self.b1_minor.text = [beacon1.minor stringValue];
    }
    
    if (beacons.count > 1) {
        CLBeacon *beacon2 = beacons[1];
        
        if (beacon2.proximity == CLProximityFar) {
            self.b2_distance.text = @"Far";
        } else if (beacon2.proximity == CLProximityNear) {
            self.b2_distance.text = @"Near";
        } else if (beacon2.proximity == CLProximityImmediate) {
            self.b2_distance.text = @"Super Close!";
        } else {
            self.b2_distance.text = @"Unk";
        }
        self.b2_major.text = [beacon2.major stringValue];
        self.b2_minor.text = [beacon2.minor stringValue];
    }
    
}

- (IBAction)startRanging:(id)sender {
    NSLog(@"Starting");
    //NSUUID * uuid = [[NSUUID alloc] initWithUUIDString:@"E2A9E247-1F9C-47B8-9A6B-813AD63F3D58"];
    NSUUID * uuid = [[NSUUID alloc] initWithUUIDString:@"2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6"];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"Matts Room"];
    
    [self.manager startMonitoringForRegion:region];
    [self.manager startRangingBeaconsInRegion:region];
}

@end
