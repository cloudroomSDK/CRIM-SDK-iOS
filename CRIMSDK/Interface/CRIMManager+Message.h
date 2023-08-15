//
//  CRIMManager+Message.h
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager.h"
#import "UploadFileCallbackProxy.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRIMMessageInfo (extension)

/*
 *  是否是发送出去的消息
 */
- (BOOL)isSelf;

/*
 * 创建文本消息
 *
 * @param text 内容
 */
+ (CRIMMessageInfo *)createTextMsg:(NSString *)text;


/**
   可配套createTextAtMessage使用，将@所有人标识插入指定位置
 */
+ (CRIMAtInfo *)createAtAllFlag:(NSString *)displayText;


/*
 * 创建@文本消息
 *
 * @param text      内容
 * @param atUsersID 用户id列表
 * @param atUsersInfo 用户在群内的信息
 * @param message 引用消息的时候使用
 */
+ (CRIMMessageInfo *)createTextAtMsg:(NSString *)text
                              atUsersID:(NSArray<NSString *> *)atUsersID
                            atUsersInfo:(NSArray<CRIMAtInfo *> *)atUsersInfo
                                message:(CRIMMessageInfo * _Nullable)message;

/*
 * 创建@全体成员文本消息
 *
 * @param text      内容
 * @param displayText 展示的内容, 例如“@全体成员“
 * @param message 引用消息的时候使用
 */
+ (CRIMMessageInfo *)createTextAtAllMsg:(NSString *)text
                               displayText:(NSString * _Nullable)displayText
                                   message:(CRIMMessageInfo * _Nullable)message;

/*
 * 创建图片消息（
 * initSDK时传入了数据缓存路径，如路径：A，这时需要你将图片复制到A路径下后，如 A/pic/a.png路径，imagePath的值：“/pic/.png”
 *
 * @param imagePath 相对路径
 */
+ (CRIMMessageInfo *)createImageMsg:(NSString *)imagePath;

/*
 * 创建图片消息
 *
 * @param imagePath 绝对路径
 */
+ (CRIMMessageInfo *)createImageMsgFromFullPath:(NSString *)imagePath;

/*
 * 创建音频消息
 * 例如：自行上传的文件，然后使用返回的url发送消息
 *
 */
+ (CRIMMessageInfo *)createImageMsgByURL:(CRIMPictureInfo *)source
                                 bigPicture:(CRIMPictureInfo *)big
                            snapshotPicture:(CRIMPictureInfo *)snapshot;
                                   

/*
 * 创建声音消息
 * initSDK时传入了数据缓存路径，如路径：A，这时需要你将声音文件复制到A路径下后，如 A/voice/a.m4c路径，soundPath的值：“/voice/.m4c”
 *
 * @param soundPath 相对路径
 * @param duration  时长
 */
+ (CRIMMessageInfo *)createSoundMsg:(NSString *)soundPath
                              duration:(NSInteger)duration;

/*
 * 创建声音消息
 *
 * @param soundPath 绝对路径
 * @param duration  时长
 */
+ (CRIMMessageInfo *)createSoundMsgFromFullPath:(NSString *)soundPath
                                          duration:(NSInteger)duration;

/*
 * 创建音频消息
 * 例如：自行上传的文件，然后使用返回的url发送消息
 *
 */
+ (CRIMMessageInfo *)createSoundMsgByURL:(NSString *)fileURL
                                   duration:(NSInteger)duration
                                       size:(NSInteger)size;

/*
 * 创建视频消息
 * initSDK时传入了数据缓存路径，如路径：A，这时需要你将声音文件复制到A路径下后，如 A/video/a.mp4路径，soundPath的值：“/video/.mp4”
 *
 * @param videoPath    视频相对路径
 * @param videoType    mine type
 * @param duration     时长
 * @param snapshotPath 缩略图相对路径
 */
+ (CRIMMessageInfo *)createVideoMsg:(NSString *)videoPath
                             videoType:(NSString *)videoType
                              duration:(NSInteger)duration
                          snapshotPath:(NSString *)snapshotPath;

/*
 * 创建视频消息
 *
 * @param videoPath    绝对路径
 * @param videoType    mine type
 * @param duration     时长
 * @param snapshotPath 缩略图绝对路径
 *
 */
+ (CRIMMessageInfo *)createVideoMsgFromFullPath:(NSString *)videoPath
                                         videoType:(NSString *)videoType
                                          duration:(NSInteger)duration
                                      snapshotPath:(NSString *)snapshotPath;

/*
 * 创建视频频消息
 * 例如：自行上传的文件，然后使用返回的url发送消息
 *
 */
+ (CRIMMessageInfo *)createVideoMsgByURL:(NSString *)fileURL
                                  videoType:(NSString * _Nullable)videoType
                                   duration:(NSInteger)duration
                                      size:(NSInteger)size
                                   snapshot:(NSString * _Nullable)snapshotURL
;

/*
 * 创建文件消息
 * initSDK时传入了数据缓存路径，如路径：A，这时需要你将声音文件复制到A路径下后，如 A/file/a.txt路径，soundPath的值：“/file/.txt”
 *
 * @param filePath 相对路径
 * @param fileName 文件名
 */
+ (CRIMMessageInfo *)createFileMsg:(NSString *)filePath
                             fileName:(NSString *)fileName;

/*
 * 创建文件消息
 * initSDK时传入了数据缓存路径，如路径：A，这时需要你将声音文件复制到A路径下后，如 A/file/a.txt路径，soundPath的值：“/file/.txt”
 *
 * @param filePath 绝对路径
 * @param fileName 文件名
 *
 */
+ (CRIMMessageInfo *)createFileMsgFromFullPath:(NSString *)filePath
                                         fileName:(NSString *)fileName;

/*
 * 创建文件消息
 * 例如：自行上传的文件，然后使用返回的url发送消息
 *
 */
+ (CRIMMessageInfo *)createFileMsgByURL:(NSString *)fileURL
                                  fileName:(NSString * _Nullable)fileName
                                      size:(NSInteger)size;

/*
 * 创建合并消息
 *
 * @param title       标题
 * @param summaryList 摘要
 * @param messageList 消息列表
 */
+ (CRIMMessageInfo *)createMergeMsg:(NSArray <CRIMMessageInfo *> *)messages
                                 title:(NSString *)title
                           summaryList:(NSArray <NSString *> *)summarys;

/*
 * 创建转发消息
 *
 */
+ (CRIMMessageInfo *)createForwardMsg:(CRIMMessageInfo *)message;

/*
 * 创建位置消息
 *
 * @param latitude    经度
 * @param longitude   纬度
 * @param description 描述消息
 */
+ (CRIMMessageInfo *)createLocationMsg:(NSString *)description
                                 latitude:(double)latitude
                                longitude:(double)longitude;

/*
 * 创建引用消息
 *
 * @param text    内容
 * @param message 被引用的消息体
 * 
 */
+ (CRIMMessageInfo *)createQuoteMsg:(NSString *)text
                               message:(CRIMMessageInfo *)message;

/*
 * 创建名片消息
 *
 * @param content String
*/
+ (CRIMMessageInfo *)createCardMsg:(CRIMCardElem *)card;

/*
 * 创建自定义消息
 *
 * @param data        json String
 * @param extension   json String
 * @param description 描述
 */
+ (CRIMMessageInfo *)createCustomMsg:(NSString *)data
                              extension:(NSString * _Nullable)extension
                            description:(NSString * _Nullable)description;

/*
 * 创建动图消息
 *
 */
+ (CRIMMessageInfo *)createFaceMsgWithIndex:(NSInteger)index
                                          data:(NSString *)dataStr;


/*
 * 创建高级消息
 *
 */
+ (CRIMMessageInfo *)createAdvancedTextMsg:(NSString *)text
                            messageEntityList:(NSArray <CRIMMessageEntity *> *)messageEntityList;

/*
 * 创建高级引用消息
 *
 */
+ (CRIMMessageInfo *)createAdvancedQuoteMsg:(NSString *)text
                                       message:(CRIMMessageInfo *)message
                             messageEntityList:(NSArray <CRIMMessageEntity *> *)messageEntityList;

@end

@interface CRIMManager (Message)

/*
 * 发送消息
 *
 * @param message       消息体为通过Create...Message创建的CRIMMessageInfo
 * @param recvID        单聊的用户ID，如果为群聊则为""
 * @param groupID       群聊的群ID，如果为单聊则为""
 * @param offlinePushInfo 离线推送的消息为CRIMOfflinePushInfo
 */
- (void)sendMsg:(CRIMMessageInfo *)message
             recvID:(NSString * _Nullable)recvID
            groupID:(NSString * _Nullable)groupID
    offlinePushInfo:(CRIMOfflinePushInfo * _Nullable)offlinePushInfo
          onSuccess:(nullable CRIMMessageInfoCallback)onSuccess
         onProgress:(nullable CRIMNumberCallback)onProgress
          onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 发送消息不通过sdk内置OSS上传多媒体文件
 *
 * @param message       消息体为通过Create...Message创建的CRIMMessageInfo
 * @param recvID        单聊的用户ID，如果为群聊则为""
 * @param groupID       群聊的群ID，如果为单聊则为""
 * @param offlinePushInfo 离线推送的消息为CRIMOfflinePushInfo
 */
- (void)sendMsgNotOss:(CRIMMessageInfo *)message
                   recvID:(NSString * _Nullable)recvID
                  groupID:(NSString * _Nullable)groupID
          offlinePushInfo:(CRIMOfflinePushInfo * _Nullable)offlinePushInfo
                onSuccess:(nullable CRIMMessageInfoCallback)onSuccess
               onProgress:(nullable CRIMNumberCallback)onProgress
                onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 撤回一条消息
 *
 * @param conversationID 会话ID
 * @param clientMsgID    消息ID
 *
 */
- (void)revokeMsg:(NSString *)conversationID
          clientMsgID:(NSString *)clientMsgID
            onSuccess:(CRIMSuccessCallback)onSuccess
            onFailure:(CRIMFailureCallback)onFailure;

/*
 * 单聊正在输入消息
 *
 * @param recvID    接收者的ID
 * @param msgTip    自定义的提示信息
 */
- (void)typingStatusUpdate:(NSString *)recvID
                    msgTip:(NSString *)msgTip
                 onSuccess:(nullable CRIMSuccessCallback)onSuccess
                 onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 标记消息已读
 *
 */
- (void)markMsgAsReadByMsgID:(NSString *)conversationID
                    clientMsgIDs:(NSArray <NSString *> *)clientMsgIDs
                       onSuccess:(nullable CRIMSuccessCallback)onSuccess
                       onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 从本地删除一条消息
 */
- (void)deleteMsgFromLocalStorage:(NSString *)conversationID
                          clientMsgID:(NSString *)clientMsgID
                            onSuccess:(CRIMSuccessCallback)onSuccess
                            onFailure:(CRIMFailureCallback)onFailure;

/**
 删除一条消息  本地 & 服务器
 */
- (void)deleteMsg:(NSString *)conversationID
          clientMsgID:(NSString *)clientMsgID
            onSuccess:(nullable CRIMSuccessCallback)onSuccess
            onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 从本地删除所有消息
 */
- (void)deleteAllMsgFromLocalWithOnSuccess:(nullable CRIMSuccessCallback)onSuccess
                                 onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 删除所有消息  本地 & 服务器
 */
- (void)deleteAllMsgFromLocalAndSvrWithOnSuccess:(nullable CRIMSuccessCallback)onSuccess
                                       onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 插入一条单聊消息到本地
 *
 * @param recvID    接收用户ID
 * @param sendID    发送者ID
 */
- (void)insertSingleMsgToLocalStorage:(CRIMMessageInfo *)message
                                   recvID:(NSString *)recvID
                                   sendID:(NSString *)sendID
                                onSuccess:(nullable CRIMMessageInfoCallback)onSuccess
                                onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 插入一条群聊消息到本地
 *
 * @param groupID   群ID
 * @param sendID    发送者ID
 */
- (void)insertGrpMsgToLocalStorage:(CRIMMessageInfo *)message
                                 groupID:(NSString * _Nullable)groupID
                                  sendID:(NSString * _Nullable)sendID
                               onSuccess:(nullable CRIMMessageInfoCallback)onSuccess
                               onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 查找本地消息
 *
 */
- (void)searchLocalMsgs:(CRIMSearchParam *)param
                  onSuccess:(nullable CRIMMessageSearchCallback)onSuccess
                  onFailure:(nullable CRIMFailureCallback)onFailure;

/*
 * 独立上传文件到初始化sdk的objectStorage（发送多媒体消息不需调用此函数，其在sdk内部自动上传）
 *
 */
- (void)uploadFile:(NSString *)fullPath
           name:(NSString * _Nullable)name
          cause:(NSString * _Nullable)cause
     onProgress:(CRIMUploadProgressCallback)onProgress
   onCompletion:(CRIMUploadCompletionCallback)onCompletion
      onSuccess:(CRIMSuccessCallback)onSuccess
      onFailure:(CRIMFailureCallback)onFailure;

/*
 * 全局设置消息提示
 *
 */
- (void)setGlobalRecvMsgOpt:(CRIMReceiveMessageOpt)opt
                      onSuccess:(nullable CRIMSuccessCallback)onSuccess
                      onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 * Advanced Message 系列使用
 @param opts lastMinSeq  是上一次拉取回调给的值，上下文，第二次拉取需要回传
 */
- (void)getAdvancedHistoryMsgList:(CRIMGetAdvancedHistoryMessageListParam *)opts
                            onSuccess:(nullable CRIMGetAdvancedHistoryMessageListCallback)onSuccess
                            onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 * Advanced Message 系列使用
 @param opts lastMinSeq  是上一次拉取回调给的值，上下文，第二次拉取需要回传
 */
- (void)getAdvancedHistoryMsgListReverse:(CRIMGetAdvancedHistoryMessageListParam *)opts
                                   onSuccess:(nullable CRIMGetAdvancedHistoryMessageListCallback)onSuccess
                                   onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 查找消息列表
 */
- (void)findMsgList:(NSArray<CRIMFindMessageListParam *> *)param
              onSuccess:(nullable CRIMMessageSearchCallback)onSuccess
              onFailure:(nullable CRIMFailureCallback)onFailure;

/**
 设置角标使用，告知服务器 客户端现有的数量
 */
- (void)setAppBadge:(NSInteger)count
          onSuccess:(nullable CRIMSuccessCallback)onSuccess
          onFailure:(nullable CRIMFailureCallback)onFailure;
@end

NS_ASSUME_NONNULL_END
