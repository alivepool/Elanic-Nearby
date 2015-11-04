//
//  NBLocationManager.m
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBLocationManager.h"

@interface NBLocationManager()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation NBLocationManager
+(instancetype)instance
{
    static NBLocationManager *globalInstance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        globalInstance = [[NBLocationManager alloc] init];
        
        if (!globalInstance.locationManager) {
            globalInstance.locationManager = [[CLLocationManager alloc] init];
            globalInstance.locationManager.delegate = globalInstance;
            if ([globalInstance.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [globalInstance.locationManager requestAlwaysAuthorization];
            }
            if ([globalInstance.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [globalInstance.locationManager requestWhenInUseAuthorization];
            }
            globalInstance.locationManager.pausesLocationUpdatesAutomatically = NO;
            globalInstance.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            globalInstance.locationManager.distanceFilter = kCLDistanceFilterNone;
            [globalInstance.locationManager startMonitoringSignificantLocationChanges];
        }
    });
    return globalInstance;
}

#pragma mark - Location manager  delegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    [NBLocationManager instance].lastLocation = [locations lastObject];
    
    //[[NBLocationManager instance].locationManager stopUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
   //Handle Error
}

-(void)getLatestLocationWithSuccess:(nullable void (^)(CLLocation * _Nullable location))success
                            failure:(nullable void (^)(NSError  * _Nullable error))failure
{
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        [NBLocationManager instance];
    });
    return;
}
@end
