//
//  CRIMFaceElem.h
//  CRIMSDK
//
//  Created by tom on 2023/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRIMFaceElem : NSObject

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, nullable, copy) NSString *data;
@end

NS_ASSUME_NONNULL_END
