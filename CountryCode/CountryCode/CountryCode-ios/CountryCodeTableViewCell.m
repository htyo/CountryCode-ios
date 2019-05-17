//
//  CountryCodeTableViewCell.m
//  EXECUTOR
//
//  Created by Hi_Arno on 2019/5/15.
//  Copyright © 2019 Hi_Arno. All rights reserved.
//

#import "CountryCodeTableViewCell.h"

@interface CountryCodeTableViewCell()
/**
 * <#annotation#>
 */
@property (nonatomic, weak) UILabel * titleLabel;
/**
 * <#annotation#>
 */
@property (nonatomic, weak) UILabel * subTitleLabel;
/**
 * <#annotation#>
 */
@property (nonatomic, weak) UILabel * codeLabel;
@end

@implementation CountryCodeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];

    }
    return self;
}

- (void)loadSubViews{
    
    // 1.dalabel
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [self.contentView addSubview:titleLabel];
    _titleLabel =titleLabel;
    
    
    UILabel * subTitleLabel = [[UILabel alloc]init];
    subTitleLabel.font = [UIFont systemFontOfSize:12.0f];
    subTitleLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:subTitleLabel];
    _subTitleLabel = subTitleLabel;
    
    UILabel * codeLabel = [[UILabel alloc]init];
    codeLabel.font = [UIFont systemFontOfSize:16.0f];
    codeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:codeLabel];
    _codeLabel = codeLabel;
    
    
    CGFloat marginx = 20;
    CGFloat marginy = 5;
    
    titleLabel.frame = CGRectMake(marginx, marginy, 200, 16);
    titleLabel.text = @"sfsd";
    
    
    subTitleLabel.frame = CGRectMake(marginx, CGRectGetMaxY(titleLabel.frame), 200, 20);
    subTitleLabel.text = @"grdddfds";
    
    CGSize size = CGSizeMake(80, self.frame.size.height);
    CGPoint point = CGPointMake(self.frame.size.width - size.width - 20, 0);
    
    codeLabel.frame = (CGRect){point,size};
    
    
    
}
-(void)setModel:(CountryModel *)model{
    _model = model;
    _titleLabel.text = model.country_en;
    _subTitleLabel.text = model.country_cn;
    _codeLabel.text = model.code;
}
@end
