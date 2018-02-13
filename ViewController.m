//
//  ViewController.m
//  Star Run
//
//  Created by Joey Irigoyen on 5/22/15.
//  Copyright (c) 2015 JonnyboyApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)Collision{
    
    if (CGRectIntersectsRect(Rock.frame, Obstacle.frame)) {
        [self EndGame];
    
    }
    
    if (CGRectIntersectsRect(Rock.frame, Obstacle2.frame)) {
        [self EndGame];
    }
    
    if (CGRectIntersectsRect(Rock.frame, Obstacle3.frame)){
        [self EndGame];
        
    }
    
    if (CGRectIntersectsRect(Rock.frame, Obstacle4.frame)) {
        [self EndGame];
    }
    
    
    if(Rock.center.y > 265){
        [self EndGame];
    }
    
    if(Rock.center.y < 55) {
        [self EndGame];
    }
    
        
    
}
-(void)Scoring{
    
    
    
    ScoreNumber = ScoreNumber + 1;
    Score.text = [NSString stringWithFormat:@"Score: %i", ScoreNumber];
    
    
    
    
}



-(void)EndGame{
    
    if (ScoreNumber > HighScore) {
        HighScore = ScoreNumber;
        [ [NSUserDefaults standardUserDefaults] setInteger:HighScore forKey:@"HighScoreSaved"];
    }
    
    
    
    
    Rock.hidden = YES;
    [timer invalidate];
    [Scorer invalidate];
    
    
    [self performSelector:@selector(NewGame) withObject:nil afterDelay:1];
}


-(void)NewGame{
    
    
    Obstacle.hidden = YES;
    Obstacle2.hidden = YES;
    Obstacle3.hidden = YES;
    Obstacle4.hidden = YES;
    Score.hidden = YES;
    
    Rock.hidden = NO;
    Intro1.hidden = NO;
    Intro2.hidden = NO;
    Intro3.hidden = NO;
    
    Rock.hidden = NO;
    Rock.center = CGPointMake(16, 138);
    Rock.image = [UIImage imageNamed:@"rocket.png"];
    
    Start = YES;
    ScoreNumber = 0;
    Score.text = [NSString stringWithFormat:@"Score: 0"];
    Intro3.text = [NSString stringWithFormat:@"High Score: %li", HighScore];
    
    
}


-(void)RockMove{
    
    [self Collision];
    
    Rock.center = CGPointMake(Rock.center.x, Rock.center.y + Y);
    
    Obstacle.center = CGPointMake(Obstacle.center.x - 10, Obstacle.center.y);
    Obstacle2.center = CGPointMake(Obstacle2.center.x - 10, Obstacle2.center.y);
    Obstacle3.center = CGPointMake(Obstacle3.center.x -10, Obstacle3.center.y);
    Obstacle4.center = CGPointMake(Obstacle4.center.x -10, Obstacle4.center.y);
    
    
    
    if (Obstacle.center.x < 0) {
        RandomPosition = arc4random() %100;
        RandomPosition = RandomPosition + 110;
        Obstacle.center = CGPointMake(510, 220);
    }
    
    if (Obstacle2.center.x < 0) {
        RandomPosition = arc4random() %100;
        RandomPosition = RandomPosition + 110;
        Obstacle2.center = CGPointMake(510, 90);
        
    }
    
    if (Obstacle3.center.x < 0) {
        RandomPosition = arc4random() %100;
        RandomPosition = RandomPosition + 110;
        Obstacle3.center = CGPointMake(510, 90);
    }
    
    if (Obstacle4.center.x < 0) {
        RandomPosition = arc4random() %100;
        RandomPosition = RandomPosition + 110;
        Obstacle4.center = CGPointMake(510, 220);
    }
    
    
    
}



    
    
    
    




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (Start == YES) {
        
        Intro1.hidden = YES;
        Intro2.hidden = YES;
        Intro3.hidden = YES;
       
                 timer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(RockMove) userInfo:nil repeats:YES];
        
        
        Start = NO;
        
        
        Rock.hidden = NO;
        Obstacle.hidden = NO;
        Obstacle2.hidden = NO;
        Obstacle3.hidden = NO;
        Obstacle4.hidden = NO;
        
        
        RandomPosition = arc4random() %74;
        RandomPosition = RandomPosition + 110;
        Obstacle.center = CGPointMake(530, 230);
        
        
        RandomPosition = arc4random() %74;
        RandomPosition = RandomPosition + 110;
        Obstacle2.center = CGPointMake(400, 100);
        
        RandomPosition = arc4random() %74;
        RandomPosition = RandomPosition + 110;
        Obstacle3.center = CGPointMake(660, 100);
        
        
        RandomPosition = arc4random() %74;
        RandomPosition = RandomPosition + 110;
        Obstacle4.center = CGPointMake(790, 230);
        
        
        
        
        
        
    }
    
    Y = -7;
    Rock.image = [UIImage imageNamed:@"Rocket.png"];
    Start = YES;
    
    ScoreNumber = ScoreNumber + 1;
    Score.text = [NSString stringWithFormat:@"Score: %i", ScoreNumber];
    Start = NO;

    
}






-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    Y = 7;
    Rock.image = [UIImage imageNamed:@"Rocket.png"];
    
    
}

- (void)viewDidLoad
{
    
  
    Start = YES;
    
    Obstacle.hidden = YES;
    Obstacle2.hidden = YES;
    Obstacle3.hidden = YES;
    Obstacle4.hidden = YES;
    
    HighScore = [ [NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"] ;
    Intro3.text = [NSString stringWithFormat:@"HighScore: %li", HighScore];
    
    
    
        
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
