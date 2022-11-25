//
//  LoadingViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoadingViewController : UIViewController<UITextFieldDelegate, Register>
- (void)Register1:(NSMutableArray *)arrayRegister :(NSMutableArray *)arrayPassWord;
@property (nonatomic, strong) UILabel* labelShare;
@property (nonatomic, strong) UIImageView* imageViewShare;

@property (nonatomic, strong) UITextField* textFieldUserName;
@property (nonatomic, strong) UITextField* textFieldPassWord;

//Login;
@property (nonatomic, strong) UIButton *buttontLogin;

//注册Register;
@property (nonatomic, strong) UIButton *buttontRegister;
@property (nonatomic, strong) UIImageView* imageViewLoad;
// 自动登录
@property (nonatomic, strong) UIButton* buttonAutoRegister;
@property (nonatomic, strong) NSMutableArray* userName;
@property(nonatomic, strong) NSMutableArray* passWord;

@end

NS_ASSUME_NONNULL_END
