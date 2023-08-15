//
//  IMDefine.h
//  CRIMSDK
//
//  Created by tom on 2023/2/14.
//

#ifndef IMDefine_h
#define IMDefine_h

typedef NS_ENUM(NSInteger, CRIMPlatform) {
    iPhone = 1, // iPhone
    iPad = 9,   // iPad
};

typedef void (^CRIMVoidCallback)(void);
typedef void (^CRIMSuccessCallback)(NSString * _Nullable data);
typedef void (^CRIMFailureCallback)(NSInteger code, NSString * _Nullable msg);
typedef void (^CRIMNumberCallback)(NSInteger number);
typedef void (^CRIMStringCallback)(NSString * _Nullable item);
typedef void (^CRIMStringArrayCallback)(NSString * _Nullable value1, NSArray<NSString *> * _Nullable value2);
typedef void (^CRIMObjectCallback)(NSDictionary * _Nullable item);

/*
 *  消息类型
 */
typedef NS_ENUM(NSInteger, CRIMMessageContentType) {
    CRIMMessageContentTypeText = 101,                /// 文本消息
    CRIMMessageContentTypeImage = 102,               /// 图片消息
    CRIMMessageContentTypeAudio = 103,               /// 语音消息
    CRIMMessageContentTypeVideo = 104,               /// 视频消息
    CRIMMessageContentTypeFile = 105,                /// 文件消息
    CRIMMessageContentTypeAt = 106,                  /// @消息
    CRIMMessageContentTypeMerge = 107,               /// 合并消息
    CRIMMessageContentTypeCard = 108,                /// 名片消息
    CRIMMessageContentTypeLocation = 109,            /// 位置消息
    CRIMMessageContentTypeCustom = 110,              /// 自定义消息
    CRIMMessageContentTypeTyping = 113,              /// 正在输入状态
    CRIMMessageContentTypeQuote = 114,               /// 引用消息
    CRIMMessageContentTypeFace = 115,                /// 动图消息
    CRIMMessageContentTypeAdvancedText = 117,        /// Advanced消息
    CRIMMessageContentTypeCustomMsgNotTriggerConversation = 119,      /// 后端API会用到
    CRIMMessageContentTypeCustomMsgOnlineOnly = 120,      /// 后端API会用到
    /// 以下皆是通知消息枚举
    CRIMMessageContentTypeFriendAppApproved = 1201,              /// 同意加好友申请通知
    CRIMMessageContentTypeFriendAppRejected = 1202,              /// 拒绝加好友申请通知
    CRIMMessageContentTypeFriendApplication = 1203,              /// 加好友通知
    CRIMMessageContentTypeFriendAdded = 1204,                    /// 添加好友通知
    CRIMMessageContentTypeFriendDeleted = 1205,                  /// 删除好友通知
    CRIMMessageContentTypeFriendRemarkSet = 1206,                /// 设置好友备注通知
    CRIMMessageContentTypeBlackAdded = 1207,                     /// 加黑名单通知
    CRIMMessageContentTypeBlackDeleted = 1208,                   /// 移除黑名单通知
    CRIMMessageContentTypeConversationOptChange = 1300,          /// 会话免打扰设置通知
    CRIMMessageContentTypeUserInfoUpdated = 1303,                /// 个人信息变更通知
    CRIMMessageContentTypeOANotification = 1400,                 /// oa 通知
    CRIMMessageContentTypeGroupCreated = 1501,                   /// 群创建通知
    CRIMMessageContentTypeGroupInfoSet = 1502,                   /// 更新群信息通知
    CRIMMessageContentTypeJoinGroupApplication = 1503,           /// 申请加群通知
    CRIMMessageContentTypeMemberQuit = 1504,                     /// 群成员退出通知
    CRIMMessageContentTypeGroupAppAccepted = 1505,               /// 同意加群申请通知
    CRIMMessageContentTypeGroupAppRejected = 1506,               /// 拒绝加群申请通知
    CRIMMessageContentTypeGroupOwnerTransferred = 1507,          /// 群主更换通知
    CRIMMessageContentTypeMemberKicked = 1508,                   /// 群成员被踢通知
    CRIMMessageContentTypeMemberInvited = 1509,                  /// 邀请群成员通知
    CRIMMessageContentTypeMemberEnter = 1510,                    /// 群成员进群通知
    CRIMMessageContentTypeDismissGroup = 1511,                   /// 解散群通知
    CRIMMessageContentTypeGroupMemberMutedNotification = 1512,
    CRIMMessageContentTypeGroupMemberCancelMutedNotification = 1513,
    CRIMMessageContentTypeGroupMutedNotification = 1514,
    CRIMMessageContentTypeGroupCancelMutedNotification = 1515,
    CRIMMessageContentTypeGroupMemberInfoSetNotification = 1516,
    CRIMMessageContentTypeGroupMemberSetToAdminNotification = 1517,
    CRIMMessageContentTypeGroupMemberSetToOrdinaryUserNotification = 1518,
    CRIMMessageContentTypeGroupAnnouncement = 1519,              /// 群公告
    CRIMMessageContentTypeGroupSetNameNotification = 1520,       /// 修改群名称
    CRIMMessageContentTypeSuperGroupUpdateNotification = 1651,
    CRIMMessageContentTypeConversationPrivateChatNotification = 1701,
    CRIMMessageContentTypeOrganizationChangedNotification = 1801,
    CRIMMessageContentTypeIsPrivateMessage = 1701,               /// 阅后即焚通知
    CRIMMessageContentTypeBusiness = 2001,                       /// 业务通知
    CRIMMessageContentTypeRevoke = 2101,                         /// 撤回消息
    CRIMMessageContentTypeHasReadReceipt = 2150,                 /// 单聊已读回执
    CRIMMessageContentTypeGroupHasReadReceipt = 2155,            /// 群已读回执

};

/*
 *  消息状态
 */
typedef NS_ENUM(NSInteger, CRIMMessageStatus) {
    CRIMMessageStatusUndefine = 0,   /// 为定义
    CRIMMessageStatusSending = 1,    /// 发送中
    CRIMMessageStatusSendSuccess,    /// 发送成功
    CRIMMessageStatusSendFailure,    /// 发送失败
    CRIMMessageStatusDeleted,        /// 已删除
    CRIMMessageStatusRevoke          /// 已撤回，客户端不用关心
};

/*
 *  会话类型
 */
typedef NS_ENUM(NSInteger, CRIMConversationType) {
    CRIMConversationTypeUndefine = 0,
    CRIMConversationTypeC2C,                 /// 单聊
    CRIMConversationTypeGroup,               /// 群聊
    CRIMConversationTypeSuperGroup = 3,      /// 超级大群
    CRIMConversationTypeNotification = 4     /// 通知
};

/*
 *  标识消息级别
 */
typedef NS_ENUM(NSInteger, CRIMMessageLevel) {
    CRIMMessageLevelUser = 100,  /// 用户
    CRIMMessageLevelSystem = 200 /// 系统
};

/*
 *  消息接收选项
 */
typedef NS_ENUM(NSInteger, CRIMReceiveMessageOpt) {
    CRIMReceiveMessageOptReceive = 0,    /// 在线正常接收消息，离线时会进行 APNs 推送
    CRIMReceiveMessageOptNotReceive = 1, /// 不会接收到消息，离线不会有推送通知
    CRIMReceiveMessageOptNotNotify = 2,  /// 在线正常接收消息，离线不会有推送通知
};

typedef NS_ENUM(NSInteger, CRIMGroupMemberFilter) {
    CRIMGroupMemberFilterAll               = 0,    /// 所有，查询可用
    CRIMGroupMemberFilterOwner             = 1,    /// 群主
    CRIMGroupMemberFilterAdmin             = 2,    /// 群管理员
    CRIMGroupMemberFilterMember            = 3,    /// 群成员
    CRIMGroupMemberFilterAdminAndMember    = 4,    /// 管理员和成员
    CRIMGroupMemberFilterSuperAndAdmin     = 5,    /// 群主和管理员
};

typedef NS_ENUM(NSInteger, CRIMGroupMemberRole) {
    CRIMGroupMemberRoleOwner     = 100,   /// 群主
    CRIMGroupMemberRoleAdmin     = 60,    /// 群管理员
    CRIMGroupMemberRoleMember    = 20,    /// 群成员
};

/*
 *  性别类型
 */
typedef NS_ENUM(NSInteger, CRIMGender)  {
    CRIMGenderMale = 1,  /// 男性
    CRIMGenderFemale /// 女性
};

typedef NS_ENUM(NSInteger, CRIMApplicationStatus) {
    CRIMApplicationStatusDecline = -1,   /// 已拒绝
    CRIMApplicationStatusNormal = 0,     /// 等待处理
    CRIMApplicationStatusAccept = 1,     /// 已同意
};

typedef NS_ENUM(NSInteger, CRIMRelationship) {
    CRIMRelationshipBlack  = 0,
    CRIMRelationshipFriend = 1
};

typedef NS_ENUM(NSInteger, CRIMGroupAtType) {
    CRIMGroupAtTypeAtNormal = 0,
    CRIMGroupAtTypeAtMe = 1,
    CRIMGroupAtTypeAtAll = 2,
    CRIMGroupAtTypeAtAllAtMe = 3,
    CRIMGroupAtTypeGroupNotification = 4
};

/*
 *  进群验证设置选项
 */
typedef NS_ENUM(NSInteger,  CRIMGroupVerificationType) {
    CRIMGroupVerificationTypeApplyNeedVerificationInviteDirectly = 0,    /// 申请需要同意 邀请直接进
    CRIMGroupVerificationTypeAllNeedVerification = 1,                    /// 所有人进群需要验证，除了群主管理员邀
    CRIMGroupVerificationTypeDirectly = 2,                               /// 直接进群
};

/**
 群类型
 */
typedef NS_ENUM(NSInteger, CRIMGroupType) {
    CRIMGroupTypeNormal = 0,     /// 普通群
    CRIMGroupTypeSuper = 1,      /// 超级群
    CRIMGroupTypeWorking = 2,    /// 工作群
};

/**
 群状态
 */
typedef NS_ENUM(NSInteger, CRIMGroupStatus) {
    CRIMGroupStatusOk = 0,       /// 正常
    CRIMGroupStatusBanChat = 1,  /// 被封
    CRIMGroupStatusDismissed = 2,/// 解散
    CRIMGroupStatusMuted = 3,    /// 禁言
};

/**
 入群方式
 */
typedef NS_ENUM(int32_t, CRIMJoinType) {
    CRIMJoinTypeInvited = 2, /// 通过邀请
    CRIMJoinTypeSearch = 3,  /// 通过搜索
    CRIMJoinTypeQRCode = 4   /// 通过二维码
};

#endif /* IMDefine_h */
