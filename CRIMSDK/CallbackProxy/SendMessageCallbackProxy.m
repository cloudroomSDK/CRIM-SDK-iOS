//
//  SendMessageCallbackProxy.m
//  CRIMSDK
//
//  Created by Snow on 2021/6/24.
//

#import "SendMessageCallbackProxy.h"

@interface SendMessageCallbackProxy(){
    CRIMSuccessCallback _onSuccess;
    CRIMFailureCallback _onFailure;
    CRIMNumberCallback _onProgress;
}

@end

@implementation SendMessageCallbackProxy

- (instancetype)initWithOnSuccess:(CRIMSuccessCallback)onSuccess
                       onProgress:(CRIMNumberCallback)onProgress
                        onFailure:(CRIMFailureCallback)onFailure {
    if (self = [super init]) {
        _onSuccess = [onSuccess copy];
        _onFailure = [onFailure copy];
        _onProgress = [onProgress copy];
    }
    return self;
}

- (void)onError:(int32_t)errCode errMsg:(NSString * _Nullable)errMsg {
    
    [self dispatchMainThread:^{
        if (_onFailure) {
            _onFailure(errCode, errMsg);
        }
    }];
}

- (void)onProgress:(long)progress {
    [self dispatchMainThread:^{
        if (_onProgress) {
            _onProgress(progress);
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

@end
