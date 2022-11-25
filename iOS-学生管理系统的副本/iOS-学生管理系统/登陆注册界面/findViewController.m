//
//  findViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "findViewController.h"

@interface findViewController ()

@end

@implementation findViewController

- (void)viewDidLoad {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpeg"]];
    _backImageView.frame = CGRectMake(0, - 23, self.view.frame.size.width, self.view.frame.size.height + 23);
    [self.view addSubview:_backImageView];
    
    _nameText = [[UITextField alloc] init];
    _nameText.frame = CGRectMake(70, 550, 270, 40);
    _nameText.placeholder = @"| 输入查询学生的姓名";
    _nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText.keyboardType = UIKeyboardTypeURL;
    // 输入框的图片
    UIImageView* imageViewleftUerName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yonghuming.png"]];
    imageViewleftUerName.frame = CGRectMake(72, 550, 10, 10);
    _nameText.leftView = imageViewleftUerName;
    // 设置左边的view永远显示
    _nameText.leftViewMode = UITextFieldViewModeAlways;
    // textField协议
    _nameText.delegate = self;
    [self.view addSubview:_nameText];
    
    _classText = [[UITextField alloc] init];
    _classText.frame = CGRectMake(70, 620, 270, 40);
    _classText.placeholder = @"| 输入查询学生的班级";
    _classText.borderStyle = UITextBorderStyleRoundedRect;
    _classText.keyboardType = UIKeyboardTypeURL;
    // 输入框的图片
    UIImageView* imageViewleftUerName2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji.png"]];
    imageViewleftUerName2.frame = CGRectMake(72, 620, 8, 8);
    _classText.leftView = imageViewleftUerName2;
    // 设置左边的view永远显示
    _classText.leftViewMode = UITextFieldViewModeAlways;
    // textField协议
    _classText.delegate = self;
//    [self.view addSubview:_classText];
    
    _findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_findButton setTitle:@"Sure Find" forState:UIControlStateNormal];
    _findButton.layer.masksToBounds = YES;
    _findButton.layer.cornerRadius = 10;
    _findButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _findButton.titleLabel.textColor = [UIColor redColor];
    _findButton.layer.borderWidth = 2;
    _findButton.layer.borderColor = newColor;
    _findButton.frame = CGRectMake(140, 670, 120, 40);
    [_findButton addTarget:self action:@selector(pressFind) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_findButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.layer.masksToBounds = YES;
    _backButton.layer.cornerRadius = 10;
    _backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _backButton.titleLabel.textColor = [UIColor redColor];
    _backButton.layer.borderWidth = 2;
    _backButton.layer.borderColor = newColor;
    _backButton.frame = CGRectMake(140, 730, 120, 40);
    [_backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];

}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pressFind {
    int bool1 = 0;
    NSString* name = _nameText.text;
//    NSString* class = _classText.text;
    if ([name isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    int i;
    _array = [[NSMutableArray alloc] init];
    for (i = 0; i < _array1.count; i ++) {
//        if ([class isEqualToString: _array2[i]]) {
            if ([name isEqualToString:_array1[i]]) {
                bool1 = 1;
//                break;
                NSString* str = [NSString stringWithFormat:@"%d", i];
                [_array addObject:str];
            }
//        }
    }
    NSLog(@"count %ld", _array.count);
    if (bool1 == 1) {
        for (int j = 1; j < _array.count + 1; j ++) {
            int intStr = [_array[j - 1] intValue];
            UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70 * j, 100, 40)];
            nameLabel.text = _array1[intStr];
            nameLabel.textColor = [UIColor whiteColor];
            nameLabel.font = [UIFont systemFontOfSize:21];
            [self.view addSubview:nameLabel];
            
            UILabel* classLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70 * j, 100, 40)];
            classLabel.text = _array2[intStr];
            classLabel.textColor = [UIColor whiteColor];
            classLabel.font = [UIFont systemFontOfSize:21];
            [self.view addSubview:classLabel];
            
            UILabel* markLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 70 * j, 100, 40)];
            markLabel.text = _array3[intStr];
            markLabel.textColor = [UIColor whiteColor];
            markLabel.font = [UIFont systemFontOfSize:21];
            [self.view addSubview:markLabel];
        }
        _nameText.text = nil;
        _classText.text = nil;
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"查询驳回，检查输入是否有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    }
        
        
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_nameText resignFirstResponder];
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
