//
//  CRIMManager+Message.m
//  CRIMSDK
//
//  Created by tom on 2023/2/16.
//

#import "CRIMManager+Message.h"
#import "SendMessageCallbackProxy.h"

@implementation CRIMMessageInfo (extension)

- (BOOL)isSelf {
    return [self.sendID isEqualToString:[CRIMManager.manager getLoginUserID]];
}

+ (CRIMMessageInfo *)convertToMessageInfo:(NSString *)json {
    CRIMMessageInfo *msg = [CRIMMessageInfo mj_objectWithKeyValues:json];
    msg.status = CRIMMessageStatusUndefine;
    
    return msg;
}

+ (CRIMMessageInfo *)createTextMsg:(NSString *)text {
    NSString *json = Crim_sdkCreateTextMsg([CRIMManager.manager operationId], text);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMAtInfo *)createAtAllFlag:(NSString *)displayText {
    CRIMAtInfo *all = [CRIMAtInfo new];
    all.atUserID = Crim_sdkGetAtAllTag([[NSUUID UUID]UUIDString]);
    all.groupNickname = displayText ?: @"Mention All";
    
    return all;
}

+ (CRIMMessageInfo *)createTextAtMsg:(NSString *)text
                              atUsersID:(NSArray<NSString *> *)atUsersID
                            atUsersInfo:(NSArray<CRIMAtInfo *> *)atUsersInfo
                                message:(CRIMMessageInfo *)message {
    
    NSArray *atUsers = [CRIMAtInfo mj_keyValuesArrayWithObjectArray:atUsersInfo];
    NSString *atUsersJson = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:atUsers options:0 error:nil] encoding:NSUTF8StringEncoding];
    
    NSString *json = Crim_sdkCreateTextAtMsg([CRIMManager.manager operationId], text, atUsersID.mj_JSONString, atUsersJson, message ? message.mj_JSONString : @"");
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createTextAtAllMsg:(NSString *)text
                               displayText:(NSString *)displayText
                                   message:(CRIMMessageInfo * _Nullable)message {
    NSString *json = Crim_sdkCreateTextAtMsg([CRIMManager.manager operationId], text, @[Crim_sdkGetAtAllTag([[NSUUID UUID]UUIDString])].mj_JSONString, @[@{Crim_sdkGetAtAllTag([[NSUUID UUID]UUIDString]): displayText ?: @"@全体成员"}].mj_JSONString, message ? message.mj_JSONString : @"");
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createImageMsg:(NSString *)imagePath {
    NSString *json = Crim_sdkCreateImageMsg([CRIMManager.manager operationId], imagePath);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createImageMsgFromFullPath:(NSString *)imagePath {
    NSString *json = Crim_sdkCreateImageMsgFromFullPath([CRIMManager.manager operationId], imagePath);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createImageMsgByURL:(CRIMPictureInfo *)source
                                 bigPicture:(CRIMPictureInfo *)big
                            snapshotPicture:(CRIMPictureInfo *)snapshot {
    
    NSString *json = Crim_sdkCreateImageMsgByURL([CRIMManager.manager operationId], source.mj_JSONString, big.mj_JSONString, snapshot.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createSoundMsg:(NSString *)soundPath
                              duration:(NSInteger)duration {
    NSString *json = Crim_sdkCreateSoundMsg([CRIMManager.manager operationId], soundPath, duration);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createSoundMsgFromFullPath:(NSString *)soundPath
                                          duration:(NSInteger)duration {
    NSString *json = Crim_sdkCreateSoundMsgFromFullPath([CRIMManager.manager operationId], soundPath, duration);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createSoundMsgByURL:(NSString *)fileURL
                                   duration:(NSInteger)duration
                                       size:(NSInteger)size {
    CRIMSoundElem *elem = [CRIMSoundElem new];
    elem.sourceUrl = fileURL;
    elem.duration = duration;
    elem.dataSize = size;
    
    NSString *json = Crim_sdkCreateSoundMsgByURL([CRIMManager.manager operationId], elem.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createVideoMsg:(NSString *)videoPath
                             videoType:(NSString *)videoType
                              duration:(NSInteger)duration
                          snapshotPath:(NSString *)snapshotPath {
    NSString *json = Crim_sdkCreateVideoMsg([CRIMManager.manager operationId], videoPath, videoType, duration, snapshotPath);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createVideoMsgFromFullPath:(NSString *)videoPath
                                         videoType:(NSString *)videoType
                                          duration:(NSInteger)duration
                                      snapshotPath:(NSString *)snapshotPath {
    NSString *json = Crim_sdkCreateVideoMsgFromFullPath([CRIMManager.manager operationId], videoPath, videoType, duration, snapshotPath);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createVideoMsgByURL:(NSString *)fileURL
                                  videoType:(NSString *)videoType
                                   duration:(NSInteger)duration
                                       size:(NSInteger)size
                                   snapshot:(NSString *)snapshotURL {
    CRIMVideoElem *elem = [CRIMVideoElem new];
    elem.videoUrl = fileURL;
    elem.videoType = videoType;
    elem.duration = duration;
    elem.videoSize = size;
    elem.snapshotUrl = snapshotURL;
    
    NSString *json = Crim_sdkCreateVideoMsgByURL([CRIMManager.manager operationId], elem.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createFileMsg:(NSString *)filePath
                             fileName:(NSString *)fileName {
    NSString *json = Crim_sdkCreateFileMsg([CRIMManager.manager operationId], filePath, fileName);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createFileMsgFromFullPath:(NSString *)filePath
                                         fileName:(NSString *)fileName {
    NSString *json = Crim_sdkCreateFileMsgFromFullPath([CRIMManager.manager operationId], filePath, fileName);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createFileMsgByURL:(NSString *)fileURL
                                  fileName:(NSString *)fileName
                                      size:(NSInteger)size {
    CRIMFileElem *elem = [CRIMFileElem new];
    elem.sourceUrl = fileURL;
    elem.fileName = fileName ?: fileURL.lastPathComponent;
    elem.fileSize = size;
    
    NSString *json = Crim_sdkCreateFileMsgByURL([CRIMManager.manager operationId], elem.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createMergeMsg:(NSArray<CRIMMessageInfo *> *)messages
                                 title:(NSString *)title
                           summaryList:(NSArray<NSString *> *)summarys {
    NSArray *msgs = [CRIMMessageInfo mj_keyValuesArrayWithObjectArray:messages];
    NSString *json = Crim_sdkCreateMergerMsg([CRIMManager.manager operationId], [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:msgs options:0 error:nil] encoding:NSUTF8StringEncoding], title, summarys.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createForwardMsg:(CRIMMessageInfo *)message {
    NSString *json = Crim_sdkCreateForwardMsg([CRIMManager.manager operationId], message.mj_JSONString);
    
    return [CRIMMessageInfo mj_objectWithKeyValues:json];
}

+ (CRIMMessageInfo *)createLocationMsg:(NSString *)description
                                 latitude:(double)latitude
                                longitude:(double)longitude {
    NSString *json = Crim_sdkCreateLocationMsg([CRIMManager.manager operationId], description, longitude, latitude);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createQuoteMsg:(NSString *)text
                               message:(CRIMMessageInfo *)message {
    NSString *json = Crim_sdkCreateQuoteMsg([CRIMManager.manager operationId], text, message.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createCardMsg:(CRIMCardElem *)card {
    
    NSString *json = Crim_sdkCreateCardMsg([CRIMManager.manager operationId], card.mj_JSONString);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createCustomMsg:(NSString *)data
                              extension:(NSString *)extension
                            description:(NSString *)description {
    NSString *json = Crim_sdkCreateCustomMsg([CRIMManager.manager operationId], data, extension, description);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createFaceMsgWithIndex:(NSInteger)index
                                          data:(NSString *)dataStr {
    NSString *json = Crim_sdkCreateFaceMsg([CRIMManager.manager operationId], index, dataStr);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createAdvancedTextMsg:(NSString *)text
                            messageEntityList:(NSArray<CRIMMessageEntity *> *)messageEntityList {
    NSArray *msgs = [CRIMMessageEntity mj_keyValuesArrayWithObjectArray:messageEntityList];
    NSString *json = Crim_sdkCreateAdvancedTextMsg([CRIMManager.manager operationId], text, [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:msgs options:0 error:nil] encoding:NSUTF8StringEncoding]);
    
    return [self convertToMessageInfo:json];
}

+ (CRIMMessageInfo *)createAdvancedQuoteMsg:(NSString *)text
                                       message:(CRIMMessageInfo *)message
                             messageEntityList:(NSArray<CRIMMessageEntity *> *)messageEntityList {
    NSArray *msgs = [CRIMMessageEntity mj_keyValuesArrayWithObjectArray:messageEntityList];
    NSString *json = Crim_sdkCreateAdvancedQuoteMsg([CRIMManager.manager operationId], text, message.mj_JSONString, [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:msgs options:0 error:nil] encoding:NSUTF8StringEncoding]);
    
    return [self convertToMessageInfo:json];
}

@end

@implementation CRIMManager (Message)

- (void)sendMsg:(CRIMMessageInfo *)message
             recvID:(NSString *)recvID
            groupID:(NSString *)groupID
    offlinePushInfo:(CRIMOfflinePushInfo *)offlinePushInfo
          onSuccess:(CRIMMessageInfoCallback)onSuccess
         onProgress:(CRIMNumberCallback)onProgress
          onFailure:(CRIMFailureCallback)onFailure {
    
    assert(recvID.length != 0 || groupID.length != 0);
    
    SendMessageCallbackProxy *callback = [[SendMessageCallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMMessageInfo mj_objectWithKeyValues:data]);
        }
    } onProgress:onProgress onFailure:onFailure];
    
    Crim_sdkSendMsg(callback, [self operationId], message.mj_JSONString, recvID ?: @"", groupID ?: @"", offlinePushInfo ? offlinePushInfo.mj_JSONString : @"{}");
}

- (void)sendMsgNotOss:(CRIMMessageInfo *)message
                   recvID:(NSString *)recvID
                  groupID:(NSString *)groupID
          offlinePushInfo:(CRIMOfflinePushInfo *)offlinePushInfo
                onSuccess:(CRIMMessageInfoCallback)onSuccess
               onProgress:(CRIMNumberCallback)onProgress
                onFailure:(CRIMFailureCallback)onFailure {
    
    assert(recvID.length != 0 || groupID.length != 0);
    
    SendMessageCallbackProxy *callback = [[SendMessageCallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMMessageInfo mj_objectWithKeyValues:data]);
        }
    } onProgress:onProgress onFailure:onFailure];
    
    Crim_sdkSendMsgNotOss(callback, [self operationId], message.mj_JSONString, recvID, groupID, offlinePushInfo.mj_JSONString);
}

- (void)revokeMsg:(NSString *)conversationID
          clientMsgID:(NSString *)clientMsgID
            onSuccess:(CRIMSuccessCallback)onSuccess
            onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkRevokeMsg(callback, [self operationId], conversationID, clientMsgID);
}

- (void)typingStatusUpdate:(NSString *)recvID
                    msgTip:(NSString *)msgTip
                 onSuccess:(CRIMSuccessCallback)onSuccess
                 onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkTypingStatusUpdate(callback, [self operationId], recvID, msgTip);
}

- (void)markMsgAsReadByMsgID:(NSString *)conversationID
                    clientMsgIDs:(NSArray <NSString *> *)clientMsgIDs
                       onSuccess:(nullable CRIMSuccessCallback)onSuccess
                       onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkMarkMsgsAsReadByMsgID(callback, [self operationId], conversationID, clientMsgIDs.mj_JSONString);
}

- (void)deleteMsg:(NSString *)conversationID
          clientMsgID:(NSString *)clientMsgID
            onSuccess:(nullable CRIMSuccessCallback)onSuccess
            onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteMsg(callback, [self operationId], conversationID, clientMsgID);
}

- (void)deleteMsgFromLocalStorage:(NSString *)conversationID
                          clientMsgID:(NSString *)clientMsgID
                            onSuccess:(CRIMSuccessCallback)onSuccess
                            onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteMsgFromLocalStorage(callback, [self operationId], conversationID, clientMsgID);
}

- (void)deleteAllMsgFromLocalWithOnSuccess:(nullable CRIMSuccessCallback)onSuccess
                                 onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteAllMsgFromLocal(callback, [self operationId]);
}

- (void)deleteAllMsgFromLocalAndSvrWithOnSuccess:(nullable CRIMSuccessCallback)onSuccess
                                       onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkDeleteAllMsgFromLocalAndSvr(callback, [self operationId]);
}

- (void)insertSingleMsgToLocalStorage:(CRIMMessageInfo *)message
                                   recvID:(NSString *)recvID
                                   sendID:(NSString *)sendID
                                onSuccess:(CRIMMessageInfoCallback)onSuccess
                                onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMMessageInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkInsertSingleMsgToLocalStorage(callback, [self operationId], message.mj_JSONString, recvID, sendID);
}

- (void)insertGrpMsgToLocalStorage:(CRIMMessageInfo *)message
                                 groupID:(NSString *)groupID
                                  sendID:(NSString *)sendID
                               onSuccess:(CRIMMessageInfoCallback)onSuccess
                               onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMMessageInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkInsertGrpMsgToLocalStorage(callback, [self operationId], message.mj_JSONString, groupID, sendID);
}

- (void)searchLocalMsgs:(CRIMSearchParam *)param
                  onSuccess:(CRIMMessageSearchCallback)onSuccess
                  onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMSearchResultInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkSearchLocalMsgs(callback, [self operationId], param.mj_JSONString);
}

- (void)uploadFile:(NSString *)fullPath
           name:(NSString * _Nullable)name
          cause:(NSString * _Nullable)cause
     onProgress:(CRIMUploadProgressCallback)onProgress
   onCompletion:(CRIMUploadCompletionCallback)onCompletion
      onSuccess:(CRIMSuccessCallback)onSuccess
      onFailure:(CRIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    UploadFileCallbackProxy *upload = [[UploadFileCallbackProxy alloc]initWithOnProgress:onProgress onCompletion:onCompletion];
    
    NSDictionary *param = @{@"putID": fullPath.lastPathComponent,
                            @"name": name ?: fullPath.lastPathComponent,
                            @"filepath": fullPath,
                            @"cause": cause ?: @""};
    
    Crim_sdkUploadFile(callback, [self operationId], param.mj_JSONString, upload);
}

- (void)setGlobalRecvMsgOpt:(CRIMReceiveMessageOpt)opt
                      onSuccess:(CRIMSuccessCallback)onSuccess
                      onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetGlobalRecvMsgOpt(callback, [self operationId], opt);
}

- (void)getAdvancedHistoryMsgList:(CRIMGetAdvancedHistoryMessageListParam *)opts
                            onSuccess:(CRIMGetAdvancedHistoryMessageListCallback)onSuccess
                            onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGetAdvancedHistoryMessageListInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetAdvancedHistoryMsgList(callback, [self operationId], opts.mj_JSONString);
}

- (void)getAdvancedHistoryMsgListReverse:(CRIMGetAdvancedHistoryMessageListParam *)opts
                                   onSuccess:(nullable CRIMGetAdvancedHistoryMessageListCallback)onSuccess
                                   onFailure:(nullable CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMGetAdvancedHistoryMessageListInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    Crim_sdkGetAdvancedHistoryMsgListReverse(callback, [self operationId], opts.mj_JSONString);
}

- (void)findMsgList:(NSArray<CRIMFindMessageListParam *> *)param
              onSuccess:(CRIMMessageSearchCallback)onSuccess
              onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([CRIMSearchResultInfo mj_objectWithKeyValues:data]);
        }
    } onFailure:onFailure];
    
    NSArray *params = [CRIMFindMessageListParam mj_keyValuesArrayWithObjectArray:param];
    
    Crim_sdkFindMsgList(callback, [self operationId], params.mj_JSONString);
}

- (void)setAppBadge:(NSInteger)count
          onSuccess:(CRIMSuccessCallback)onSuccess
          onFailure:(CRIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Crim_sdkSetAppBadge(callback, [self operationId], (int32_t)count);
}

@end
