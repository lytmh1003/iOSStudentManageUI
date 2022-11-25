//
//  FristViewController.m
//  iOS-学生管理系统
//
//  Created by 李育腾 on 2022/8/1.
//

#import "FristViewController.h"
#import "addViewController.h"
#import "deleteViewController.h"
#import "ChangeViewController.h"
#import "findViewController.h"
#import "ChangeViewController.h"
#import "sortViewController.h"

@interface FristViewController ()

@end

@implementation FristViewController

- (void)viewDidLoad {
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"iOS-学生管理系统";
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpeg"]];
    [self.view addSubview:_backImageView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView reloadData];
    [self.view addSubview:_tableView];
    

    
    _nameArray = [[NSMutableArray alloc] init];
    _nameArray = [NSMutableArray arrayWithObjects:@"lyt", @"mh", @"mh", nil];
    _classArray = [[NSMutableArray alloc]init];
    _classArray = [NSMutableArray arrayWithObjects:@"A", @"B", @"C",  nil];
    _markArray = [[NSMutableArray alloc] init];
    _markArray = [NSMutableArray arrayWithObjects:@"84", @"67", @"101", nil];
}
// 添加
- (void)addMessage:(NSMutableArray *)nameArray :(NSMutableArray *)classArray :(NSMutableArray *)markArray {
    _nameArray = [NSMutableArray arrayWithArray:nameArray];
    _classArray = [NSMutableArray arrayWithArray:classArray];
    _markArray = [NSMutableArray arrayWithArray:markArray];
    NSLog(@"%@ sssss", nameArray[3]);
    NSLog(@"%@ XYX", _nameArray[3]);
    [_tableView reloadData];
}
- (void)pressAdd {
    NSLog(@"11111");
    addViewController* addView = [[addViewController alloc] init];
    addView.delegate = self;
    addView.array1 = _nameArray;
    addView.array2 = _classArray;
    addView.array3 = _markArray;
    [self presentViewController:addView animated:YES completion:nil];
//    [self.navigationController pushViewController:addView animated:YES];
    
}

// s删除
- (void)deleteMessage1:(NSMutableArray *)nameArray1 :(NSMutableArray *)classArray1 :(NSMutableArray *)markArray1 {
    _nameArray = [NSMutableArray arrayWithArray:nameArray1];
    _classArray = [NSMutableArray arrayWithArray:classArray1];
    _markArray = [NSMutableArray arrayWithArray:markArray1];
    [_tableView reloadData];
}
- (void)pressDelete {
    deleteViewController* deleteView = [[deleteViewController alloc] init];
    deleteView.delegate = self;
    deleteView.array1 = _nameArray;
    deleteView.array2 = _classArray;
    deleteView.array3 = _markArray;
    [self presentViewController:deleteView animated:YES completion:nil];
}

// 查询
- (void)pressFind {
    findViewController* viewFind = [[findViewController alloc] init];
    viewFind.array1 = _nameArray;
    viewFind.array2 = _classArray;
    viewFind.array3 = _markArray;
    [self presentViewController:viewFind animated:YES completion:nil];
}


// 修改
- (void)changeMessage1:(NSMutableArray *)nameArray1 :(NSMutableArray *)classArray1 :(NSMutableArray *)markArray1 {
    _nameArray = [NSMutableArray arrayWithArray:nameArray1];
    _classArray = [NSMutableArray arrayWithArray:classArray1];
    _markArray = [NSMutableArray arrayWithArray:markArray1];
    [_tableView reloadData];
}
- (void)pressChange {
    ChangeViewController* viewChange = [[ChangeViewController alloc] init];
    viewChange.delegate = self;
    viewChange.array1 = _nameArray;
    viewChange.array2 = _classArray;
    viewChange.array3 = _markArray;
    [self presentViewController:viewChange animated:YES completion:nil];
}

// 排序
- (void)sotrrtssage1:(NSMutableArray *)nameArray1 :(NSMutableArray *)classArray1 :(NSMutableArray *)markArray1 {
    _nameArray = [NSMutableArray arrayWithArray:nameArray1];
    _classArray = [NSMutableArray arrayWithArray:classArray1];
    _markArray = [NSMutableArray arrayWithArray:markArray1];
    [_tableView reloadData];
}

- (void)pressSort {
    sortViewController* sort = [[sortViewController alloc] init];
    sort.delegate = self;
    sort.array1 = _nameArray;
    sort.array2 = _classArray;
    sort.array3 = _markArray;
    [self presentViewController:sort animated:YES completion:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    NSString* s = @"strId";
    UITableViewCell* cell=  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:s];
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1.jpeg"]];
    _backImageView.frame = CGRectMake(0, - 23, self.view.frame.size.width, self.view.frame.size.height + 23);
    [self.tableView addSubview:_backImageView];
    for (int i = 1; i < _nameArray.count + 1; i ++) {
        UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, i * 60, 80, 40)];
        nameLabel.text = _nameArray[i - 1];
        nameLabel.textColor = [UIColor redColor];
        nameLabel.font = [UIFont systemFontOfSize:19];
        [self.tableView addSubview:nameLabel];
        
        
        UILabel* classLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, i * 60, 80, 40)];
        classLabel.textColor = [UIColor redColor];
        classLabel.font = [UIFont systemFontOfSize:19];
        classLabel.text = _classArray[i - 1];
        [self.tableView addSubview:classLabel];
        
        
        UILabel* markLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, i * 60, 80, 40)];
        markLabel.textColor = [UIColor redColor];
        markLabel.font = [UIFont systemFontOfSize:19];
        markLabel.text = _markArray[i - 1];
        [self.tableView addSubview:markLabel];
    }
    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addButton setTitle:@"add Message" forState:UIControlStateNormal];
    _addButton.layer.masksToBounds = YES;
    _addButton.layer.cornerRadius = 10;
    _addButton.titleLabel.font = [UIFont systemFontOfSize:17];
    _addButton.titleLabel.textColor = [UIColor redColor];
    _addButton.layer.borderWidth = 2;
    _addButton.layer.borderColor = newColor;
    _addButton.frame = CGRectMake(30, 570, 120, 40);
    [_addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_addButton];
    
    _deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_deleteButton setTitle:@"delete Message" forState:UIControlStateNormal];
    _deleteButton.layer.masksToBounds = YES;
    _deleteButton.layer.cornerRadius = 10;
    _deleteButton.titleLabel.font = [UIFont systemFontOfSize:17];
    _deleteButton.titleLabel.textColor = [UIColor redColor];
    _deleteButton.layer.borderWidth = 2;
    _deleteButton.layer.borderColor = newColor;
    _deleteButton.frame = CGRectMake(30, 630, 140, 40);
    [_deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_deleteButton];
    
    _findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_findButton setTitle:@"Find Message" forState:UIControlStateNormal];
    _findButton.layer.masksToBounds = YES;
    _findButton.layer.cornerRadius = 10;
    _findButton.titleLabel.font = [UIFont systemFontOfSize:17];
    _findButton.titleLabel.textColor = [UIColor redColor];
    _findButton.layer.borderWidth = 2;
    _findButton.layer.borderColor = newColor;
    _findButton.frame = CGRectMake(250, 570, 140, 40);
    [_findButton addTarget:self action:@selector(pressFind) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_findButton];
    
    _changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_changeButton setTitle:@"Change Message" forState:UIControlStateNormal];
    _changeButton.layer.masksToBounds = YES;
    _changeButton.layer.cornerRadius = 10;
    _changeButton.titleLabel.font = [UIFont systemFontOfSize:17];
    _changeButton.titleLabel.textColor = [UIColor redColor];
    _changeButton.layer.borderWidth = 2;
    _changeButton.layer.borderColor = newColor;
    _changeButton.frame = CGRectMake(250, 630, 140, 40);
    [_changeButton addTarget:self action:@selector(pressChange) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_changeButton];
    
    
    _sortButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sortButton setTitle:@"Sort Message" forState:UIControlStateNormal];
    _sortButton.layer.masksToBounds = YES;
    _sortButton.layer.cornerRadius = 10;
    _sortButton.titleLabel.font = [UIFont systemFontOfSize:17];
    _sortButton.titleLabel.textColor = [UIColor redColor];
    _sortButton.layer.borderWidth = 2;
    _sortButton.layer.borderColor = newColor;
    _sortButton.frame = CGRectMake(250, 510, 140, 40);
    [_sortButton addTarget:self action:@selector(pressSort) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:_sortButton];
    return cell;
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
