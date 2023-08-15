//
//  CRIMManager+Connection.m
//  CRIMSDK
//
//  Created by x on 2021/2/15.
//

#import "CRIMManager+Connection.h"
#import "CallbackProxy.h"

@implementation CRIMInitConfig

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.platform = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ? iPad : iPhone;
        self.dataDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/"];
        self.logFilePath = self.dataDir;
        self.isLogStandardOutput = YES;
        self.logLevel = 6;
        self.objectStorage = @"minio";
        self.encryption = NO;
        self.compression = NO;
        self.isExternal = NO;
    }
    
    return self;
}

@end


@implementation CRIMManager (Connection)

- (BOOL)initSDKWithConfig:(CRIMInitConfig *)config {
    
    NSMutableDictionary *param = [NSMutableDictionary new];
    
    param[@"platformID"] = @(config.platform);
    param[@"apiAddr"] = config.apiAddr;
    param[@"wsAddr"]  = config.wsAddr;
    param[@"dataDir"] = config.dataDir;
    param[@"logLevel"] = @(config.logLevel);
    param[@"objectStorage"] = config.objectStorage;
    param[@"isNeedEncryption"] = @(config.encryption);
    param[@"isCompression"] = @(config.compression);
    param[@"isExternalExtensions"] = @(config.isExternal);
    param[@"logFilePath"] = config.logFilePath;
    param[@"isLogStandardOutput"] = @(config.isLogStandardOutput);
    
    self.objectStorage = config.objectStorage;
    
    return Crim_sdkInitSDK([self operationId], param.mj_JSONString);
}

- (void)setHeartbeatInterval:(NSInteger)heartbeatInterval {
    Crim_sdkSetHeartbeatInterval(heartbeatInterval);
}

@end
