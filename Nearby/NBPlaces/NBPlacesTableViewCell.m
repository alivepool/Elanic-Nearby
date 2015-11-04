//
//  NBPlacesTableViewCell.m
//  Nearby
//
//  Created by Ameya on 03/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBPlacesTableViewCell.h"
#import "UIImageView+ImageCache.h"

@interface NBPlacesTableViewCell ()
@property (nonatomic, strong)UIImageView *placeImageView;
@property (nonatomic, strong)UILabel *placeLabel;
@property (nonatomic, strong)NSString *baseURL;
@end

@implementation NBPlacesTableViewCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeView];
    }
    
    return self;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        [self initializeView];
    }
    
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initializeView];
    }
    
    return self;
}

-(void)initializeView{
    
    self.placeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.height, self.contentView.frame.size.height)];
    self.placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.placeImageView.frame)+20, (self.contentView.frame.size.height - 50)/2, self.contentView.frame.size.width - (CGRectGetMaxX(self.placeImageView.frame)+20), 50)];
    self.placeLabel.contentMode = UIControlContentHorizontalAlignmentCenter;
    self.placeLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.placeImageView];
    [self.contentView addSubview:self.placeLabel];
}

-(void)setNbModel:(NBPlacesModel *)nbModel{
    _nbModel = nbModel;
    [self.placeImageView setImage:[UIImage imageNamed:@"Placeholder"]];
    self.placeLabel.text = nbModel.name;
    [self.placeImageView setImageWithURL:nbModel.imageURL];
}

- (UIEdgeInsets)layoutMargins {
    return UIEdgeInsetsZero;
}
@end