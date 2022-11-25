//
//  RegisterViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
@protocol Register <NSObject>

- (void)Register1: (NSMutableArray*) arrayRegister: (NSMutableArray*)arrayPassWord;

@end

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView* imageViewLoad;
@property (nonatomic, strong) UILabel* labelShare;
@property (nonatomic, strong) UIImageView* imageViewShare;
@property (nonatomic, strong) UITextField* textFieldUserName;
@property (nonatomic, strong) UITextField* textFieldPassWord;
@property (nonatomic, strong) UITextField* textFieldPassWord2;
@property (nonatomic, strong) UIButton *buttontRegister;
@property (nonatomic, retain) id<Register> delegate;
@property(nonatomic, strong) NSMutableArray* array1;
@property(nonatomic, strong) NSMutableArray* array2;
@end

NS_ASSUME_NONNULL_END
