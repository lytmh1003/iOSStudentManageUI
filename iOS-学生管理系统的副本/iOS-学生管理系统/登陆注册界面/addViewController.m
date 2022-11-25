//
//  addViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "addViewController.h"
#import "FristViewController.h"

@interface addViewController ()

@end

@implementation addViewController

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
    _nameText.placeholder = @"| 新生姓名";
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
    _classText.placeholder = @"| 班级";
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
    [self.view addSubview:_classText];
    
    _markText = [[UITextField alloc] init];
    _markText.frame = CGRectMake(70, 690, 270, 40);
    _markText.placeholder = @"| 请输入成绩";
    _markText.borderStyle = UITextBorderStyleRoundedRect;
    _markText.keyboardType = UIKeyboardTypeURL;
    // 输入框的图片
    UIImageView* imageViewleftUerName3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chengji.png"]];
    imageViewleftUerName3.frame = CGRectMake(72, 690, 10, 10);
    _markText.leftView = imageViewleftUerName3;
    // 设置左边的view永远显示
    _markText.leftViewMode = UITextFieldViewModeAlways;
    // textField协议
    _markText.delegate = self;
    [self.view addSubview:_markText];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addButton setTitle:@"Sure Add" forState:UIControlStateNormal];
    _addButton.layer.masksToBounds = YES;
    _addButton.layer.cornerRadius = 10;
    _addButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _addButton.titleLabel.textColor = [UIColor redColor];
    _addButton.layer.borderWidth = 2;
    _addButton.layer.borderColor = newColor;
    _addButton.frame = CGRectMake(140, 740, 120, 40);
    [_addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addButton];
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.layer.masksToBounds = YES;
    _backButton.layer.cornerRadius = 10;
    _backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _backButton.titleLabel.textColor = [UIColor redColor];
    _backButton.layer.borderWidth = 2;
    _backButton.layer.borderColor = newColor;
    _backButton.frame = CGRectMake(140, 800, 120, 40);
    [_backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    
    for (int i = 1; i < _array1.count + 1; i ++) {
        UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, i * 60, 80, 40)];
        nameLabel.text = _array1[i - 1];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:19];
        [self.view addSubview:nameLabel];
        
        
        UILabel* classLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, i * 60, 80, 40)];
        classLabel.textColor = [UIColor whiteColor];
        classLabel.font = [UIFont systemFontOfSize:19];
        classLabel.text = _array2[i - 1];
        [self.view addSubview:classLabel];
        
        
        UILabel* markLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, i * 60, 80, 40)];
        markLabel.textColor = [UIColor whiteColor];
        markLabel.font = [UIFont systemFontOfSize:19];
        markLabel.text = _array3[i - 1];
        [self.view addSubview:markLabel];
    }
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pressAdd {
    int bool1 = 0;
    int bool2 = 1;
    NSString* name = _nameText.text;
    NSString* class = _classText.text;
    NSString* mark = _markText.text;
    int x = [mark intValue];
    if ([name isEqualToString:@""] || [class isEqualToString:@""] || [mark isEqualToString:@""] || x > 150 || x < 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入错误！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
        _nameText.text = nil;
        _classText.text = nil;
        _markText.text = nil;
        bool2 = 0;
    }
    for (int i = 0; i < _array1.count; i ++) {
        if ([class isEqualToString: _array2[i]]) {
            if ([name isEqualToString:_array1[i]]) {
                bool1 = 1;
                break;
            }
        }
    }
    if (bool1 == 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"该班级已存在该学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (bool2 == 1 && bool1 == 0){
        [_array1 addObject:name];
        [_array2 addObject:class];
        [_array3 addObject:mark];
        [_delegate addMessage:_array1 :_array2 :_array3];
        [self dismissViewControllerAnimated:YES completion:nil];
//        [self.navigationController popViewControllerAnimated:YES];
//        FristViewController* v1 = [[FristViewController alloc] init];
//        [self. navigationController pushViewController:v1 animated:YES];
    }
    _nameText.text = nil;
    _classText.text = nil;
    _markText.text = nil;
}
//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_nameText resignFirstResponder];
    [_classText resignFirstResponder];
    [_markText resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.view.frame = CGRectMake(0.0f, - 100.0f / .5f, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, 0, self.view.frame.size.width,self.view.frame.size.height);
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
