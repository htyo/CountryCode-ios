//
//  CountryCodeController.m
//  EXECUTOR
//
//  Created by Hi_Arno on 2019/5/15.
//  Copyright © 2019 Hi_Arno. All rights reserved.
//

#import "CountryCodeController.h"
#import "CountryCodeTableViewCell.h"
#import "CountryManager.h"
@interface CountryCodeController ()

@end

@implementation CountryCodeController
- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSArray<CountryManagerModel*> *)modes{
    return [CountryManager sharedManager].modes;
}
- (NSArray *) indexTitles{
    return [CountryManager sharedManager].indexTitles;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self modes].count;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self indexTitles];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((CountryManagerModel*)[self modes][section]).models.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryCodeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"countryCode"];
    if (!cell) {
        cell = [[CountryCodeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"countryCode"];
    }
    CountryModel * model =  ((CountryManagerModel*)[self modes][indexPath.section]).models[indexPath.row];
    cell.model = model;
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CountryManagerModel * model =  ((CountryManagerModel*)[self modes][section]);
    return model.indexTitle;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(countryCodeRuteurnDict:)]) {
        CountryModel * model =  ((CountryManagerModel*)[self modes][indexPath.section]).models[indexPath.row];
        [self.delegate countryCodeRuteurnDict:[model modeTodict]];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
