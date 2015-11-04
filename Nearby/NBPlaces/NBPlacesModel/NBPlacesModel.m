//
//  NBPlacesModel.m
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBPlacesModel.h"

@implementation NBPlacesModel

-(instancetype)initWithDictionary:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
       self.placeLocation = [[CLLocation alloc]initWithLatitude:[[dict valueForKeyPath:@"geometry.location.lat"] doubleValue] longitude:[[dict valueForKeyPath:@"geometry.location.lng"] doubleValue]];
        self.icon = [dict valueForKey:@"icon"];
        self.identifier = [dict valueForKey:@"id"];
        self.name = [dict valueForKey:@"name"];
        self.placeId = [dict valueForKey:@"place_id"];
        self.reference = [dict valueForKey:@"reference"];
        self.scope = [dict valueForKey:@"scope"];
        self.types = [dict valueForKey:@"types"];
        self.vicinity = [dict valueForKey:@"vicinity"];
        
    }
    return self;
}
@end
