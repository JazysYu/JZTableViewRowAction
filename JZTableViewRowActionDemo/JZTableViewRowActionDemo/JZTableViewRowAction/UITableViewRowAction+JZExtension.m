//
//  UITableViewRowAction+JZExtension.m
//  SwipeToDeleteDemo
//
//  Created by Jazys on 11/11/15.
//  Copyright © 2015 Jazys. All rights reserved.
//

#import "UITableViewRowAction+JZExtension.h"
#import <objc/runtime.h>

@implementation UITableViewRowAction (JZExtension)

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style image:(UIImage *)image handler:(void (^)(UITableViewRowAction * _Nullable, NSIndexPath * _Nullable))handler {
    UITableViewRowAction *rowAction = [self rowActionWithStyle:style title:@"holder" handler:handler];
    rowAction.image = image;
    return rowAction;
}

- (void)setImage:(UIImage *)image {
    objc_setAssociatedObject(self, @selector(image), image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, @selector(enabled), @(enabled), OBJC_ASSOCIATION_ASSIGN);
}

- (UIImage *)image {
    return objc_getAssociatedObject(self, _cmd);
}

- (BOOL)enabled {
    id enabled = objc_getAssociatedObject(self, _cmd);
    return enabled ? [enabled boolValue] : true;
}

@end
