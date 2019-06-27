//
//  ViewController.m
//  OpenGLES_GLSL
//
//  Created by SPIREJ on 2019/6/13.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

#import "ViewController.h"
#import "Example1_VC.h"
#import "SplitScreen_VC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.dataArray addObject:@"OpenGL ES GLSL加载图片"];
    [self.dataArray addObject:@"OpenGL ES 分屏滤镜处理"];
    [self.dataArray addObject:@"OpenGL ES 灰度/马赛克滤镜处理"];
}

#pragma mark - UITableViewDelegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            Example1_VC *vc1 = [[Example1_VC alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
        }
            break;
            
            
        case 1:
        {
            SplitScreen_VC *vc2 = [[SplitScreen_VC alloc] init];
            [self.navigationController pushViewController:vc2 animated:YES];
        }
            
            
        default:
            break;
    }
    
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end
