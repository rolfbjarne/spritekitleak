//
//  AppDelegate.m
//  spritekitleak
//
//  Created by Rolf Bjarne Kvinge on 01/04/14.
//  Copyright (c) 2014 Rolf Bjarne Kvinge. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "AppDelegate.h"

@implementation AppDelegate

UIWindow *window = nil;
UIViewController *vc = nil;
UIViewController *vc2 = nil;
UINavigationController *nvc = nil;
UIButton *button = nil;
BOOL showing = NO;

void buttonClick ()
{
    
    if (showing) {
        [nvc popViewControllerAnimated:YES];
    } else {
//    var vc2 = new UIViewController ();
    vc2 = [[UIViewController alloc] init];
//    var skView = new SKView (window.Bounds);
    SKView *skView = [[SKView alloc] initWithFrame:window.bounds];
//    vc2.View.AddSubview (skView);
    [vc2.view addSubview:skView];
    
    // Create and configure the scene.
//    var scene = new SKScene (skView.Bounds.Size);
    SKScene *scene = [[SKScene alloc] initWithSize:skView.bounds.size];
//    scene.ScaleMode = SKSceneScaleMode.AspectFill;
    scene.scaleMode  = SKSceneScaleModeAspectFill;
    
    // Present the scene.
//    skView.PresentScene(scene);
    [skView presentScene:scene];
    
    //nvc.PushViewController (vc2, true);
    [nvc pushViewController:vc2 animated:YES];
//    GC.Collect ();
    }
    
    showing = !showing;
    
    int64_t delayInSeconds = 2; // Your Game Interval as mentioned above by you
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        buttonClick ();
    });
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    window.backgroundColor = [UIColor whiteColor];
    
    //vc = new UIViewController ();
    vc = [[UIViewController alloc] init];
//    button = new UIButton (window.Bounds);
    button = [[UIButton alloc] initWithFrame: window.bounds];
//    button.BackgroundColor = UIColor.Blue;
    [button setBackgroundColor: [UIColor whiteColor]];
//    button.SetTitle ("Go to SKScene", UIControlState.Normal);
    [button setTitle:@"Go to SKScene" forState:UIControlStateNormal];
    
    
    //vc.View.AddSubview (button);
    [vc.view addSubview:button];
    
    nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    window.rootViewController = nvc;
    
    [window makeKeyAndVisible];
    
    int64_t delayInSeconds = 2; // Your Game Interval as mentioned above by you
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        buttonClick ();
    });
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
