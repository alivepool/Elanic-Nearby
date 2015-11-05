//
//  NBPlacesDetailViewController.m
//  Nearby
//
//  Created by Ameya on 04/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBPlacesDetailViewController.h"
#import "UIImageView+ImageCache.h"
#import "NBMapViewController.h"

@interface NBPlacesDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *placeImageView;
@property (strong, nonatomic) IBOutlet UILabel *placeName;
@property (strong, nonatomic) IBOutlet UILabel *placeArea;

- (IBAction)showPlaceOnMap:(id)sender;
@end

@implementation NBPlacesDetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.placeImageView setImage:[UIImage imageNamed:@"Placeholder"]];
    [self.placeImageView setImageWithURL:self.nbModel.imageURL];
    self.placeArea.text = self.nbModel.vicinity;
    self.placeName.text = self.nbModel.name;
    
}
- (IBAction)showPlaceOnMap:(id)sender {
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NBMapViewController *destViewController = segue.destinationViewController;
    destViewController.nbModel = self.nbModel;
}
@end
