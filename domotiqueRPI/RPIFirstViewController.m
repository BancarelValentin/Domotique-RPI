//
//  RPIFirstViewController.m
//  domotiqueRPI
//
//  Created by BancarelValentin on 08/04/2014.
//  Copyright (c) 2014 BancarelValentin. All rights reserved.
//

#import "RPIFirstViewController.h"
#import "../NMSSH/NMSSH.h"

@interface RPIFirstViewController ()

@end

@implementation RPIFirstViewController

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

- (IBAction)bt0:(id)sender {
    [self switchMe:@"0"];
}

- (IBAction)bt1:(id)sender {
    [self switchMe:@"1"];
}

- (IBAction)bt2:(id)sender {
    [self switchMe:@"2"];
}

- (IBAction)bt3:(id)sender {
    [self switchMe:@"3"];
}

- (IBAction)bt4:(id)sender {
    [self switchMe:@"4"];
}

- (IBAction)bt5:(id)sender {
    [self switchMe:@"5"];
}

- (IBAction)bt6:(id)sender {
    [self switchMe:@"6"];
}

- (IBAction)bt7:(id)sender {
    [self switchMe:@"7"];
}

-(void)switchMe:(NSString*)toSwitch{
    NSLog(@"attempt to switch pin %@",toSwitch);
    
    NSError *error = nil;
    NSString *maCommande = [NSString stringWithFormat:@"gpio read %@", toSwitch];
    NSString *response = [self.session.channel execute:maCommande error:&error];
    response = [response stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([response isEqualToString:(@"1")]) {
        maCommande = [NSString stringWithFormat:@"gpio write %@ 0", toSwitch];
    } else {
        maCommande = [NSString stringWithFormat:@"gpio write %@ 1", toSwitch];
    }
    [self.session.channel execute:maCommande error:&error];
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
