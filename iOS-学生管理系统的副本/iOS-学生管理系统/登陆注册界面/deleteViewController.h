//
//  deleteViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol deleteMessage <NSObject>

- (void)deleteMessage1:(NSMutableArray*) nameArray1:(NSMutableArray*)classArray1:(NSMutableArray*) markArray1;

@end

@interface deleteViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UIButton* deleteButton;
@property (nonatomic,strong)UIButton* deleteButton2;
@property (nonatomic, strong)UIButton* cancelButton;
@property (nonatomic, strong)UIImageView* backImageView;
@property (nonatomic, strong)UITextField* nameText;
@property (nonatomic, strong)UITextField* passwordText;
@property (nonatomic, retain)id<deleteMessage> delegate;
@property (nonatomic, strong)NSMutableArray* array1;
@property (nonatomic, strong)NSMutableArray* array2;
@property (nonatomic, strong)NSMutableArray* array3;
@end

NS_ASSUME_NONNULL_END
