//
//  RPIFirstViewController.h
//  domotiqueRPI
//
//  Created by BancarelValentin on 08/04/2014.
//  Copyright (c) 2014 BancarelValentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../NMSSH/NMSSH.h"
#import <iAd/iAd.h>
@interface RPIFirstViewController : UIViewController<ADBannerViewDelegate>{
    
    ADBannerView *bannerView;
}

@property (nonatomic,strong) NMSSHSession *session;

- (IBAction)bt0:(id)sender;
- (IBAction)bt1:(id)sender;
- (IBAction)bt2:(id)sender;
- (IBAction)bt3:(id)sender;
- (IBAction)bt4:(id)sender;
- (IBAction)bt5:(id)sender;
- (IBAction)bt6:(id)sender;
- (IBAction)bt7:(id)sender;

@end
