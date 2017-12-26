//
//  YTDevice.m
//  FCCalendarView
//
//  Created by yitudev12 on 2017/8/4.
//  Copyright © 2017年 yitu. All rights reserved.
//

#import "YTDevice.h"

#import <UIKit/UIKit.h>
#import <sys/sysctl.h>

@implementation YTDevice


/**
 *  设备别名
 */
+ (NSString *)name {
    return [[UIDevice currentDevice] name];
}

/**
 *  设备型号
 */
+ (NSString *)model {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

/**
 *  系统名称
 */
+ (NSString *)systemName {
    return [[UIDevice currentDevice] systemName];
}

/**
 *  系统版本
 */
+ (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

/**
 *  App 名称
 */
+ (NSString *)CFBundleDisplayName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

/**
 *  App 版本号
 */
+ (NSString *)CFBundleShortVersionString {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/**
 *  App 编译号
 */
+ (NSString *)CFBundleVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

/**
 *  App 标识符
 */
+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

/**
 *  设备空余容量
 */
+ (int64_t)diskSpaceFree {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    int64_t space = [[attrs objectForKey:NSFileSystemFreeSize] unsignedLongLongValue];
    space = space - 200 * 1024 * 1024;
    if (space < 0) space = -1;
    return space;
}

/**
 *  设备型号
 */
+ (NSString *)platformString {
    NSString *platform = [self model];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (A1332)";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (A1349)";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S (A1387/A1431)";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (A1428)";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (A1429/A1442)";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (A1456/A1532)";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (A1507/A1516/A1526/A1529)";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (A1453/A1533)";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (A1457/A1518/A1528/A1530)";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G (A1213)";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G (A1288)";
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G (A1318)";
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G (A1367)";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G (A1421/A1509)";
    
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad 1G (A1219/A1337)";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2 (A1395)";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2 (A1396)";
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2 (A1397)";
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2 (A1395+New Chip)";
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G (A1432)";
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G (A1454)";
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G (A1455)";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3 (A1416)";
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3 (A1403)";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3 (A1430)";
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4 (A1458)";
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4 (A1459)";
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4 (A1460)";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air (A1474)";
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air (A1475)";
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air (A1476)";
    if ([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G (A1489)";
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G (A1490)";
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G (A1491)";
    if ([platform isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    if ([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    if ([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro(9.7)";
    if ([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro(9.7)";
    if ([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro(12.9)";
    if ([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro(12.9)";
    
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
}

@end
