//
//  ViewController.m
//  CollectionViewCell
//
//  Created by ArrQ on 2017/8/30.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "ViewController.h"

#import "YYCollectionView.h"
#import "YYCollectionViewCell.h"

static NSString * collectionViewCellID = @"collectionViewCellID";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,YYCollectionViewCellDelegate>


@property(nonatomic,retain)YYCollectionView * collectionView;
@property(nonatomic,retain)NSMutableArray * contentArray;


@end





@implementation ViewController
//懒加载
-(NSMutableArray *)contentArray
{
    if (!_contentArray) {
        
        _contentArray =[NSMutableArray array];
        
        for (NSInteger index =0; index<COUNT; index++) {
            
            [_contentArray addObject:[NSString stringWithFormat:@"%ld",index]];
        }
    }
    
    return _contentArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setCollectionView];

    


}


-(void)setCollectionView
{
    CGRect collectionViewFrame = CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT -64);
    YYCollectionView * collectionView =[YYCollectionView collectionViewWithFrame:collectionViewFrame];
    
    collectionView.delegate =self;
    collectionView.dataSource =self;
    [collectionView registerClass:[YYCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellID];
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YYCollectionViewCell * cell =[ collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellID forIndexPath:indexPath];
    cell.cellDelegate =self;
    
    [cell setDataWithArray:self.contentArray indexPath:indexPath collectionView:self.collectionView];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    //取出源item数据
    id objc = [self.contentArray objectAtIndex:sourceIndexPath.item];
    //从资源数组中移除该数据
    [self.contentArray removeObject:objc];
    //插入到指定位置
    [self.contentArray insertObject:objc atIndex:destinationIndexPath.item];
    //刷新数据源
    [self.collectionView reloadData];
}

-(void)DeletesNumber:(NSInteger)number InView:(YYCollectionViewCell *)cell
{
    
    [self.contentArray removeObject:[NSString stringWithFormat:@"%ld",number]];
    
    [self.collectionView reloadData];
    NSLog(@"---%ld",self.contentArray.count);
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
