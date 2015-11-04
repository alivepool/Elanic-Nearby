//
//  NBPlacesModel.h
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NBPlacesModel : NSObject
@property (nonatomic, strong)CLLocation *placeLocation;
@property (nonatomic, strong)NSString   *icon;
@property (nonatomic, strong)NSString   *identifier;
@property (nonatomic, strong)NSString   *name;
@property (nonatomic, strong)NSString   *placeId;
@property (nonatomic, strong)NSString   *reference;
@property (nonatomic, strong)NSString   *scope;
@property (nonatomic, strong)NSArray    *types;
@property (nonatomic, strong)NSString   *vicinity;
@property (nonatomic, strong)NSString   *imageURL;
@property (nonatomic, strong)NSString   *baseImageURL;

-(instancetype)initWithDictionary:(NSDictionary*)dict;
@end
