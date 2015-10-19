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
        @"appIdentifier": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"],
        @"appName": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"],
        @"appVersion": [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],
        @"installationId": installationId,
        @"model": currentDevice.model,
        @"systemName": currentDevice.systemName,
        @"systemVersion": currentDevice.systemVersion
    };
}

@end
