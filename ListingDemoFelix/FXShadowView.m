//
//  FXShadowView.m
//  ListingDemoFelix
//
//  Created by Go on 08/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "FXShadowView.h"

@implementation FXShadowView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowRadius = 3.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.shadowOffset = CGSizeZero;
}


@end
