//
//  Main_Menu_Launchpad.m
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "Main_Menu_Launchpad.h"
#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"
#import <AudioToolbox/AudioToolbox.h>
@interface Main_Menu_Launchpad ()

@end

@implementation Main_Menu_Launchpad
int x_high, y_high, height_high, width_high;
- (void)viewDidLoad {
    //init with highscore view
    x_high = self.highscore_view.frame.origin.x;
    y_high = self.highscore_view.frame.origin.y;
    height_high = self.highscore_view.frame.size.height;
    width_high = self.highscore_view.frame.size.width;
    self.highscore_view.layer.cornerRadius = 15.0f;
    [_highscore_view clipsToBounds];
    CALayer *card_layer_ = self.highscore_view.layer;
    card_layer_.shadowOffset  = CGSizeMake(1, 1);
    card_layer_.shadowColor   = [[UIColor grayColor] CGColor];
    card_layer_.shadowRadius  = 10.0f;
    card_layer_.shadowOpacity = 0.60f;
    card_layer_.shadowPath    = [[UIBezierPath bezierPathWithRect:_highscore_view.bounds] CGPath];
    _highscore_view.frame = CGRectMake(x_high, -height_high -10, width_high, height_high);
    _level_3.enabled = NO;
    [super viewDidLoad];
    //init buttons
    _level_2.alpha = 0;
    _level_3.alpha = 0;
    _level_4.alpha = 0;
    _highscore_button.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        _highscore_button.alpha = 1;
    }];
    //init with card
    self.textview_container.layer.cornerRadius = 10.0f;
    [_card_view_text clipsToBounds];
    //card shadow
    CALayer *card_layer = self.textview_container.layer;
    card_layer.shadowColor   = [[UIColor grayColor] CGColor];
    card_layer.shadowRadius  = 10.0f;
    card_layer.shadowOpacity = 0.60f;
    card_layer.shadowPath    = [[UIBezierPath bezierPathWithRect:_textview_container.bounds] CGPath];
    //card animation
    float x , y , width, height;
    x = _textview_container.frame.origin.x;
    y = _textview_container.frame.origin.y;
    width = _textview_container.bounds.size.width;
    height = _textview_container.bounds.size.height;
    NSLog(@"%f %f, %f, %f", x, y, width, height);
    [UIView animateWithDuration:0.6 animations:^{
        _textview_container.frame = CGRectMake(x, y + 130 , width, height);
    }];
    //shadows for individual buttons
    CALayer *button4 = self.level_4.layer;
    button4.shadowOffset  = CGSizeMake(1, 1);
    button4.shadowColor   = [[UIColor blackColor] CGColor];
    button4.shadowRadius  = 10.0f;
    button4.shadowOpacity = 0.40f;
    button4.cornerRadius = self.level_4.frame.size.width / 2;
    button4.shadowPath    = [[UIBezierPath bezierPathWithRect:_level_4.bounds] CGPath];
    [_level1 clipsToBounds];
    //shadows for individual buttons
    CALayer *button1 = self.level1.layer;
    button1.shadowOffset  = CGSizeMake(1, 1);
    button1.shadowColor   = [[UIColor blackColor] CGColor];
    button1.shadowRadius  = 10.0f;
    button1.shadowOpacity = 0.40f;
    button1.cornerRadius = self.level1.frame.size.width / 2;
    button1.shadowPath    = [[UIBezierPath bezierPathWithRect:_level1.bounds] CGPath];
    [_level1 clipsToBounds];
    //fetch completion ints
    int  lvl_2, lvl_3, lvl_4, lvl_5;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    lvl_2 = [defaults integerForKey :@"level_2"];
    lvl_3 = [defaults integerForKey :@"level_3"];
    lvl_4 = [defaults integerForKey :@"level_4"];
    lvl_5 = [defaults integerForKey :@"level_5"];
    //run integer thorugh sockets to check for completion
    if (lvl_2 == 1) {
        _level_2.enabled = YES;
        CALayer *button2 = self.level_2.layer;
        button2.shadowOffset  = CGSizeMake(1, 1);
        button2.shadowColor   = [[UIColor blackColor] CGColor];
        button2.shadowRadius  = 10.0f;
        button2.shadowOpacity = 0.40f;
        button2.cornerRadius = self.level_2.frame.size.width / 2;
        button2.shadowPath    = [[UIBezierPath bezierPathWithRect:_level_2.bounds] CGPath];
        [_level_2 clipsToBounds];
    }
    else{
        _level_2.enabled = YES;
    }
    //
    if (lvl_3 == 1) {
        ///**** TEMP  NO *****///
        _level_3.enabled = NO;
        CALayer *button3 = self.level_3.layer;
        button3.shadowOffset  = CGSizeMake(1, 1);
        button3.shadowColor   = [[UIColor blackColor] CGColor];
        button3.shadowRadius  = 10.0f;
        button3.shadowOpacity = 0.40f;
        button3.cornerRadius = self.level_3.frame.size.width / 2;
        button3.shadowPath    = [[UIBezierPath bezierPathWithRect:_level_3.bounds] CGPath];
        [_level_3 clipsToBounds];
    }
    else{
        _level_3.enabled = NO;
    }
}
-(void)viewDidAppear:(BOOL)animated{
    //init with uibutton transition
    //button 2 level 2
    [UIView transitionWithView:_level_2 duration:0.2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        _level_2.alpha = 1;
    }completion:nil];
    //button 3 level 3
    [UIView transitionWithView:_level_3 duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        _level_3.alpha = 1;
    }completion:nil];
    //button 4 level 4
    [UIView transitionWithView:_level_4 duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        _level_4.alpha = 1;
    }completion:nil];
    
}
- (IBAction)level_1:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to level 1
    //done on storyboard
}
- (IBAction)level2:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to level 2
    //done on storyboard
}
- (IBAction)settings_button:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to settings view
}
- (IBAction)level_4:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to settings view
}
- (IBAction)highscore_button:(id)sender {
    //init with highscore views
    //did animate highscore view
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _highscore_view.frame = CGRectMake(x_high, y_high, width_high, height_high);
    }completion:nil];
    
    //push highscre values
    //colorblind
   [_colorblind_sc setText:[NSString stringWithFormat:@"%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"]]];
    //sg50
    [_SG50_sc setText:[NSString stringWithFormat:@"%0.1f", [[NSUserDefaults standardUserDefaults] floatForKey:@"1_fast_tim"]]];
    //changi
    [_changi_sc setText:[NSString stringWithFormat:@"%0.1f", [[NSUserDefaults standardUserDefaults]floatForKey:@"2_fast_tim"]]];
    
}

- (IBAction)back:(id)sender {
    //return to main view
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _highscore_view.frame = CGRectMake(x_high, -height_high - 10, width_high, height_high);
    }completion:nil];
}
@end
