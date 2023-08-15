//
//  CRIMManager.m
//  CRIMSDK
//
//  Created by tom on 2023/2/15.
//

#import "CRIMManager.h"
#import "Reachability.h"
#import "CallbackProxy.h"

@interface CRIMManager ()
{
    CRIMCallbacker *_callbacker;
    Reachability *internetReachability;
}

@end

@implementation CRIMManager
@dynamic callbacker;

+ (instancetype)manager {
    
    static CRIMManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CRIMManager alloc]init];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        // app从后台进入前台都会调用这个方法
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForeground:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        // 添加检测app进入后台的观察者
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
    
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        
        internetReachability = [Reachability reachabilityForInternetConnection];
        [internetReachability startNotifier];
    }
    
    return self;
}

+ (CRIMCallbacker *)callbacker {
    return [CRIMManager manager].callbacker;
}

- (CRIMCallbacker *)callbacker {
    if (_callbacker == nil) {
        _callbacker = [CRIMCallbacker callbacker];
    }
    return _callbacker;
}

+ (NSString *)sdkSdkVersion
{
    return Crim_sdkGetSdkVersion();
}

- (NSString *)getLoginUserID {
    return Crim_sdkGetLoginUserID();
}

- (NSString *)operationId {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%ld", (NSInteger)time];
}

- (void)applicationDidEnterBackground:(NSNotification *)note {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        
    } onFailure:^(NSInteger code, NSString * _Nullable msg) {
        
    }];

    Crim_sdkSetAppBackgroundStatus(callback, [self operationId], YES);
}

- (void)applicationWillEnterForeground:(NSNotification *)note {

    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        
    } onFailure:^(NSInteger code, NSString * _Nullable msg) {
        
    }];

    Crim_sdkSetAppBackgroundStatus(callback, [self operationId], NO);
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *reachability = [note object];
    NSParameterAssert([reachability isKindOfClass:[Reachability class]]);

    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        
    } onFailure:^(NSInteger code, NSString * _Nullable msg) {
        
    }];
    
    Crim_sdkNetworkStatusChanged(callback, [self operationId]);
}

@end
