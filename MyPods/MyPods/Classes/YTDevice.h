//
//  YTDevice.h
//  FCCalendarView
//
//  Created by yitudev12 on 2017/8/4.
//  Copyright © 2017年 yitu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 设备工具类
 */
@interface YTDevice : NSObject

/**
 *  设备别名
 */
+ (NSString *)name;

/**
 *  设备型号
 */
+ (NSString *)model;

/**
 *  系统名称
 */
+ (NSString *)systemName;

/**
 *  系统版本
 */
+ (NSString *)systemVersion;

/**
 *  App 名称
 */
+ (NSString *)CFBundleDisplayName;

/**
 *  App 版本号
 */
+ (NSString *)CFBundleShortVersionString;

/**
 *  App 编译号
 */
+ (NSString *)CFBundleVersion;

/**
 *  App 标识符
 */
+ (NSString *)bundleIdentifier;

/**
 *  设备空余容量
 */
+ (int64_t)diskSpaceFree;

/**
 *  设备型号
 */
+ (NSString *)platformString;

@end
