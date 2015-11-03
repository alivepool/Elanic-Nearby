//
//  ViewController.m
//  Nearby
//
//  Created by Ameya on 02/11/15.
//  Copyright © 2015 Elanic. All rights reserved.
//

#import "NBHomeViewController.h"
#import "NBHomeCollectionViewCell.h"
#import "NBUIConstants.h"

@interface NBHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *categoryCollectionView;
@property (assign, nonatomic) CGSize transitionSize;

@end

@implementation NBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.transitionSize = self.view.frame.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --
#pragma mark -- Collection view delegate methods

#pragma mark -- UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCellIdentifier" forIndexPath:indexPath];
}

#pragma mark -- UICollectionViewDelegate methods

#pragma mark -- UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.transitionSize.width - ((2*NBHOME_CELL_PADDING)+NBHOME_CELL_SPACING))/2, NBHOME_CELL_HEIGHT);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

        return UIEdgeInsetsMake(NBHOME_CELL_PADDING, NBHOME_CELL_PADDING, NBHOME_CELL_PADDING, NBHOME_CELL_PADDING);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

        return NBHOME_CELL_SPACING;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

        return NBHOME_CELL_SPACING;
}

#pragma mark --
#pragma mark -- Rotation methods

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    self.transitionSize = size;
    [self.categoryCollectionView reloadData];
}

@end
