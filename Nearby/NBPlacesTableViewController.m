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

@interface NBPlacesTableViewController() <UITableViewDataSource,
                                          UITableViewDelegate>


@end

@implementation NBPlacesTableViewController


#pragma mark **--
#pragma mark ---- VC lifecycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NBPlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NBPLACES_CELL_REUSE_IDENTIFIER];
    if (!cell) {
        cell = [[NBPlacesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NBPLACES_CELL_REUSE_IDENTIFIER];
    }
    return cell;
}










@end