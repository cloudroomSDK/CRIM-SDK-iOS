//
//  CRIMMergeElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>
#import "CRIMMessageElem.h"
@class CRIMMessageInfo;

NS_ASSUME_NONNULL_BEGIN

@interface CRIMMergeElem : NSObject

@property (nonatomic, nullable, copy) NSString *title;
@property (nonatomic, nullable, copy) NSArray<NSString *> *abstractList;
@property (nonatomic, nullable, copy) NSArray<CRIMMessageInfo *> *multiMessage;
@property (nonatomic, nullable, copy) NSArray<CRIMMessageEntity *> *messageEntityList;

@end

NS_ASSUME_NONNULL_END
