//
//  CountryManager.m
//  EXECUTOR
//
//  Created by Hi_Arno on 2019/5/15.
//  Copyright © 2019 Hi_Arno. All rights reserved.
//

#import "CountryManager.h"
#import <Objc/runtime.h>
@implementation CountryModel

+(CountryModel *)dictToModel:(NSDictionary *)dict{
    CountryModel * model = [[CountryModel alloc]init];
    model.code = dict[@"code"];
    model.country_cn = dict[@"country-cn"];
    model.country_en = dict[@"country-en"];
    model.abbreviations = dict[@"abbreviations"];
    return model;
}
-(NSDictionary *)modeTodict{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    
    
    unsigned int outCount;
    objc_property_t * propers = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = propers[i];

        const char *name = property_getName(property);
        NSString * key = [NSString stringWithUTF8String:name];
        
        [dict setObject:[self valueForKey:key] forKey:key];
        
    }
    free(propers);

    return [dict copy];
    
    
}
@end

@implementation CountryManagerModel
+(CountryManagerModel *)dictToModel:(NSDictionary *)dict{
    CountryManagerModel *model = [[CountryManagerModel alloc]init];
    model.indexTitle = dict[@"indexTitle"];
    model.models = [self dictToModels:dict[@"country"]];
    return model;
}
+(NSArray<CountryModel*>*)dictToModels:(NSArray*)array{
    NSMutableArray * models = [[NSMutableArray alloc]initWithCapacity:array.count];
    for (NSDictionary * dict in array) {
        CountryModel * model = [CountryModel dictToModel:dict];
        [models addObject:model];
    }
    return models;
}
@end


@implementation CountryManager

+(CountryManager*) sharedManager{
    static CountryManager * mangaer;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mangaer = [[CountryManager alloc]init];
    });
    return mangaer;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadCountryData];
    }
    return self;
}

- (void)loadCountryData{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"CountryCode" ofType:@"plist"];
    NSArray * dicts = [NSArray arrayWithContentsOfFile:path];
    
    
    NSMutableArray * models = [[NSMutableArray alloc]init];
    NSMutableArray * indexTitles = [[NSMutableArray alloc]init];

    for (NSDictionary * dict  in dicts) {
        CountryManagerModel * model = [CountryManagerModel dictToModel:dict];
        [indexTitles addObject:model.indexTitle];
        [models addObject:model];
    }
    self.modes = [models copy];
    self.indexTitles = [indexTitles copy];
}

@end
