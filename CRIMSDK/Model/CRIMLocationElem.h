//
//  CRIMLocationElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRIMLocationElem : NSObject

@property (nonatomic, nullable, copy) NSString *desc;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;

@end

NS_ASSUME_NONNULL_END
