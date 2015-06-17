//
//  RPISecondViewController.m
//  domotiqueRPI
//
//  Created by BancarelValentin on 08/04/2014.
//  Copyright (c) 2014 BancarelValentin. All rights reserved.
//

#import "RPISecondViewController.h"
#import "../NMSSH/NMSSH.h"


@interface RPISecondViewController ()

@end

@implementation RPISecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    bannerView = [[ADBannerView alloc]initWithFrame:
                  CGRectMake(0, 20, 320, 320)];
    [bannerView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: bannerView];
    
    self.session = [NMSSHSession connectToHost:@"192.168.1.12:22" withUsername:@"ios"];
    
    if (self.session.isConnected) {
        [self.session authenticateByPassword:@"eleveSIO$1314"];
        if (self.session.isAuthorized) {
            NSLog(@"Authentication succeeded bitch");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)allOn:(id)sender {
    NSLog(@"attempt to switch everythings on");
    
    NSError *error = nil;
    [self.session.channel execute:@"gpio write 0 0" error:&error];
    [self.session.channel execute:@"gpio write 1 0" error:&error];
    [self.session.channel execute:@"gpio write 2 0" error:&error];
    [self.session.channel execute:@"gpio write 3 0" error:&error];
    [self.session.channel execute:@"gpio write 4 0" error:&error];
    [self.session.channel execute:@"gpio write 5 0" error:&error];
    [self.session.channel execute:@"gpio write 6 0" error:&error];
    [self.session.channel execute:@"gpio write 7 0" error:&error];

}

- (IBAction)allOff:(id)sender {
    NSLog(@"attempt to switch everythings off");
    
    NSError *error = nil;
    [self.session.channel execute:@"gpio write 0 1" error:&error];
    [self.session.channel execute:@"gpio write 1 1" error:&error];
    [self.session.channel execute:@"gpio write 2 1" error:&error];
    [self.session.channel execute:@"gpio write 3 1" error:&error];
    [self.session.channel execute:@"gpio write 4 1" error:&error];
    [self.session.channel execute:@"gpio write 5 1" error:&error];
    [self.session.channel execute:@"gpio write 6 1" error:&error];
    [self.session.channel execute:@"gpio write 7 1" error:&error];
}

- (IBAction)allSwitch:(id)sender {
    NSLog(@"attempt to switch everythings");
    [self switchMe:@"0"];
    [self switchMe:@"1"];
    [self switchMe:@"2"];
    [self switchMe:@"3"];
    [self switchMe:@"4"];
    [self switchMe:@"5"];
    [self switchMe:@"6"];
    [self switchMe:@"7"];
}

- (IBAction)allInit:(id)sender {
    NSLog(@"attempt to initialise everythings");
    
    NSError *error = nil;
    [self.session.channel execute:@"gpio mode 0 out" error:&error];
    [self.session.channel execute:@"gpio mode 1 out" error:&error];
    [self.session.channel execute:@"gpio mode 2 out" error:&error];
    [self.session.channel execute:@"gpio mode 3 out" error:&error];
    [self.session.channel execute:@"gpio mode 4 out" error:&error];
    [self.session.channel execute:@"gpio mode 5 out" error:&error];
    [self.session.channel execute:@"gpio mode 6 out" error:&error];
    [self.session.channel execute:@"gpio mode 7 out" error:&error];

}




#pragma mark - AdViewDelegates

-(void)bannerView:(ADBannerView *)banner
didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Error loading");
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad loaded");
}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad will load");
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"Ad did finish");
}
@end
