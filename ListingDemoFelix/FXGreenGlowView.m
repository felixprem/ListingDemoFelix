//
//  FXGreenGlowView.m
//  ListingDemoFelix
//
//  Created by Go on 08/11/14.
//  Copyright (c) 2014 Felix. All rights reserved.
//

#import "FXGreenGlowView.h"

@implementation FXGreenGlowView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.shadowColor = [UIColor greenColor].CGColor;
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowOffset = CGSizeZero;
}


@end
