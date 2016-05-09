//
//  wgjTest.m
//  11111
//
//  Created by Mac_wgj on 16/4/15.
//  Copyright © 2016年 Mac_wgj. All rights reserved.
//

#import "wgjTest.h"

@interface wgjTest ()

@end

@implementation wgjTest

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerGo) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}



- (void)timerGo
{
    NSLog(@"tee - timer - go");
}


- (void)dealloc
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    NSLog(@"tee - wgjTest - dealloc");
}

@end
