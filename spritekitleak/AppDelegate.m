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
        vc2 = [[UIViewController alloc] init];
        SKView *skView = [[SKView alloc] initWithFrame:window.bounds];
        [vc2.view addSubview:skView];
    
        // Create and configure the scene.
        SKScene *scene = [[SKScene alloc] initWithSize:skView.bounds.size];
        scene.scaleMode  = SKSceneScaleModeAspectFill;
    
        [skView presentScene:scene];
    
        [nvc pushViewController:vc2 animated:YES];
    }
    
    showing = !showing;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        buttonClick ();
    });
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    window.backgroundColor = [UIColor whiteColor];
    
    vc = [[UIViewController alloc] init];
    button = [[UIButton alloc] initWithFrame: window.bounds];
    [button setBackgroundColor: [UIColor whiteColor]];
    [button setTitle:@"Go to SKScene" forState:UIControlStateNormal];
    
    [vc.view addSubview:button];
    
    nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    window.rootViewController = nvc;
    
    [window makeKeyAndVisible];
    
    buttonClick ();
    
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
