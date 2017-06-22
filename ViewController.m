//
//  ViewController.m
//  DEMO-CHT#166BUG
//
//  Created by 孙继刚 on 2017/6/22.
//  Copyright © 2017年 madordie. All rights reserved.
//

#import "ViewController.h"
#import <CHTCollectionViewWaterfallLayout.h>
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, strong) UICollectionView *list;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CHTCollectionViewWaterfallLayout *layout = [CHTCollectionViewWaterfallLayout new];

    self.list = [[UICollectionView alloc] initWithFrame:self.view.bounds
                              collectionViewLayout:layout];
    [self.view addSubview:self.list];
    [self.list registerClass:[CollectionViewCell class]
        forCellWithReuseIdentifier: @"cell"];
    [self.list registerClass:[CollectionReusableView class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                 withReuseIdentifier:@"header"];
    [self.list registerClass:[CollectionReusableView class]
        forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
               withReuseIdentifier:@"footer"];
    self.list.dataSource = self;
    self.list.delegate = self;
    self.list.backgroundColor = [UIColor whiteColor];
    [self.list reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell =
    (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                                                forIndexPath:indexPath];
    cell.title.text = [NSString stringWithFormat:@"cell-%@-%@", @(indexPath.section), @(indexPath.row)];
    [cell sizeToFit];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    CollectionReusableView *reusableView = nil;

    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"header"
                                                                 forIndexPath:indexPath];
        reusableView.title.text = [NSString stringWithFormat:@"header-%@-%@", @(indexPath.section), @(indexPath.row)];
    } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"footer"
                                                                 forIndexPath:indexPath];
        reusableView.title.text = [NSString stringWithFormat:@"footer-%@-%@", @(indexPath.section), @(indexPath.row)];
    }
    [reusableView sizeToFit];
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(400, 100);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section {
    return 20;
}

@end

