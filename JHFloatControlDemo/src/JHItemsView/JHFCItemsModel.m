//
//  JHFCItemsModel.m
//  Demo
//
//  Created by JasonHu on 2017/10/25.
//  Copyright © 2017年 JasonHu. All rights reserved.
//

#import "JHFCItemsModel.h"

@implementation JHFCItemsModel

@end

#import "XFATItemView.h"
@implementation JHFCItemsModel (XFATItemView)

+ (NSArray<XFATItemView *> *)convertToXFATItemViewArrayFromArray:(NSArray<JHFCItemsModel *> *)array
{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (JHFCItemsModel *itemModel in array) {
        
        XFATItemView *itemView = [[XFATItemView alloc] initWithLayer:[self createLayerWithImage:itemModel.image]];
        itemView.itemModel = itemModel;
        [resultArray addObject:itemView];
    }
    return resultArray;
}


+ (CALayer *)createLayerWithImage:(UIImage *)image {
    CALayer *layer = [CALayer layer];
    CGSize size = image.size;
    layer.contents = (id)image.CGImage;
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    return layer;
}

@end


#import "XFATItemView.h"
#import <objc/runtime.h>
static const void *itemModelKey = &itemModelKey;

@implementation XFATItemView (JHFCItemsModel)

@dynamic itemModel;

- (JHFCItemsModel *)itemModel {
    return objc_getAssociatedObject(self, itemModelKey);
}

- (void)setItemModel:(JHFCItemsModel *)itemModel {
    objc_setAssociatedObject(self, itemModelKey, itemModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
