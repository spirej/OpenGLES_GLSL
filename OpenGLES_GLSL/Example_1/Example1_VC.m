//
//  Example1_VC.m
//  OpenGLES_GLSL
//
//  Created by SPIREJ on 2019/6/20.
//  Copyright © 2019年 xiangshang360. All rights reserved.
//

#import "Example1_VC.h"
#import "SJView1.h"

@interface Example1_VC ()

@property (nonatomic, strong) SJView1 *myView;

@end

@implementation Example1_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myView];
}

- (SJView1 *)myView {
    if (!_myView) {
        _myView = [[SJView1 alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _myView;
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
