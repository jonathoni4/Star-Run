//
//  ViewController.h
//  Star Run
//
//  Created by Joey Irigoyen on 5/22/15.
//  Copyright (c) 2015 JonnyboyApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>



int Y;
BOOL Start;
int RandomPosition;
int ScoreNumber;
long HighScore;


@interface ViewController: UIViewController <ADBannerViewDelegate>

{
    IBOutlet UILabel *Intro1;
    IBOutlet UILabel *Intro2;
    IBOutlet UILabel *Intro3;
    
    IBOutlet UIImageView *Rock;
    
    NSTimer *timer;
    
    IBOutlet UIImageView *Obstacle;
    IBOutlet UIImageView *Obstacle2;
    IBOutlet UIImageView *Obstacle3;
    IBOutlet UIImageView *Obstacle4;
      
    
   
    
    
    IBOutlet UILabel *Score;
    
    NSTimer *Scorer;
    
    
    
    
}



-(void)RockMove;
-(void)Collision;
-(void)EndGame;
-(void)NewGame;
-(void)Scoring;
-(void)aTime;


@end
