//
//  sortViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/2.
//

#import "sortViewController.h"

@interface sortViewController ()

@end

@implementation sortViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpeg"]];
    _backImageView.frame = CGRectMake(0, - 23, self.view.frame.size.width, self.view.frame.size.height + 23);
    [self.view addSubview:_backImageView];
    

    _sortXButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sortXButton setTitle:@"Sort" forState:UIControlStateNormal];
    _sortXButton.layer.masksToBounds = YES;
    _sortXButton.layer.cornerRadius = 10;
    _sortXButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _sortXButton.titleLabel.textColor = [UIColor redColor];
    _sortXButton.layer.borderWidth = 2;
    _sortXButton.layer.borderColor = newColor;
    _sortXButton.frame = CGRectMake(140, 400, 120, 40);
    [_sortXButton addTarget:self action:@selector(pressSort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sortXButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.layer.masksToBounds = YES;
    _backButton.layer.cornerRadius = 10;
    _backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _backButton.titleLabel.textColor = [UIColor redColor];
    _backButton.layer.borderWidth = 2;
    _backButton.layer.borderColor = newColor;
    _backButton.frame = CGRectMake(140, 480, 120, 40);
    [_backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pressSort {
    NSLog(@"%@-A", _array3);
    for (int i = 0; i < _array3.count - 1; i ++) {
        for (int j = 0; j < _array3.count - i - 1; j ++) {
            if ([_array3[j] intValue] > [_array3[j + 1] intValue]) {
                int t = [_array3[j] intValue];
                _array3[j] = _array3[j + 1];
                _array3[j + 1] =[NSString stringWithFormat:@"%d", t];
                
                NSString* t1 = _array1[j];
                _array1[j] = _array1[j + 1];
                _array1[j + 1] = t1;
                
                NSString* t2 = _array2[j];
                _array2[j] = _array2[j + 1];
                _array2[j + 1] = t2;
                
            }
        }
    }
    NSLog(@"%@", _array3);
    [_delegate sotrrtssage1:_array1 :_array2 :_array3];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
