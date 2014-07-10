//
//  UIFactory.m
//  WeiBo
//
//  Created by chen on 14-6-8.
//  Copyright (c) 2014年 陈晟. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+ (ThemeButton *)createButton:(NSString *)imageName hightlight:(NSString *)highlightedName{
    ThemeButton *button = [[ThemeButton alloc] initWithImage:imageName highlighted:highlightedName];
    return button;
}


+ (ThemeButton *)createButtonWithBackground:(NSString *)backgroundimageName backgroundHightlight:(NSString *)highlightedName{
    ThemeButton *button = [[ThemeButton alloc] initWithBackgroup:backgroundimageName highlighted:highlightedName];
    return button;
}

+ (UIButton *)createNavigationButton:(CGRect)frame
                               title:(NSString *)title
                              target:(id)target
                              action:(SEL)action{
    ThemeButton *button = [self createButtonWithBackground:@"navigationbar_button_background.png" backgroundHightlight:@"navigationbar_button_delete_background.png"];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    button.leftCapWidth = 3;
    
    
    
    return button;
}

+ (ThemeImageView *)createImageView:(NSString *)imageName{
    ThemeImageView *image = [[ThemeImageView alloc] initWithImageName:imageName];
    return image;
}


+ (ThemeLabel *)createLabel:(NSString *)colorName{
    ThemeLabel *label = [[ThemeLabel alloc] initWIthColorName:colorName];
    return label;
}

@end