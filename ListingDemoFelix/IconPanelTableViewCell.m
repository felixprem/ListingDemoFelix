//
//  IconPanelTableViewCell.m
//  ListingDemoFelix
//
//  Created by Go on 08/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "IconPanelTableViewCell.h"

@implementation IconPanelTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.iconImageView.layer.cornerRadius = self.iconImageView.frame.size.width / 2;
    self.iconImageView.clipsToBounds = YES;
    self.iconImageView.layer.borderWidth = 2.0f;
    self.iconImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
