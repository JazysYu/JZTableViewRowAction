//
//  UITableViewRowAction.m
//  tableView
//
//  Created by Jazys on 10/23/15.
//  Copyright © 2015 Jazys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
#import <objc/runtime.h>

@interface JZTableViewRowAction : NSObject<NSCopying>
{
    UITableViewRowActionStyle _style;
}
@property (nonatomic, readonly) UITableViewRowActionStyle style;
@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) UIColor *backgroundColor; // default background color is dependent on style
@property (nonatomic, copy, nullable) UIVisualEffect* backgroundEffect;
@property (nonatomic, copy, nullable) void (^handler)(UITableViewRowAction *, NSIndexPath *);
@property (nonatomic, strong, nullable) UIImage *image;
@property (nonatomic, strong, nonnull) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL enabled;
+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style title:(nullable NSString *)title handler:(void (^)(UITableViewRowAction *action, NSIndexPath *indexPath))handler;
+ (nonnull instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style image:(nullable UIImage *)image handler:(nullable void (^)(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath))handler;
@end

@implementation JZTableViewRowAction

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void (^)(UITableViewRowAction *, NSIndexPath *))handler {
    JZTableViewRowAction *rowAction = [[JZTableViewRowAction alloc] init];
    rowAction.title = title;
    rowAction.handler = handler;
    rowAction->_style = style;
    rowAction.enabled = true;
    return rowAction;
}

+ (instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style image:(UIImage *)image handler:(void (^)(UITableViewRowAction * _Nullable, NSIndexPath * _Nullable))handler {
    JZTableViewRowAction *rowAction = [self rowActionWithStyle:style title:@"holder" handler:handler];
    rowAction.image = image;
    return rowAction;
}

- (id)copyWithZone:(NSZone *)zone {
    return [self copy];
}

- (void)actionTriggered:(id)sender {
    !self.handler ?: self.handler((__kindof UITableViewRowAction *)self, self.indexPath);
}

@end


__asm(
      ".section        __DATA,__objc_classrefs,regular,no_dead_strip\n"
#if	TARGET_RT_64_BIT
      ".align          3\n"
      "L_OBJC_CLASS_UITableViewRowAction:\n"
      ".quad           _OBJC_CLASS_$_UITableViewRowAction\n"
#else
      ".align          2\n"
      "_OBJC_CLASS_UITableViewRowAction:\n"
      ".long           _OBJC_CLASS_$_UITableViewRowAction\n"
#endif
      ".weak_reference _OBJC_CLASS_$_UITableViewRowAction\n"
      );

__attribute__((constructor)) static void JZTableViewRowActionPatchEntry(void) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {

            if (objc_getClass("UITableViewRowAction")) {
                return;
            }
            
            Class *tableViewRowActionClassLocation = NULL;
            
#if TARGET_CPU_ARM
            __asm("movw %0, :lower16:(_OBJC_CLASS_UITableViewRowAction-(LPC0+4))\n"
                  "movt %0, :upper16:(_OBJC_CLASS_UITableViewRowAction-(LPC0+4))\n"
                  "LPC0: add %0, pc" : "=r"(tableViewRowActionClassLocation));
#elif TARGET_CPU_ARM64
            __asm("adrp %0, L_OBJC_CLASS_UITableViewRowAction@PAGE\n"
                  "add  %0, %0, L_OBJC_CLASS_UITableViewRowAction@PAGEOFF" : "=r"(tableViewRowActionClassLocation));
#elif TARGET_CPU_X86_64
            __asm("leaq L_OBJC_CLASS_UITableViewRowAction(%%rip), %0" : "=r"(tableViewRowActionClassLocation));
#elif TARGET_CPU_X86
            void *pc = NULL;
            __asm("calll L0\n"
                  "L0: popl %0\n"
                  "leal _OBJC_CLASS_UITableViewRowAction-L0(%0), %1" : "=r"(pc), "=r"(tableViewRowActionClassLocation));
#else
#error Unsupported CPU
#endif
            
            if (tableViewRowActionClassLocation && !*tableViewRowActionClassLocation) {
                Class class = objc_allocateClassPair(JZTableViewRowAction.class, "UITableViewRowAction", 0);
                if (class) {
                    objc_registerClassPair(class);
                    *tableViewRowActionClassLocation = class;
                }
            }
        }
    });
}
