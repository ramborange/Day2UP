//
//  HomeTableViewCell.m
//  Day2UP
//
//  Created by ramborange on 2016/11/10.
//  Copyright © 2016年 Rambos. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSLog(@"awakeFromNib");
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.itemLabel = [UIHelper getLabelWithText:NULL textColor:[UIColor lightGrayColor] font:Large_font bgColor:[UIColor clearColor] textAlign:NSTextAlignmentCenter corRadius:0];
        self.itemLabel.backgroundColor = RGBA(252, 252, 252, 1.0);
        [self.itemLabel setLayerShadow:RGBA(236, 236, 236, 1.0) offset:CGSizeZero radius:1.0];
        [self.contentView addSubview:self.itemLabel];
        
        __weak __typeof(self)weakself = self;
        _itemLabel.sd_layout
        .leftSpaceToView(weakself.contentView,10)
        .rightSpaceToView(weakself.contentView,10)
        .topSpaceToView(weakself.contentView,8)
        .bottomSpaceToView(weakself.contentView,8);
        
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
