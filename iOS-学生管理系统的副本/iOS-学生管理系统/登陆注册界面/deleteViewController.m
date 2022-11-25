  //
//  deleteViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "deleteViewController.h"
#import "FristViewController.h"

@interface deleteViewController ()

@end

@implementation deleteViewController

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
    _nameText.placeholder = @"| 输入要删除学生的姓名";
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
    
    _deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_deleteButton setTitle:@"Sure Delete" forState:UIControlStateNormal];
    _deleteButton.layer.masksToBounds = YES;
    _deleteButton.layer.cornerRadius = 10;
    _deleteButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _deleteButton.titleLabel.textColor = [UIColor redColor];
    _deleteButton.layer.borderWidth = 2;
    _deleteButton.layer.borderColor = newColor;
    _deleteButton.frame = CGRectMake(140, 600, 120, 40);
    [_deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteButton];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_cancelButton setTitle:@"No Delete" forState:UIControlStateNormal];
    _cancelButton.layer.masksToBounds = YES;
    _cancelButton.layer.cornerRadius = 10;
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _cancelButton.titleLabel.textColor = [UIColor redColor];
    _cancelButton.layer.borderWidth = 2;
    _cancelButton.layer.borderColor = newColor;
    _cancelButton.frame = CGRectMake(140, 660, 120, 40);
    [_cancelButton addTarget:self action:@selector(pressCancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cancelButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    _backButton.layer.masksToBounds = YES;
    _backButton.layer.cornerRadius = 10;
    _backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _backButton.titleLabel.textColor = [UIColor redColor];
    _backButton.layer.borderWidth = 2;
    _backButton.layer.borderColor = newColor;
    _backButton.frame = CGRectMake(140, 720, 120, 40);
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
- (void)pressCancel {
    _nameText.text = nil;
}
- (void)pressDelete {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    int bool1 = 0 ;
    int bool2 = 0;
    NSString* name = _nameText.text;
    int i;
    for (i = 0; i < _array1.count ; i ++) {
        if ([name isEqualToString:_array1[i]]) {
            bool1 = 1;
            bool2 ++;
//            break;
        }
    }
    NSLog(@"BOOL2 = %d, BOOL1 = %d", bool2, bool1);
    if (bool1 == 1 && bool2 == 1) {
        int num;
        int j;
        for (j = 0; j < _array1.count; j ++) {
            if ([name isEqualToString:_array1[j]]) {
                break;
            }
        }
        num = j;
        [_array1 removeObject:_array1[num]];
        [_array2 removeObject:_array2[num]];
        [_array3 removeObject:_array3[num]];
        NSLog(@"Array3 len = %ld", _array1.count);
        [_delegate deleteMessage1:_array1 :_array2 :_array3];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (bool1 == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"删除驳回，检查输入是否正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (bool1 == 1 && bool2 > 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"查询结果" message:@"存在重名学生，请选择详细班级的学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
        
        _passwordText = [[UITextField alloc] init];
        _passwordText.frame = CGRectMake(70, 440, 270, 40);
        _passwordText.placeholder = @"| 输入要删除学生的班级";
        _passwordText.borderStyle = UITextBorderStyleRoundedRect;
        _passwordText.keyboardType = UIKeyboardTypeURL;
        // 输入框的图片
        UIImageView* imageViewleftUerName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji.png"]];
        imageViewleftUerName.frame = CGRectMake(72, 440, 10, 10);
        _passwordText.leftView = imageViewleftUerName;
        // 设置左边的view永远显示
        _passwordText.leftViewMode = UITextFieldViewModeAlways;
        // textField协议
        _passwordText.delegate = self;
        [self.view addSubview:_passwordText];
        
        _deleteButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_deleteButton2 setTitle:@"Sure Delete22" forState:UIControlStateNormal];
        _deleteButton2.layer.masksToBounds = YES;
        _deleteButton2.layer.cornerRadius = 10;
        _deleteButton2.titleLabel.font = [UIFont systemFontOfSize:15];
        _deleteButton2.titleLabel.textColor = [UIColor redColor];
        _deleteButton2.layer.borderWidth = 2;
        _deleteButton2.layer.borderColor = newColor;
        _deleteButton2.frame = CGRectMake(140, 500, 120, 40);
        [_deleteButton2 addTarget:self action:@selector(pressDelete2) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_deleteButton2];
    }
}
- (void)pressDelete2 {
    int bool1 = 0 , i = 0, bool2 = 0;
    NSString* class = _passwordText.text;
    NSString* name = _nameText.text;
    NSLog(@"%ld", _array1.count);
    for (i = 0; i < _array1.count; i ++) {
        if ([name isEqualToString: _array1[i]] && [class isEqualToString:_array2[i]]) {
//            if ([class isEqualToString:_array2[i]]) {
                bool1 = 1;
                bool2 ++;
                break;
        }
    }
    NSLog(@"i = %d, BOOL2 = %d", i, bool2);
    if (bool1 == 1) {
        [_array1 removeObjectAtIndex:i];
//        [_array1 removeObject:_array1[i]];
        [_array2 removeObject:_array2[i]];
        [_array3 removeObject:_array3[i]];
        NSLog(@"Array3 len = %ld", _array1.count);
        [_delegate deleteMessage1:_array1 :_array2 :_array3];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"删除驳回，检查输入是否正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [_nameText resignFirstResponder];
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
