//
//  ViewController.m
//  CountryCode
//
//  Created by Hi_Arno on 2019/5/17.
//  Copyright © 2019 Hi_Arno. All rights reserved.
//

#import "ViewController.h"
#import "CountryCodeController.h"
@interface ViewController ()<CountryCodeDelegate>
/**
 * <#annotation#>
 */
@property (nonatomic, weak) UIButton * button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * button = [[UIButton alloc]init];
    [self.view addSubview:button];
    
    button.frame = CGRectMake(100, 100, 200, 30);
    
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _button = button;
    
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{
    CountryCodeController * countryCode = [[CountryCodeController alloc]init];
    countryCode.delegate = self;
    [self.navigationController pushViewController:countryCode animated:YES];
}

#pragma mark- CountryCodeDelegate
-(void)countryCodeRuteurnDict:(NSDictionary *)dict{
    [_button setTitle:dict[@"country_cn"] forState:UIControlStateNormal];
    NSLog(@"%@",dict);
}

@end
