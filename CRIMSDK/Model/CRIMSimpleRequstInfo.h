//
//  CRIMSimpleRequstInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRIMSimpleRequstInfo : NSObject

@property (nonatomic, nullable, copy) NSString *toUserID;

// 仅 添加好友申请
@property (nonatomic, nullable, copy) NSString *reqMsg;

// 仅 设置好友备注
@property (nonatomic, nullable, copy) NSString *remark;

// 仅 同意某人的好友申请
@property (nonatomic, nullable, copy) NSString *handleMsg;

@end

NS_ASSUME_NONNULL_END
