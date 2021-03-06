//
//  Main_Menu_Launchpad.h
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "AVFoundation/AVAudioPlayer.h"


@interface Main_Menu_Launchpad : UIViewController{
    AVAudioPlayer *audioPlayer;
};

- (IBAction)level_1:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *level1;
@property (strong, nonatomic) IBOutlet UIButton *level_2;
- (IBAction)level2:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *level_3;
@property (strong, nonatomic) IBOutlet UIButton *level_4;
- (IBAction)level_4:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *main_view;


@property (strong, nonatomic) IBOutlet UIView *highscore_view;
@property (strong, nonatomic) IBOutlet UIButton *highscore_button;
- (IBAction)highscore_button:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *settings_button;
- (IBAction)settings_button:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *colorblind_sc;

//SCORE OUTLETS ^
@property (strong, nonatomic) IBOutlet UILabel *SG50_sc;
@property (strong, nonatomic) IBOutlet UILabel *changi_sc;
- (IBAction)back:(id)sender;


@end
