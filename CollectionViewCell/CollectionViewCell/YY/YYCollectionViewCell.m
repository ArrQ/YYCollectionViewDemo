//
//  YYCollectionViewCell.m
//  CollectionViewCell
//
//  Created by ArrQ on 2017/8/30.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "YYCollectionViewCell.h"
#import "YYCollectionView.h"
@implementation YYCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    
    if (self) {
        
        [self setStyle];
        [self addGesture];
        [self addlabel];
    }
    
    return self;
}

-(void)addlabel
{
    _titleLabel =[[UILabel alloc]init];
    _titleLabel.textAlignment =NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    _deletesBtn =[ UIButton buttonWithType:UIButtonTypeCustom];
    [_deletesBtn setTitle:@"X" forState:UIControlStateNormal];
    [_deletesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _deletesBtn.backgroundColor =[ UIColor greenColor];
    [self.contentView addSubview:_deletesBtn];
}

-(void)layoutSubviews
{
    _titleLabel.frame =CGRectMake(0, 0, self.frame.size.width-30,self.frame.size.height );
    _deletesBtn.frame =CGRectMake(self.frame.size.width-30, 0, 30,20);
}

-(void)setStyle
{
    self.backgroundColor = [UIColor magentaColor];
}

-(void)addGesture
{
    UILongPressGestureRecognizer *longPress =[[ UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [self.contentView addGestureRecognizer:longPress];
}

-(void)longPress:(UILongPressGestureRecognizer *)press
{
    switch (press.state) {
        case UIGestureRecognizerStateBegan:
        {
            
            NSIndexPath * path =[ self.collectionView indexPathForItemAtPoint:[press locationInView:self.collectionView]];
            
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:path];
            
            _deletesBtn.hidden = NO;
            
            [_deletesBtn addTarget:self action:@selector(deletes) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            [self.collectionView updateInteractiveMovementTargetPosition:[press locationInView:self.collectionView]];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        {
            [self.collectionView endInteractiveMovement];
            break;
        }
            
        default:
        {
            [self.collectionView cancelInteractiveMovement];
            break;
        }
    }
}

-(void)deletes
{
    if ([self.cellDelegate respondsToSelector:@selector(DeletesNumber:InView:)]) {
        
        [self.cellDelegate DeletesNumber:_titleLabel.tag InView:self];
    }
}

-(void)setDataWithArray:(NSArray *)array indexPath:(NSIndexPath *)path collectionView:(YYCollectionView *)collectionView
{
    self.titleLabel.tag =[array[path.item] integerValue];
    self.titleLabel.text =array[path.item];
    self.deletesBtn.hidden =YES;
    self.collectionView =collectionView;
}

@end
