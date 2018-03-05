//
//  JHFCItemsModel.h
//  Demo
//
//  Created by JasonHu on 2017/10/25.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class JHFCItemsModel;
@class XFATItemView;

typedef void(^JHFCItemSelectBlock)(JHFCItemsModel *item);

@interface JHFCItemsModel : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, copy)  JHFCItemSelectBlock block;

//
@property (nonatomic, weak) XFATItemView *itemView;

@end

@class XFATItemView;
@interface JHFCItemsModel (XFATItemView)

+ (NSArray<XFATItemView *> *)convertToXFATItemViewArrayFromArray:(NSArray<JHFCItemsModel *> *)array;

@end;

#import "XFATItemView.h"
@interface XFATItemView (JHFCItemsModel)

@property (nonatomic, strong) JHFCItemsModel *itemModel;

@end;
