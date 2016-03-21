//
//  ViewController.m
//  JZTableViewRowActionDemo
//
//  Created by Jazys on 11/10/15.
//  Copyright © 2015 Jazys. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewRowAction+JZExtension.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *models;
@property (nonatomic, copy) NSString *tableViewReuseIdentifier;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewReuseIdentifier = NSStringFromClass([UITableViewCell class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.tableViewReuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = self.models[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setEditing:false animated:true];
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    void(^rowActionHandler)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%@", action);
        [self setEditing:false animated:true];
    };
    
    UIButton *buttonForImage = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:[buttonForImage imageForState:UIControlStateNormal] handler:rowActionHandler];
    
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"disenable" handler:rowActionHandler];
    action2.enabled = false;
    
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"emjoy👍" handler:rowActionHandler];
    
    return @[action1,action2,action3];
}

#pragma mark - getters

- (NSArray *)models {
    if (!_models) {
        NSMutableArray *__models = [NSMutableArray array];
        for (int index = 0; index < 20; index++) {
            [__models addObject:[UIColor colorWithHue:arc4random() % 256 / 256.0 saturation:arc4random() % 128 / 256.0 brightness:arc4random() % 128 / 256.0 alpha:1]];
        }
        _models = __models;
    }
    return _models;
}

@end
