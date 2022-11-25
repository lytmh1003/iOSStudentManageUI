//
//  ChangeViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "ChangeViewController.h"
int num;
@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpeg"]];
    _backImageView.frame = CGRectMake(0, - 23, self.view.frame.size.width, self.view.frame.size.height + 23);
    [self.view addSubview:_backImageView];
    
    _nameText = [[UITextField alloc] init];
    _nameText.frame = CGRectMake(70, 550, 270, 40);
    _nameText.placeholder = @"| 输入要修改学生的姓名";
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
    
//    _nameText = [[UITextField alloc] init];
//    _nameText.frame = CGRectMake(70, 550, 270, 40);
//    _nameText.placeholder = @"| 输入要修改学生的姓名";
//    _nameText.borderStyle = UITextBorderStyleRoundedRect;
//    _nameText.keyboardType = UIKeyboardTypeURL;
//    // 输入框的图片
//    UIImageView* imageViewleftUerName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yonghuming.png"]];
//    imageViewleftUerName.frame = CGRectMake(72, 550, 10, 10);
//    _nameText.leftView = imageViewleftUerName;
//    // 设置左边的view永远显示
//    _nameText.leftViewMode = UITextFieldViewModeAlways;
//    // textField协议
//    _nameText.delegate = self;
//    [self.view addSubview:_nameText];
    
    _changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_changeButton setTitle:@"Search" forState:UIControlStateNormal];
    _changeButton.layer.masksToBounds = YES;
    _changeButton.layer.cornerRadius = 10;
    _changeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _changeButton.titleLabel.textColor = [UIColor redColor];
    _changeButton.layer.borderWidth = 2;
    _changeButton.layer.borderColor = newColor;
    _changeButton.frame = CGRectMake(140, 600, 120, 40);
    [_changeButton addTarget:self action:@selector(pressChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_changeButton];
    
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.layer.masksToBounds = YES;
    _backButton.layer.cornerRadius = 10;
    _backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _backButton.titleLabel.textColor = [UIColor redColor];
    _backButton.layer.borderWidth = 2;
    _backButton.layer.borderColor = newColor;
    _backButton.frame = CGRectMake(140, 660, 120, 40);
    [_backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pressChange {
    int bool1 = 0;
    NSString* name = _nameText.text;
    if ([name isEqualToString:@""]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    int i;
    for (i = 0; i < _array1.count; i ++) {
        if ([name isEqualToString: _array1[i]]) {
            if ([name isEqualToString:_array1[i]]) {
                bool1 = 1;
                break;
            }
        }
    }
    num = i;
    if (bool1 == 1) {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
        UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 100, 40)];
        nameLabel.text = _array1[i];
        nameLabel.textColor = [UIColor redColor];
        nameLabel.font = [UIFont systemFontOfSize:21];
        [self.view addSubview:nameLabel];
        
        UILabel* classLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 150, 100, 40)];
        classLabel.text = _array2[i];
        classLabel.textColor = [UIColor redColor];
        classLabel.font = [UIFont systemFontOfSize:21];
        [self.view addSubview:classLabel];
        
        UILabel* markLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 150, 100, 40)];
        markLabel.text = _array3[i];
        markLabel.textColor = [UIColor redColor];
        markLabel.font = [UIFont systemFontOfSize:21];
        [self.view addSubview:markLabel];
        
        _classText = [[UITextField alloc] init];
        _classText.frame = CGRectMake(70, 220, 270, 40);
        _classText.placeholder = @"请输入新的班级";
        _classText.borderStyle = UITextBorderStyleRoundedRect;
        _classText.keyboardType = UIKeyboardTypeURL;
        // 输入框的图片
        UIImageView* imageViewleftUerName2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji.png"]];
        imageViewleftUerName2.frame = CGRectMake(72, 220, 8, 8);
        _classText.leftView = imageViewleftUerName2;
        // 设置左边的view永远显示
        _classText.leftViewMode = UITextFieldViewModeAlways;
        // textField协议
        _classText.delegate = self;
        [self.view addSubview:_classText];
        
        _markText = [[UITextField alloc] init];
        _markText.frame = CGRectMake(70, 290, 270, 40);
        _markText.placeholder = @"| 请输入该学生新的成绩";
        _markText.borderStyle = UITextBorderStyleRoundedRect;
        _markText.keyboardType = UIKeyboardTypeURL;
        // 输入框的图片
        UIImageView* imageViewleftUerName3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chengji.png"]];
        imageViewleftUerName3.frame = CGRectMake(72, 290, 10, 10);
        _markText.leftView = imageViewleftUerName3;
        // 设置左边的view永远显示
        _markText.leftViewMode = UITextFieldViewModeAlways;
        // textField协议
        _markText.delegate = self;
        [self.view addSubview:_markText];
        
//        NSString* class = _classText.text;
//        NSString* mark = _markText.text;
//        [_array2 replaceObjectAtIndex:i withObject:class];
//        [_array3 replaceObjectAtIndex:i withObject:mark];
        _changeButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_changeButton2 setTitle:@"Sure Change" forState:UIControlStateNormal];
        _changeButton2.layer.masksToBounds = YES;
        _changeButton2.layer.cornerRadius = 10;
        _changeButton2.titleLabel.font = [UIFont systemFontOfSize:15];
        _changeButton2.titleLabel.textColor = [UIColor redColor];
        _changeButton2.layer.borderWidth = 2;
        _changeButton2.layer.borderColor = newColor;
        _changeButton2.frame = CGRectMake(140, 340, 120, 40);
        [_changeButton2 addTarget:self action:@selector(pressChange2) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_changeButton2];
        _nameText.text = nil;
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"查询驳回，检查输入是否有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
- (void)pressChange2 {
    NSString* class = _classText.text;
    NSString* mark = _markText.text;
    int x = [mark intValue];
    int bool1 = 1;
    if (x < 0 || x > 150) {
        bool1 = 0;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"请输入正确的成绩！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    if (bool1 == 1) {
        [_array2 replaceObjectAtIndex:num withObject:class];
        [_array3 replaceObjectAtIndex:num withObject:mark];
        [_delegate changeMessage1:_array1 :_array2 :_array3];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
//    [_array2 replaceObjectAtIndex:num withObject:class];
//    [_array3 replaceObjectAtIndex:num withObject:mark];
//    [_delegate changeMessage1:_array1 :_array2 :_array3];
//    [self dismissViewControllerAnimated:YES completion:nil];
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
