//
//  NBLocationManager.h
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NBLocationManager : NSObject
+(_Nullable instancetype)instance;

-(void)getLatestLocationWithSuccess:(nullable void (^)(CLLocation * _Nullable location))success
                               failure:(nullable void (^)(NSError  * _Nullable error))failure;
@property (nonatomic, strong) CLLocation    * _Nullable lastLocation;

@end
