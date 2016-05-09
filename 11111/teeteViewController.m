//
//  teeteViewController.m
//  11111
//
//  Created by Mac_wgj on 16/3/17.
//  Copyright © 2016年 Mac_wgj. All rights reserved.
//

#import "teeteViewController.h"
#import "wgjTest.h"
#import "UIImage+MDQRCode.h"
@interface teeteViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) wgjTest *wgj;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *textF;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation teeteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *vWhiteView = [[UIView alloc] initWithFrame:CGRectMake(100 , 100,  136 , 250)];
    vWhiteView.layer.cornerRadius = 2;
    vWhiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:vWhiteView];
    
    //二维码
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(18 ,18 , CGRectGetWidth(vWhiteView.frame)-36 ,CGRectGetWidth(vWhiteView.frame)-36)];
    
    [vWhiteView addSubview:imageView];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.image = [UIImage mdQRCodeForString:[NSString stringWithFormat:@"%@",@"12312"] size:imageView.bounds.size.width fillColor:[UIColor blackColor]];
    
    
    //二维码
    self.imgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 350, 100, 100)];
    
    [self.view addSubview:_imgView];
    
    [self erweima];

    
//    [self.view addSubview:self.tableView];
//    
//    UIView *btn = [[UIView alloc] init];
////    [btn addTarget:self action:@selector(clickB) forControlEvents:(UIControlEventTouchUpInside)];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickB)];
//    [btn addGestureRecognizer:tap];
////     btn.userInteractionEnabled = NO;
//    btn.backgroundColor = [UIColor redColor];
//    btn.frame = CGRectMake(100, 100, 100, 40);
//    [self.view addSubview:btn];
//    
//    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [btn2 addTarget:self action:@selector(clickC) forControlEvents:(UIControlEventTouchUpInside)];
////    btn2.userInteractionEnabled = NO;
//    btn2.backgroundColor = [UIColor greenColor];
//    btn2.frame = CGRectMake(5, 5, 90, 20);
//    [btn addSubview:btn2];
//    
//    _textF = [[UITextField alloc] initWithFrame:CGRectMake(0, 64, 100, 30)];
//    _textF.backgroundColor = [UIColor grayColor];
//    _textF.text = @"12";
//    [self.view addSubview:_textF];
    
 
}

-(void)erweima

{
    
    //二维码滤镜
    
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //恢复滤镜的默认属性
    
    [filter setDefaults];
    
    //将字符串转换成NSData
    
    NSData *data=[@"12312" dataUsingEncoding:NSUTF8StringEncoding];
    
    //通过KVO设置滤镜inputmessage数据
    
    [filter setValue:data forKey:@"inputMessage"];
    
    //获得滤镜输出的图像
    
    CIImage *outputImage=[filter outputImage];
    
    //将CIImage转换成UIImage,并放大显示
    
    _imgView.image=[self createNonInterpolatedUIImageFormCIImage:outputImage withSize:50.0];
    
    
    
    //如果还想加上阴影，就在ImageView的Layer上使用下面代码添加阴影
    
    _imgView.layer.shadowOffset=CGSizeMake(0, 0.5);//设置阴影的偏移量
    
    _imgView.layer.shadowRadius=1;//设置阴影的半径
    
    _imgView.layer.shadowColor=[UIColor blackColor].CGColor;//设置阴影的颜色为黑色
    
    _imgView.layer.shadowOpacity=0.3;
    
    
    
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 创建bitmap;
    
    size_t width = CGRectGetWidth(extent) * scale;
    
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    
    CGContextScaleCTM(bitmapRef, scale, scale);
    
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 保存bitmap到图片
    
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    CGContextRelease(bitmapRef);
    
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
    
}



- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 150, 300, 150) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:str];
    }
    cell.textLabel.text = @"🐟";
    cell.backgroundColor = [UIColor grayColor];
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn1 addTarget:self action:@selector(clickDis) forControlEvents:(UIControlEventTouchUpInside)];
//    btn1.userInteractionEnabled = NO;
    btn1.backgroundColor = [UIColor redColor];
    btn1.frame = CGRectMake(10, 0, 100, 40);
    [cell addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn2 addTarget:self action:@selector(clickC) forControlEvents:(UIControlEventTouchUpInside)];
//    btn2.userInteractionEnabled = NO;
    btn2.backgroundColor = [UIColor redColor];
    btn2.frame = CGRectMake(10, 0, 100, 40);
    [cell addSubview:btn2];
    
    // Configure the cell...
    
    return cell;

}

- (void)clickB
{
    NSLog(@"点击下面的button");
}

- (void)clickC
{
    NSLog(@"点击最上面的button");
     _textF.text = @"";
    _textF.placeholder = @"0";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cel - indexPath %ld",indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickPush
{
    //    teeteViewController *dd = [[teeteViewController alloc] init];
    //    [self.navigationController pushViewController:dd animated:YES];
    
//    [self.view addSubview:self.wgj];
    
}
//
//- (wgjTest *)wgj
//{
//    if (!_wgj) {
//        self.wgj = [[wgjTest alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
//        _wgj.backgroundColor = [UIColor grayColor];
//       
//    }
//    return _wgj ;
//}


- (void)clickDis
{
//    [_wgj.timer invalidate];
//    
//    [_wgj removeFromSuperview];
//    _wgj = nil;
    NSLog(@"点击button");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"tee - viewWillDisappear");
}

- (void)dealloc
{
    NSLog(@"");
}

@end
