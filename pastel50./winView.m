//
//  winView.m
//  pastel50.
//
//  Created by Sean Lim on 14/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "winView.h"

@interface winView ()

@end

@implementation winView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backto_mm.alpha = 0;
    _h1.alpha        = 0;
    _h2.alpha        = 0;
    
}
-(void)viewDidAppear:(BOOL)animated{
    //start animation
    _headsup_container.alpha = 0;
    [UIView animateWithDuration:0.8 animations:^{
        _backto_mm.alpha = 1;
        _h1.alpha        = 1;
        _h2.alpha        = 1;
    }];
}
- (IBAction)backto_mm:(id)sender {
    //send back to mm
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)headsup{
    //shadow
    CALayer *layer = self.headsup_container.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 10.0f;
    layer.shadowOpacity = 0.40f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:_headsup_container.bounds] CGPath];
    //init with animations
    //get initial point
    float x, y , width, height;
    x      = self.headsup_container.frame.origin.x;
    y      = self.headsup_container.frame.origin.y;
    width  = self.headsup_container.frame.size.width;
    height = self.headsup_container.frame.size.height;
     _headsup_container.frame = CGRectMake(x, -height -10, width, height);
    //move frame down
    [UIView animateWithDuration:0.4 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _headsup_container.frame = CGRectMake(x, y, width, height);
    }completion:nil];
    //move the frame back up
    [UIView animateWithDuration:0.4 delay:6.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _headsup_container.frame = CGRectMake(x, -height -10, width, height);
    }completion:nil];

}

- (IBAction)leaderboards_button:(id)sender {
    //send to leaderboards
    [self performSegueWithIdentifier:@"leader" sender:nil];
}
@end
