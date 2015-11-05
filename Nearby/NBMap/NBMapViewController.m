//
//  NBMapViewController.m
//  Nearby
//
//  Created by Ameya on 05/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBMapViewController.h"

@interface NBMapViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation NBMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    
    MKCoordinateRegion region = self.mapView.region;
    region.center = self.nbModel.placeLocation.coordinate;
    region.span.longitudeDelta = 0.1; // Bigger the value, closer the map view
    region.span.latitudeDelta  = 0.1;
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:self.nbModel.placeLocation.coordinate];
    [annotation setTitle:self.nbModel.name]; //You can set the subtitle too
    [self.mapView addAnnotation:annotation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
