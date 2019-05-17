//
//  CountryManager.h
//  EXECUTOR
//
//  Created by Hi_Arno on 2019/5/15.
//  Copyright © 2019 Hi_Arno. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

// country model
@interface CountryModel : NSObject
/**
 * 地区名-英文
 */
@property (nonatomic, strong) NSString * country_en;
/**
 * 地区名-中文
 */
@property (nonatomic, strong) NSString * country_cn;
/**
 * 区域编码
 */
@property (nonatomic, strong) NSString * code;
/**
 * 缩写
 */
@property (nonatomic, strong) NSString * abbreviations;

+(CountryModel *)dictToModel:(NSDictionary *)dict;
-(NSDictionary *)modeTodict;

@end

// dict model
@interface CountryManagerModel : NSObject
/**
 * 模型数组
 */
@property (nonatomic, strong) NSString  *indexTitle;
@property (nonatomic, strong) NSArray<CountryModel*> * models;
+(CountryManagerModel *)dictToModel:(NSDictionary *)dict;
@end


// manager
@interface CountryManager : NSObject
/**
 * 模型数组
 */
@property (nonatomic, strong) NSArray<CountryManagerModel*> *modes;
@property (nonatomic, strong) NSArray<NSString*> * indexTitles;

+(CountryManager*) sharedManager;
@end

NS_ASSUME_NONNULL_END
