# JZTableViewRowAction
Using UITableViewRowAction on iOS >= 5.0, you can set an image or enable status for UITableViewRowAction.

# Overview

![overview](https://raw.githubusercontent.com/JazysYu/JZTableViewRowAction/master/Snapshots/JZTableViewRowActionOverview.gif)

# Usage

*	Implement API in UITableViewDelegate:

```objc
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
```

*	Create UITableViewRowAction with an image:
	
```objc
UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault image:"your image" handler:rowActionHandler];
```	

* 	Set enable status:

```objc
	action.enabled = false;
```

# Installation
Drag all source files under floder JZTableViewRowAction to your project.

``` objc
UITableViewRowAction+JZExtension.h	UITableViewRowAction+JZExtension.m
UITableViewCell+JZExtension.m		UITableViewRowAction.m
```
***
欢迎微博[@J_雨](http://weibo.com/JazysYu/)与我交流