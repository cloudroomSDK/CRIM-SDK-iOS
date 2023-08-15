//
//  CRIMUserInfo.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMDefine.h"

NS_ASSUME_NONNULL_BEGIN

///个人信息，所有信息都包括
///
@interface CRIMUserInfo : NSObject

@property (nonatomic, nullable, copy) NSString *userID;
@property (nonatomic, nullable, copy) NSString *nickname;
@property (nonatomic, nullable, copy) NSString *faceURL;
@property (nonatomic, assign) NSInteger createTime;
@property (nonatomic, nullable, copy) NSString *ex;
@property (nonatomic, nullable, copy) NSString *attachedInfo;
@property (nonatomic, assign) CRIMReceiveMessageOpt globalRecvMsgOpt;
@end

NS_ASSUME_NONNULL_END
