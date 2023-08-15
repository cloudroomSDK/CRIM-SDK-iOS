//
//  CallbackProxy.h
//  CRIMSDK
//
//  Created by Snow on 2021/6/24.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

@import CRIMSDKCore;

NS_ASSUME_NONNULL_BEGIN

@interface CallbackProxy : NSObject <Crim_sdk_callbackBase>

- (instancetype)initWithOnSuccess:(CRIMSuccessCallback)onSuccess
                        onFailure:(CRIMFailureCallback)onFailure;

- (void)dispatchMainThread:(void (NS_NOESCAPE ^)(void))todo;
@end

NS_ASSUME_NONNULL_END
