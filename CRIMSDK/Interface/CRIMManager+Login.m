//
//  CRIMManager+Login.m
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager+Login.h"
#import "CallbackProxy.h"

@implementation CRIMManager (Login)

- (void)login:(NSString *)uid
        token:(NSString *)token
    onSuccess:(CRIMSuccessCallback)onSuccess
    onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
     
        self.token = token;
        
        if (onSuccess) {
            onSuccess(data);
        }
    } onFailure:onFailure];
    
    [[self class].callbacker setListener];
    
    Crim_sdkLogin(callback, [self operationId], uid, token);
}

- (NSInteger)getLoginStatus {
    return Crim_sdkGetLoginStatus([self operationId]);
}

- (void)logoutWithOnSuccess:(CRIMSuccessCallback)onSuccess
                  onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkLogout(callback, [self operationId]);
}

@end
