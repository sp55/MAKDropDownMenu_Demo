//
//  MAKDropDownMenu.h
//  Scout
//
//  Created by Denis Chaschin on 17.07.14.
//  Copyright (c) 2014 diniska. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]




@class MAKDropDownMenu;

@protocol MAKDropDownMenuDelegate <NSObject>
- (void)dropDownMenu:(MAKDropDownMenu *)menu itemDidSelect:(NSUInteger)itemIndex;
@optional
- (void)dropDownMenuDidTapOutsideOfItem:(MAKDropDownMenu *)menu;
@end

@interface MAKDropDownMenu : UIView
@property (strong, nonatomic) NSArray *titles;
@property (weak, nonatomic) id<MAKDropDownMenuDelegate> delegate;
@property (strong, nonatomic) UIColor *buttonBackgroundColor;
@property (strong, nonatomic) UIColor *tintColor;
@property (assign, nonatomic) CGFloat separatorHeight;
@property (assign, nonatomic) UIEdgeInsets buttonsInsets;
@property (assign, nonatomic, readonly) BOOL isOpen;

- (void)openAnimated:(BOOL)animated;
- (void)closeAnimated:(BOOL)animated;
@end
