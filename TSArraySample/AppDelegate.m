//
//  AppDelegate.m
//  TSArraySample
//
//  Created by apple on 2020/10/22.
//  Copyright © 2020 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "TSMArray.h"
#import "STArrayEx.h"

@interface AppDelegate ()
{
    TSMArray *tsArray;
    STArrayEx * exArray;
    NSThread *ta;
    NSThread *tb;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    tsArray = [TSMArray new];
    exArray = [STArrayEx new];
    ta = [[NSThread alloc] initWithBlock:^{
        while (1) {
            for (int i = 0; i < 100; i++) {
                NSLog(@"add");
                [self->tsArray operation:0 data:[NSNumber numberWithInt:i]];
            }
            for (int i = 0; i < 100; i++) {
                NSLog(@"add ex");
                [self->exArray add:[NSNumber numberWithInt:i]];
            }
        }
    }];
    
    tb = [[NSThread alloc] initWithBlock:^{
        while (1) {
            for (int i = 0; i < 100; i++) {
                NSLog(@"remove");
                [self->tsArray operation:1 data:[NSNumber numberWithInt:i]];
            }
            for (int i = 0; i < 100; i++) {
                NSLog(@"remove ex");
                [self->exArray remove:[NSNumber numberWithInt:i]];
            }
        }
    }];
    
    [ta start];
    [tb start];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
