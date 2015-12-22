//
//  ViewController.m
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-3.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    __block int missilesToLaunch = 0;
//    
//    RACSignal *processedSignal = [[RACSignal
//                                   return:@"missiles"]
//                                  map:^(id x) {
//                                      missilesToLaunch++;
//                                      return [NSString stringWithFormat:@"will launch %d %@", missilesToLaunch, x];
//                                  }];
//    
//    // This will print "First will launch 1 missiles"
//    [processedSignal subscribeNext:^(id x) {
//        NSLog(@"First %@", x);
//    }];
//    
//    // This will print "Second will launch 2 missiles"
//    [processedSignal subscribeNext:^(id x) {
//        NSLog(@"Second %@", x);
//    }];
//
//    RACMulticastConnection *connection = [processedSignal multicast:[RACReplaySubject subject]];
//    [connection connect];
//    
//    [connection.signal subscribeNext:^(id response) {
//        NSLog(@"subscriber one: %@", response);
//    }];
//    
//    [connection.signal subscribeNext:^(id response) {
//        NSLog(@"subscriber two: %@", response);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
