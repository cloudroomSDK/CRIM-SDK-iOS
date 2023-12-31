//
//  CallbackProxy.m
//  CRIMSDK
//
//  Created by Snow on 2021/6/24.
//

#import "CallbackProxy.h"

@interface CallbackProxy() {
    CRIMSuccessCallback _onSuccess;
    CRIMFailureCallback _onError;
}

@end

@implementation CallbackProxy

- (instancetype)initWithOnSuccess:(CRIMSuccessCallback)onSuccess
                        onFailure:(CRIMFailureCallback)onFailure {
    if (self = [super init]) {
        _onSuccess = [onSuccess copy];
        _onError = [onFailure copy];
    }
    return self;
}

- (void)onError:(int32_t)errCode errMsg:(NSString * _Nullable)errMsg {
    
    [self dispatchMainThread:^{
        if (_onError) {
            _onError(errCode, errMsg);
        }
    }];
}

- (void)onSuccess:(NSString * _Nullable)data {
    
    [self dispatchMainThread:^{
        if (_onSuccess) {
            _onSuccess(data);
        }
    }];
}

- (void)dispatchMainThread:(void (NS_NOESCAPE ^)(void))todo {
    if ([NSThread isMainThread]) {
        todo();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            todo();
        });
    }
}

@end
