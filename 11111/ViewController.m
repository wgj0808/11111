//
//  ViewController.m
//  11111
//
//  Created by Mac_wgj on 16/3/11.
//  Copyright © 2016年 Mac_wgj. All rights reserved.
//

#import "ViewController.h"
#import "teeteViewController.h"
#import "wgjTest.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *targetStr = @"(.*/page/main\\.do.*)|(.*/activity/main\\.do.*)|(.*/gift/.*\\.do.*)|(.*/alipayapi.jsp.*)|(.*/login.jsp.*)|(.*/register.jsp.*)|(.*/searh.jsp.*)|(.*/questionaire/.*\\.do.*)|(.*/eticket/.*\\.do.*)";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",targetStr] ;
    
    NSString *testStr = @"/page/min.do";
    
    if ([predicate evaluateWithObject:testStr]) {
        NSLog(@"Match");
    }else{
        NSLog(@"NotMatch");
    }
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn addTarget:self action:@selector(clickPush) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setImage:[UIImage imageNamed:@"test01"] forState:(UIControlStateNormal)];
    btn.backgroundColor = [UIColor redColor];
//    btn.enabled = NO;
//    btn.userInteractionEnabled = NO;
    btn.frame = CGRectMake(100, 100, 100, 40);
    [self.view addSubview:btn];

    
//    self.navigationItem.RightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"tewt5" style:(UIBarButtonItemStyleDone) target:self action:nil];
    
   
    
}

- (void)clickPush
{
    teeteViewController *tee = [[teeteViewController alloc] init];
    [self.navigationController pushViewController:tee animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
