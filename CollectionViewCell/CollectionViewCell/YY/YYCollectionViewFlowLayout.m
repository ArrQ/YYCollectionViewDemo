//
//  YYCollectionViewFlowLayout.m
//  CollectionViewCell
//
//  Created by ArrQ on 2017/8/30.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "YYCollectionViewFlowLayout.h"

@implementation YYCollectionViewFlowLayout



# pragma mark --- 方式 1 -------

//-(instancetype)init
//{
//    self =[super init];
//    
//    if (self) {
//        
//        [self setStyle];
//    }
//    return self;
//}
//
//-(void)setStyle
//{
//    
//    
//    self.minimumLineSpacing = self.minimumInteritemSpacing =ITEMMARGIN;
//    
//    CGFloat WIDTH = (SCREENWIDTH - ITEMMARGIN * (COLUMN+1))/COLUMN;
//    
//    self.itemSize = CGSizeMake(WIDTH, WIDTH);
//    self.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
//}




# pragma mark --- 方法2------
/// 准备布局
- (void)prepareLayout {
    [super prepareLayout];
    
    //设置item尺寸
    self.itemSize = CGSizeMake((SCREENWIDTH-50)/3, (SCREENWIDTH-50)/3);
    //设置滚动方向
//    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置分页
    self.collectionView.pagingEnabled = YES;
    
    //设置最小间距
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

    //隐藏水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;

}



# pragma mark ---  样式 3 --------











@end
