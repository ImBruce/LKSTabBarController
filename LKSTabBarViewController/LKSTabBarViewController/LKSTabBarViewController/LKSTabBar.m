//
//  LKSTabBar.m
//  LKSTabBarViewController
//
//  Created by guobingwei on 15/8/19.
//  Copyright (c) 2015年 guobingwei. All rights reserved.
//

#import "LKSTabBar.h"
#import "LKSTabBarItem.h"

@interface LKSTabBar ()

@property (nonatomic) UIImageView *topIndicatorImageView;
@property (nonatomic) UIImageView *bottomIndicatorImageView;

@end

@implementation LKSTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBackGroud];
        [self setLKSTabBarHeight:frame.size.height];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupBackGroud];
    }
    return self;
}

- (id)init {
    return [self initWithFrame:CGRectZero];
}

- (void)setupBackGroud
{
    _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_backGroundView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layoutLKSItem];
}

- (void)layoutLKSItem
{
    float tabBarWidth = 0.0;
    if (_items && [_items count] > 0) {
        tabBarWidth = self.frame.size.width/[_items count];
    }
    
    int index = 0;
    for (;index < [_items count];index++) {
        LKSTabBarItem *item = [_items objectAtIndex:index];
        item.frame = CGRectMake(tabBarWidth*index, 0, tabBarWidth, _tabBarHeight);
        [item setNeedsDisplay];
    }
    
    if (_items && [_items count] > 0) {
        NSUInteger objectIndex = [_items indexOfObject:_selectedTabBarItem];
        [self layoutIndicator:objectIndex tabWidth:tabBarWidth];
    }
}

- (void)layoutIndicator:(NSUInteger)selectedIndex tabWidth:(CGFloat)tabWidth
{
    if (_indicatorPosition == UIIndicatorPositionTop) {
        [UIView animateWithDuration:0.25 animations:^{
            _topIndicatorImageView.frame = CGRectMake(selectedIndex*tabWidth, 0, tabWidth, _indicatorHeight);
        } completion:nil];
    } else if (_indicatorPosition == UIIndicatorPositionBottom) {
        [UIView animateWithDuration:0.25 animations:^{
            _bottomIndicatorImageView.frame = CGRectMake(selectedIndex*tabWidth, self.frame.size.height - _indicatorHeight, tabWidth, _indicatorHeight);
        } completion:nil];
    }
}

- (void)setupLKSItem
{
    for (LKSTabBarItem *item in _items) {
        
        [item addTarget:self action:@selector(tabBarItemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
    }
}

- (void)setupTopIndicator
{
    if (_items && [_items count] > 0) {
        CGFloat indicatorWidth = self.frame.size.width/[_items count];
        _topIndicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, indicatorWidth, _indicatorHeight)];
        _topIndicatorImageView.image = _topIndicatorImage;
        [self addSubview:_topIndicatorImageView];
    }
}

- (void)setupBottomIndicator
{
    if (_items && [_items count] > 0) {
        CGFloat indicatorWidth = self.frame.size.width/[_items count];
        _bottomIndicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - _indicatorHeight, indicatorWidth, _indicatorHeight)];
        _bottomIndicatorImageView.image = _bottomIndicatorImage;
        [self addSubview:_bottomIndicatorImageView];
    }
}

- (void)setIndicatorPosition:(UIIndicatorPosition)indicatorPosition
{
    _indicatorPosition = indicatorPosition;
    if (indicatorPosition == UIIndicatorPositionTop) {
        _topIndicatorImageView.hidden = NO;
        _bottomIndicatorImageView.hidden = YES;
    } else if (indicatorPosition == UIIndicatorPositionBottom) {
        _topIndicatorImageView.hidden = YES;
        _bottomIndicatorImageView.hidden = NO;
    }
}

- (void)switchTabbarItem:(NSInteger)index
{
    if (_items && [_items count] > 0) {
        LKSTabBarItem *item = [_items objectAtIndex:index];
        [self tabBarItemSelected:item];
    }
}

- (void)tabBarItemSelected:(LKSTabBarItem *)item
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lksTabBar:shouldSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:item];
        if (![self.delegate lksTabBar:self shouldSelectItemAtIndex:index]) {
            return;
        }
    }
    
    [self settabBarSelectedItem:item];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(lksTabBar:didSelectItemAtIndex:)]) {
        NSInteger index = [self.items indexOfObject:_selectedTabBarItem];
        [self.delegate lksTabBar:self didSelectItemAtIndex:index];
    }
}

- (void)settabBarSelectedItem:(LKSTabBarItem *)item
{
    if (item == _selectedTabBarItem) {
        return;
    }
    [_selectedTabBarItem setSelected:NO];
    
    _selectedTabBarItem = item;
    [_selectedTabBarItem setSelected:YES];
}

- (void)setItems:(NSArray *)items
{
    _items = [items copy];
    
    [self setupLKSItem];
    [self setupTopIndicator];
    [self setupBottomIndicator];
}

- (void)setLKSTabBarHeight:(CGFloat)tabBarHeight
{
    _tabBarHeight = tabBarHeight;
}

@end
