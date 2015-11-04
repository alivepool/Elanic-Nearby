//
//  NBPlacesViewController.m
//  Nearby
//
//  Created by Ameya on 03/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBPlacesTableViewController.h"
#import "NBUIConstants.h"
#import "NBPlacesTableViewCell.h"
#import "NBStateMachine.h"
#import "NBLocationManager.h"
#import "NBPlacesRequestManager.h"

#define GOOGLE_PLACES_KEY @"AIzaSyABrrDMyypdLi8C18EMTK2gU1Tt88g9fjA"
#define GOOGLE_PLACES_PATH @"maps/api/place/nearbysearch/json"

@interface NBPlacesTableViewController() <UITableViewDataSource,
                                          UITableViewDelegate>

@property (nonatomic, strong)NSArray     *placesDataArray;
@property (retain, nonatomic)UIAlertView *actionAlertView;
@property (nonatomic, strong)UIRefreshControl *tableRefreshControl;
@property (nonatomic, strong)NSString *radius;

- (IBAction)showOptionPopover:(id)sender;
@end

@implementation NBPlacesTableViewController


#pragma mark **--
#pragma mark ---- VC lifecycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    self.tableRefreshControl = [[UIRefreshControl alloc] init];
    self.tableRefreshControl.backgroundColor = [UIColor cyanColor];
    self.tableRefreshControl.tintColor = [UIColor whiteColor];
    [self.tableRefreshControl addTarget:self
                            action:@selector(fetchData)
                  forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = self.tableRefreshControl;
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    else if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    self.radius = [[NSUserDefaults standardUserDefaults] objectForKey:@"radius"];
    if (!self.radius) {
        self.radius = @"5000";
        [[NSUserDefaults standardUserDefaults] setObject:@"5000" forKey:@"radius"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self fetchData];
}

-(void)fetchData
{
    NBPlacesRequestManager *requestManager = [[NBPlacesRequestManager alloc] initWithBaseUrlString:nil];
    
    NSString *latLongStr = [NSString stringWithFormat:@"%f,%f",[NBLocationManager instance].lastLocation.coordinate.latitude, [NBLocationManager instance].lastLocation.coordinate.longitude];
    
    //TODO:Remove hardcoded radious and get it from user
    NSDictionary *paramDict = @{@"location" : latLongStr, @"radius" : self.radius, @"types" : self.selectedCategory, @"key" : GOOGLE_PLACES_KEY};
    
    [requestManager getPlaces:GOOGLE_PLACES_PATH parameters:paramDict Success:^(id  _Nullable response) {
        self.placesDataArray = response;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            [self.tableView reloadData];
        });
    } failure:^(NSError * _Nullable error) {
        //Handle error case
    }];
}

#pragma mark **--
#pragma mark ---- Memory handling

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
}

#pragma mark **--
#pragma mark ---- Tableview view delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark ---- Tableview view data source methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.placesDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NBPlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NBPLACES_CELL_REUSE_IDENTIFIER];
    if (!cell) {
        cell = [[NBPlacesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NBPLACES_CELL_REUSE_IDENTIFIER];
    }
    
    NBPlacesModel *selectedModel = [self.placesDataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = selectedModel.name;
    return cell;
}



- (IBAction)showOptionPopover:(id)sender {
    self.actionAlertView = [[UIAlertView alloc]initWithTitle:@"Enter search radius" message:Nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Search", nil];
    self.actionAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [self.actionAlertView show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (1 == buttonIndex) {
        
        if ([self.actionAlertView textFieldAtIndex:0].text) {
            self.radius = [self.actionAlertView textFieldAtIndex:0].text;
            [[NSUserDefaults standardUserDefaults] setObject:[self.actionAlertView textFieldAtIndex:0].text forKey:@"radius"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        [self fetchData];
    }
    else{
        [self.actionAlertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    }
}




@end