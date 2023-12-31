//
//  CRIMSoundElem.h
//  CRIMSDK
//
//  Created by tom on 2023/2/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRIMSoundElem : NSObject

/*
 * 唯一ID
 */
@property (nonatomic, nullable, copy) NSString *uuID;

/*
 * 本地资源地址
 */
@property (nonatomic, nullable, copy) NSString *soundPath;

/*
 * oss地址
 */
@property (nonatomic, nullable, copy) NSString *sourceUrl;

/*
 * 音频大小
 */
@property (nonatomic, assign) NSInteger dataSize;

/*
 * 音频时长
 */
@property (nonatomic, assign) NSInteger duration;

@end

NS_ASSUME_NONNULL_END
