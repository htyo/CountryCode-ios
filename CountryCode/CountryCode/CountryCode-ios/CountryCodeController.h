//
//  CountryCodeController.h
//  EXECUTOR
//
//  Created by Hi_Arno on 2019/5/15.
//  Copyright © 2019 Hi_Arno. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CountryCodeDelegate <NSObject>

- (void)countryCodeRuteurnDict:(NSDictionary *) dict;

@end

@interface CountryCodeController : UITableViewController
/**
 * <#annotation#>
 */
@property (nonatomic, assign) id<CountryCodeDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
