//
//  YYCollectionViewCell.h
//  CollectionViewCell
//
//  Created by ArrQ on 2017/8/30.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYCollectionViewCell;
@class YYCollectionView;

@protocol YYCollectionViewCellDelegate<NSObject>

-(void)DeletesNumber:(NSInteger)number InView:(YYCollectionViewCell *)cell;

@end


@interface YYCollectionViewCell : UICollectionViewCell



-(instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic,weak)id <YYCollectionViewCellDelegate>cellDelegate;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UIButton * deletesBtn;//删除按钮
@property(nonatomic,retain)YYCollectionView * collectionView;

-(void)setDataWithArray:(NSArray*)array indexPath:(NSIndexPath *)path collectionView:(YYCollectionView*)collectionView;


@end
