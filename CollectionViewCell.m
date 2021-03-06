//
//  CollectionViewCell.m
//  DEMO-CHT#166BUG
//
//  Created by 孙继刚 on 2017/6/22.
//  Copyright © 2017年 madordie. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (UILabel *)title {
    if (_title == nil) {
        _title = [UILabel new];
        _title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_title];
    }
    return _title;
}
- (CGSize)sizeThatFits:(CGSize)size {
    _title.frame = CGRectMake(0, 0, size.width, size.height);
    return size;
}

@end
