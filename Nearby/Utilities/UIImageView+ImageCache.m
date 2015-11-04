//
//  UIImageView+ImageCache.m
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "UIImageView+ImageCache.h"

/////****************************

////////////// NOTE //////////////
////// This is a basic async /////
//////implementation created /////
//////only for this assignment////
/////DONOT USE THIS - NON TESTED//
////////////AMEYA/////////////////


@implementation UIImageView (ImageCache)
+(NSMutableDictionary*)sharedCache{
    static NSMutableDictionary *imageDict = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        imageDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    });
    return imageDict;
}

-(UIImage*)setImageWithURL:(NSString*)urlString
{
    UIImage *requestedImage = nil;
    requestedImage = [[UIImageView sharedCache] objectForKey:urlString];
    if(requestedImage)
    {
        return requestedImage;
    }
    else{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            if (imgData) {
                UIImage *image = [UIImage imageWithData:imgData];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image = image;
                        [[UIImageView sharedCache] setObject:image forKey:urlString];
                    });
                }
            }
        });
    }
    return nil;
}
@end
