//
//  CRIMMessageElem.h
//  CRIMSDK
//
//  Created by tom on 2023/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRIMMessageEntity : NSObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *info;
@end

@interface CRIMAdvancedTextElem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSArray <CRIMMessageEntity *> *messageEntityList;

@end

@interface CRIMMessageElem : NSObject



@end

@interface CRIMTextElem : NSObject

@property (nonatomic, copy) NSString *content;

@end

@interface CRIMCardElem : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *faceURL;
@property (nonatomic, copy) NSString *ex;

@end

@interface CRIMTypingElem : NSObject

@property (nonatomic, copy) NSString *msgTips;

@end

NS_ASSUME_NONNULL_END
