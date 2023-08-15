//
//  UploadFileCallbackProxy.h
//  CRIMSDK
//
//  Created by x on 2023/6/19.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

@import CRIMSDKCore;

typedef void (^CRIMUploadProgressCallback)(NSInteger saveBytes, NSInteger currentBytes, NSInteger totalBytes);
typedef void (^CRIMUploadCompletionCallback)(NSInteger totalBytes, NSString * _Nonnull url, NSInteger putType);

NS_ASSUME_NONNULL_BEGIN

@interface UploadFileCallbackProxy : NSObject <Crim_sdk_callbackUploadFileCallback>

- (instancetype)initWithOnProgress:(CRIMUploadProgressCallback)progress
                      onCompletion:(CRIMUploadCompletionCallback)completion;

@end

NS_ASSUME_NONNULL_END
