//
//  NBPlacesTableViewCell.m
//  Nearby
//
//  Created by Ameya on 03/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBPlacesTableViewCell.h"
#import "UIImageView+ImageCache.h"

@implementation NBPlacesTableViewCell

-(void)setImageWithURL:(NSString*)urlString{
    [self.imageView setImageWithURL:urlString];
}

- (UIEdgeInsets)layoutMargins {
    return UIEdgeInsetsZero;
}
@end