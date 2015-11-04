//
//  NBPlacesRequestManager.h
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBPlacesModel.h"

@interface NBPlacesRequestManager : NSObject

-(instancetype _Nullable)initWithBaseUrlString:(NSString* _Nullable)url;
-(void)getPlaces:(NSString* _Nullable)path
      parameters:(NSDictionary* _Nullable)paramDict
         Success:(nullable void (^)(id  _Nullable response))success
         failure:(nullable void (^)(NSError  * _Nullable error))failure;
@end
