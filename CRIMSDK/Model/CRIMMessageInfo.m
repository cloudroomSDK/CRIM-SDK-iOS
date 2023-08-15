//
//  CRIMMessageInfo.m
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import "CRIMMessageInfo.h"
#import <MJExtension/MJExtension.h>

@implementation CRIMOfflinePushInfo

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.title = @"";
        self.desc = @"";
        self.ex = @"";
        self.iOSPushSound = @"";
        self.iOSBadgeCount = YES;
    }
    
    return self;
}

@end

@implementation CRIMMessageInfo

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.offlinePush = [CRIMOfflinePushInfo new];
        self.status = CRIMMessageStatusUndefine;
    }
    
    return self;
}

- (NSTimeInterval)hasReadTime {
    if (_hasReadTime == 0) {
        _hasReadTime = _attachedInfoElem.hasReadTime;
    }
    
    return _hasReadTime;
}

@end

@implementation CRIMReceiptInfo

@end

@implementation CRIMMessageRevokedInfo

@end

@implementation CRIMKeyValue
@end

@implementation CRIMKeyValues
@end
