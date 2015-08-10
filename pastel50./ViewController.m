//
//  ViewController.m
//  pastel50.
//
//  Created by Sean Lim on 4/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//Throwing all the animations into viewdidappear
-(void)viewDidAppear:(BOOL)animated{
    //ANIMATIONS
    //init with animations and buttons
    _start_button.layer.cornerRadius = 15.0f;
    //
    CALayer *layer1 = _start_button.layer;
    layer1.shadowOffset = CGSizeMake(1, 1);
    layer1.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer1.shadowRadius = 4;
    layer1.shadowOpacity = 0.4;
    layer1.cornerRadius=15.0f;
    layer1.shadowOffset= CGSizeMake(4, 4);
    layer1.shadowPath = [[UIBezierPath bezierPathWithRect:_start_button.bounds] CGPath];
    _blureffect.alpha = 0;
    //
    CALayer *layer2 = _bottom_view.layer;
    layer2.shadowOffset = CGSizeMake(1, 1);
    layer2.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer2.shadowRadius = 4;
    layer2.shadowOpacity = 0.4;
    layer2.shadowOffset= CGSizeMake(0, -2);
    layer2.shadowPath = [[UIBezierPath bezierPathWithRect:_bottom_view.bounds] CGPath];
    _blureffect.alpha = 0;
    // get current position and size of menuview
    float width = _bottom_view.frame.size.width;
    float height = _bottom_view.frame.size.width;
    float x = _bottom_view.frame.origin.x;
    float y = _bottom_view.frame.origin.y;
    //fade in for menu view **delayed by abit**
    //fade in for SG50 logo
    [UIView animateWithDuration:0.6 animations:^{
        _logo_view.alpha = 1;
    }];
    //flip SG50 logo
    [UIView transitionWithView:_logo_view duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
    //menu view slide up
    [UIView animateWithDuration:0.3 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _bottom_view.frame = CGRectMake(x , y - 200, width, height);
    }completion:nil];
    //fade in for all objects
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        _blureffect.alpha = 1;
    }completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}

- (IBAction)start_button:(id)sender {
    //animate out
    //get current view status
    float width = _bottom_view.frame.size.width;
    float height = _bottom_view.frame.size.width;
    float x = _bottom_view.frame.origin.x;
    float y = _bottom_view.frame.origin.y;
    //fade out for SG50 logo
    [UIView animateWithDuration:0.8 animations:^{
        _logo_view.alpha = 0;
    }];
    //menu view slide out
    [UIView animateWithDuration:0.4 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _bottom_view.frame = CGRectMake(x , y + 284, width, height);
    }completion:nil];
    // fade out for the rest of the objects
    [UIView animateWithDuration:1 animations:^{
        _start_button.alpha = 0;
        _pastel_text.alpha = 0;
        _blureffect.alpha = 0;
        _background_img.alpha = 0;
    }];
    //
    double delayInSeconds = 1.6;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //segue to next view
        [self performSegueWithIdentifier:@"gamequote" sender:nil];
    });
}
@end