//
//  CRIMManager.h
//  CRIMSDK
//
//  Created by tom on 2023/2/15.
//

#import <Foundation/Foundation.h>
#import "CRIMCallbacker.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMManager : NSObject 

+ (instancetype)manager;

/*
 *  监听设置皆在此 (User、Friend、Group、Conversation、AdvancedMsg等)
 */
@property (nonatomic, strong, class, readonly) CRIMManager *manager;
@property (nonatomic, strong, class, readonly) CRIMCallbacker *callbacker;
@property (nonatomic, copy, nullable) NSString *token;
@property (nonatomic, copy, nullable) NSString *objectStorage;
/*
 * sdk 版本号
 */
+ (NSString *)sdkSdkVersion;

/*
 * 获取登录用户uid
 */
- (NSString *)getLoginUserID;

- (NSString *)operationId;
@end

NS_ASSUME_NONNULL_END
