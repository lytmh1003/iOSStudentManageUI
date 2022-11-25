//
//  addViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol addMessaaage <NSObject>

- (void)addMessage:(NSMutableArray*) nameArray:(NSMutableArray*)classArray:(NSMutableArray*) markArray;

@end
@interface addViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)UIButton* addButton;
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UIImageView* backImageView;
@property (nonatomic, strong)UITextField* nameText;
@property (nonatomic, strong)UITextField* classText;
@property (nonatomic, strong)UITextField* markText;
@property (nonatomic, retain)id<addMessaaage> delegate;
@property (nonatomic, strong)NSMutableArray* array1;
@property (nonatomic, strong)NSMutableArray* array2;
@property (nonatomic, strong)NSMutableArray* array3;
@end

NS_ASSUME_NONNULL_END
