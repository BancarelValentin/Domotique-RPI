//
//  RPISecondViewController.h
//  domotiqueRPI
//
//  Created by BancarelValentin on 08/04/2014.
//  Copyright (c) 2014 BancarelValentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../NMSSH/NMSSH.h"
#import <iAd/iAd.h>

@interface RPISecondViewController : UIViewController<ADBannerViewDelegate>{
    
    ADBannerView *bannerView;
}

@property (nonatomic,strong) NMSSHSession *session;

- (IBAction)allOn:(id)sender;
- (IBAction)allOff:(id)sender;
- (IBAction)allSwitch:(id)sender;
- (IBAction)allInit:(id)sender;

@end
