//
//  RNDeviceInfo.m
//  Learnium
//
//  Created by Rebecca Hughes on 03/08/2015.
//  Copyright © 2015 Learnium Limited. All rights reserved.
//

#import "RNDeviceInfo.h"

@interface RNDeviceInfo()

@end

@implementation RNDeviceInfo
{

}

- (NSString *)getLocaleIdentifierFromDevice {
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSString *language = [currentLocale objectForKey:NSLocaleLanguageCode];
    NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
    
    if (language.length == 0) {
        return [[NSString alloc] init];
    }
    
    NSString *localeIdentifier = nil;
    if (countryCode.length > 0) {
        localeIdentifier = [NSString stringWithFormat:@"%@-%@", language, countryCode];
    } else {
        localeIdentifier = language;
    }
    
    return localeIdentifier;
}


RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (NSDictionary *)constantsToExport
{
    UIDevice *currentDevice = [UIDevice currentDevice];

    NSUUID *identifierForVendor = [currentDevice identifierForVendor];
    NSString *installationId = [identifierForVendor UUIDString];

    return @{
        @"appBuildNumber": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],
        @"appIdentifier": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"],
        @"appName": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"],
        @"appVersion": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
        @"timeZone": [NSTimeZone systemTimeZone].name,
        @"installationId": installationId,
        @"localeIdentifier": [self getLocaleIdentifierFromDevice],
        @"model": currentDevice.model,
        @"systemName": currentDevice.systemName,
        @"systemVersion": currentDevice.systemVersion
    };
}

@end
