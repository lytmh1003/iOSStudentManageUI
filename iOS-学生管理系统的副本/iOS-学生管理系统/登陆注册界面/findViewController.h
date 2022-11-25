//
//  findViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface findViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong)UIButton* findButton;
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UIImageView* backImageView;
@property (nonatomic, strong)UITextField* nameText;
@property (nonatomic, strong)UITextField* classText;
@property (nonatomic, strong)  NSMutableArray* array;
@property (nonatomic, strong)NSMutableArray* array1;
@property (nonatomic, strong)NSMutableArray* array2;
@property (nonatomic, strong)NSMutableArray* array3;
@end

NS_ASSUME_NONNULL_END
