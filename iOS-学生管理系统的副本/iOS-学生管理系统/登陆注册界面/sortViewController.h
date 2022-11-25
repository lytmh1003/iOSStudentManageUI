//
//  sortViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol sortMessage <NSObject>

- (void)sotrrtssage1:(NSMutableArray*) nameArray1:(NSMutableArray*)classArray1:(NSMutableArray*) markArray1;

@end
@interface sortViewController : UIViewController
@property (nonatomic, strong)UIButton* sortXButton;
@property (nonatomic, strong)UIButton* sortYButton;
@property (nonatomic, strong)UIButton* backButton;
@property (nonatomic, strong)UIImageView* backImageView;
@property (nonatomic, strong)NSMutableArray* array1;
@property (nonatomic, strong)NSMutableArray* array2;
@property (nonatomic, strong)NSMutableArray* array3;
@property (nonatomic, strong)id<sortMessage> delegate;
@end

NS_ASSUME_NONNULL_END
