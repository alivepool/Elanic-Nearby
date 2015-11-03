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

@interface NBHomeViewController ()<UICollectionViewDataSource,
                                   UICollectionViewDelegate,
                                   UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *categoryCollectionView;
@property (assign, nonatomic) CGSize transitionSize;
@property (strong, nonatomic) NSArray *categoryArray;

@end

@implementation NBHomeViewController


#pragma mark **--
#pragma mark ---- VC lifecycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.transitionSize = self.view.frame.size;
    
    //TODO:Remove hardcoding and replace with dynamic logic : bootstrap
    self.categoryArray = @[@"food", @"gym", @"school", @"hospital", @"spa", @"restaurant"];
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
#pragma mark ---- Collection view delegate methods

#pragma mark -- UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.categoryArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NBHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NBHOME_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    if (!cell) {
        cell = [[NBHomeCollectionViewCell alloc] init];
    }
    
    cell.categoryLabel.text = [self.categoryArray objectAtIndex:indexPath.row];
    return  cell;
}

#pragma mark -- UICollectionViewDelegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark -- UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (CGSizeEqualToSize(self.transitionSize, CGSizeZero)) {
        self.transitionSize = self.view.frame.size;
    }
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


#pragma mark **--
#pragma mark ---- Navigation methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
}


#pragma mark **--
#pragma mark ---- Orientation methods

#pragma mark -- iOS 8 Orientation handling
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.transitionSize = size;
    [self.categoryCollectionView reloadData];
}

#pragma mark -- iOS 7 Orientation handling
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    self.transitionSize = CGSizeZero;
    [self.categoryCollectionView reloadData];
}
@end
