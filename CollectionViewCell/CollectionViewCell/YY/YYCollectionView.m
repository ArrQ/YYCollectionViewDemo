//
//  YYCollectionView.m
//  CollectionViewCell
//
//  Created by ArrQ on 2017/8/30.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "YYCollectionView.h"
#import "YYCollectionViewFlowLayout.h"

@implementation YYCollectionView

+(instancetype)collectionViewWithFrame:(CGRect)frame
{
    YYCollectionViewFlowLayout * layout =[[YYCollectionViewFlowLayout alloc]init];
    
    YYCollectionView * collectionView =[[YYCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor =[ UIColor whiteColor];
    
    return collectionView;
}

@end
