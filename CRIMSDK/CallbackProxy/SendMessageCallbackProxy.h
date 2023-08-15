//
//  SendMessageCallbackProxy.h
//  CRIMSDK
//
//  Created by Snow on 2021/6/24.
//

#import <Foundation/Foundation.h>
#import "CallbackProxy.h"

@import CRIMSDKCore;

NS_ASSUME_NONNULL_BEGIN

@interface SendMessageCallbackProxy : CallbackProxy <Crim_sdk_callbackSendMsgCallBack>

- (instancetype)initWithOnSuccess:(CRIMSuccessCallback)onSuccess
                       onProgress:(CRIMNumberCallback)onProgress
                        onFailure:(CRIMFailureCallback)onFailure;

@end

NS_ASSUME_NONNULL_END
