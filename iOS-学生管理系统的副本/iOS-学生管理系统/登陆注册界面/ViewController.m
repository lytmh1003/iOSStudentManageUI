//
//  ViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "ViewController.h"
#import "LoadingViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageViewLoad = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpeg"]];
    _imageViewLoad.frame = CGRectMake(0, - 23, self.view.frame.size.width, self.view.frame.size.height + 23);
    [self.view addSubview:_imageViewLoad];
    
    
    // 定时挑转界面
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop]addTimer:myTimer forMode:NSDefaultRunLoopMode];
    
}
- (void)timeOut {
    LoadingViewController* ViewLand = [[LoadingViewController alloc] init];
    ViewLand.view.backgroundColor = [UIColor whiteColor];
    
    UIWindow* window = [UIApplication sharedApplication].windows[0];
    window.rootViewController = ViewLand;
}

@end
