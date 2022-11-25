//
//  RegisterViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "RegisterViewController.h"
#import "LoadingViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
   [super viewDidLoad];
//    _array1 = [[NSMutableArray alloc] init];
//    _array2 = [[NSMutableArray alloc]init];
   _imageViewLoad = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back2.jpeg"]];
   _imageViewLoad.frame = CGRectMake(0, - 23, self.view.frame.size.width, self.view.frame.size.height + 23);
   [self.view addSubview:_imageViewLoad];
   
   _labelShare = [[UILabel alloc] initWithFrame:CGRectMake( (self.view.frame.size.width) / 2 - 48, (self.view.frame.size.height) / 6 + 160 , 120, 30)];
   _labelShare.text = @"注册界面";
   _labelShare.font = [UIFont systemFontOfSize:17];
   _labelShare.textColor = [UIColor whiteColor];
  
   
//   _imageViewShare = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tuxing2.jpg"]];
//   _imageViewShare.frame = CGRectMake( (self.view.frame.size.width) / 2 - 90, (self.view.frame.size.height) / 6 - 20 ,170, 170);
//   [self.view addSubview:_imageViewShare];
   [self.view addSubview:_labelShare];
   
   //用户名输入框
   _textFieldUserName = [[UITextField alloc] init];
   _textFieldUserName.frame = CGRectMake(70, 380, 270, 40);
   _textFieldUserName.placeholder = @"|请输入用户名";
   _textFieldUserName.borderStyle = UITextBorderStyleRoundedRect;
   _textFieldUserName.keyboardType = UIKeyboardTypeURL;
   // 输入框的图片
   UIImageView* imageViewleftUerName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yonghuming.png"]];
   imageViewleftUerName.frame = CGRectMake(72, 380, 10, 10);
   _textFieldUserName.leftView = imageViewleftUerName;
   // 设置左边的view永远显示
   _textFieldUserName.leftViewMode = UITextFieldViewModeAlways;
// textField协议
   _textFieldUserName.delegate = self;
   
   //密码输入框
   _textFieldPassWord = [[UITextField alloc] init];
   _textFieldPassWord.frame = CGRectMake(70, 460, 270, 40);
   _textFieldPassWord.placeholder = @"|请输入密码";
   _textFieldPassWord.borderStyle = UITextBorderStyleRoundedRect;
   _textFieldPassWord.secureTextEntry = YES;
   _textFieldPassWord.delegate = self;
   
   // 输入框的图片
   UIImageView* imageViewleftPassWord = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mima.png"]];
   imageViewleftPassWord.frame = CGRectMake(72, 460, 10, 10);
   _textFieldPassWord.leftView = imageViewleftPassWord;
   // 设置左边的view永远显示
   _textFieldPassWord.leftViewMode = UITextFieldViewModeAlways;

   _textFieldPassWord.keyboardType = UIKeyboardTypeDefault;
   
   //密码输入框2
   _textFieldPassWord2 = [[UITextField alloc] init];
   _textFieldPassWord2.frame = CGRectMake(70, 520, 270, 40);
   _textFieldPassWord2.placeholder = @"|请输入密码";
   _textFieldPassWord2.borderStyle = UITextBorderStyleRoundedRect;
   _textFieldPassWord2.secureTextEntry = YES;
   _textFieldPassWord2.delegate = self;
   
   // 输入框的图片
   UIImageView* imageViewleftPassWord2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mima.png"]];
   imageViewleftPassWord2.frame = CGRectMake(72, 520, 10, 10);
   _textFieldPassWord2.leftView = imageViewleftPassWord2;
   // 设置左边的view永远显示
   _textFieldPassWord2.leftViewMode = UITextFieldViewModeAlways;

   _textFieldPassWord2.keyboardType = UIKeyboardTypeDefault;
  
   
   //注册button
   _buttontRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _buttontRegister.frame = CGRectMake(160, 600, 80, 40);
   _buttontRegister.tintColor = [UIColor whiteColor];
   [_buttontRegister setTitle:@"确认注册" forState:UIControlStateNormal];
   _buttontRegister.titleLabel.font = [UIFont systemFontOfSize:15];
   [_buttontRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
   [_buttontRegister.layer setMasksToBounds:YES];
   [_buttontRegister.layer setCornerRadius:14];
   [_buttontRegister.layer setBorderWidth:2];
   
   
   [self.view addSubview:_buttontRegister];
   [self.view addSubview:_textFieldUserName];
   [self.view addSubview:_textFieldPassWord];
   [self.view addSubview:_textFieldPassWord2];
   
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   //回收键盘对象
   [_textFieldUserName resignFirstResponder];
   [_textFieldPassWord resignFirstResponder];
}

//// 键盘弹出屏幕上移方法
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//   self.view.frame = CGRectMake(0.0f, - 100.0f / .9f, self.view.frame.size.width, self.view.frame.size.height);
//}
//
////取消第一响应，意思是输入完毕，屏幕恢复原状
//- (void)textFieldDidEndEditing:(UITextField*)textField　{
//　　self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, -100, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.view.frame =CGRectMake(0.0f, 0,self.view.frame.size.width,self.view.frame.size.height);
}
- (void)pressRegister {
   int bool1 = 0;
   for (int i = 0; i < _array1.count; i ++) {
       if ([_array1[i] isEqualToString:_textFieldUserName.text]) {
           bool1 = 1;
           break;
       }
   }
   if (bool1 == 1) {
       UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"请勿重复注册！" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
       [alertController addAction:sure];
       [self presentViewController:alertController animated:YES completion:nil];
   } else {
       [_array1 addObject:_textFieldUserName.text];
       [_array2 addObject:_textFieldPassWord.text];
       [_delegate Register1:_array1 :_array2];
       NSLog(@"%@D-, %@D+", _array1[0], _array2[0]);
       [self dismissViewControllerAnimated:YES completion:nil];
   }
   _textFieldUserName.text = nil;
   _textFieldPassWord.text = nil;
}
@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

