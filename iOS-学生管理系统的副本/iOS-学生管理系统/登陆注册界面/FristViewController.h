//
//  FristViewController.h
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import <UIKit/UIKit.h>
#import "addViewController.h"
#import "deleteViewController.h"
#import "ChangeViewController.h"
#import "findViewController.h"
#import "ChangeViewController.h"
#import "sortViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface FristViewController : UIViewController<addMessaaage, UITableViewDelegate, UITableViewDataSource, deleteMessage, changeMessage, sortMessage>
- (void)addMessage:(NSMutableArray *)nameArray :(NSMutableArray *)classArray :(NSMutableArray *)markArray;
- (void)deleteMessage1:(NSMutableArray *)nameArray1 :(NSMutableArray *)classArray1 :(NSMutableArray *)markArray1;
- (void)changeMessage1:(NSMutableArray *)nameArray1 :(NSMutableArray *)classArray1 :(NSMutableArray *)markArray1;
- (void)sotrrtssage1:(NSMutableArray *)nameArray1 :(NSMutableArray *)classArray1 :(NSMutableArray *)markArray1;
@property (nonatomic, strong)UIImageView *backImageView;
@property (nonatomic, strong)UIButton* addButton;
@property (nonatomic, strong)UIButton* deleteButton;
@property (nonatomic, strong)UIButton* changeButton;
@property (nonatomic, strong)UIButton* sortButton;
@property (nonatomic, strong)UIButton* findButton;
@property (nonatomic, strong)UIButton* exitButton;
@property (nonatomic, strong)NSMutableArray* nameArray;
@property (nonatomic, strong)NSMutableArray* classArray;
@property (nonatomic, strong)NSMutableArray* markArray;
@property (nonatomic, strong)UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
