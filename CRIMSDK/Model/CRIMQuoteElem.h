//
//  CRIMQuoteElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMMessageElem.h"
@class CRIMMessageInfo;

NS_ASSUME_NONNULL_BEGIN

@interface CRIMQuoteElem : NSObject

@property (nonatomic, nullable, copy) NSString *text;

@property (nonatomic, nullable, strong) CRIMMessageInfo *quoteMessage;

@property (nonatomic, nullable, copy) NSArray <CRIMMessageEntity *> *messageEntityList;
@end

NS_ASSUME_NONNULL_END
