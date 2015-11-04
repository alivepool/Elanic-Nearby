//
//  NBPlacesRequestManager.m
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBPlacesRequestManager.h"
#import "AFNetworking.h"
#import "NBPlacesModel.h"

@interface NBPlacesRequestManager()
@property (nonatomic, strong)NSString *baseUrl;
@property (nonatomic, strong)AFHTTPSessionManager *sessionManager;
@end

@implementation NBPlacesRequestManager

-(instancetype)initWithBaseUrlString:(NSString*)url{
    self = [super init];
    if (self) {
        if (!url) {
            url = @"https://maps.googleapis.com";
        }
        self.baseUrl = url;
    }
    return self;
}


-(void)getPlaces:(NSString*)path
      parameters:(NSDictionary* _Nullable)paramDict
         Success:(nullable void (^)(id  _Nullable response))success
         failure:(nullable void (^)(NSError  * _Nullable error))failure{
    if (!self.sessionManager) {
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseUrl]];
    }
    
    [self.sessionManager GET:path parameters:paramDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSMutableArray *nbPlacesModalArray = [[NSMutableArray alloc] initWithCapacity:0];
        if (responseObject) {
            NSArray *resultArray = [responseObject objectForKey:@"results"];
            for (id responseDict in resultArray) {
                if ([responseDict isKindOfClass:[NSDictionary class]]) {
                    NBPlacesModel *nbPlacesModel = [[NBPlacesModel alloc] initWithDictionary:responseDict];
                    [nbPlacesModalArray addObject:nbPlacesModel];
                }
            }
            
        }
        
        success(nbPlacesModalArray);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
