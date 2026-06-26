enum MessageType {
  text,
  image,
  audio,
  system,
}

class GroupChatMessage {
  final String id;

  /// User information
  final String senderId;
  final String senderName;
  final String senderAvatar;

  /// Message content
  final String content;

  /// Audio/Image URL
  final String? mediaUrl;

  /// Message type
  final MessageType type;

  /// Whether message belongs to current user
  final bool isMine;

  /// Time
  final DateTime createdAt;

  /// Audio duration
  final Duration? audioDuration;

  /// Reactions
  final Map<String, int> reactions;

  const GroupChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderAvatar,
    required this.content,
    required this.type,
    required this.isMine,
    required this.createdAt,
    this.mediaUrl,
    this.audioDuration,
    this.reactions = const {},
  });

  GroupChatMessage copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? senderAvatar,
    String? content,
    String? mediaUrl,
    MessageType? type,
    bool? isMine,
    DateTime? createdAt,
    Duration? audioDuration,
    Map<String, int>? reactions,
  }) {
    return GroupChatMessage(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      content: content ?? this.content,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      type: type ?? this.type,
      isMine: isMine ?? this.isMine,
      createdAt: createdAt ?? this.createdAt,
      audioDuration: audioDuration ?? this.audioDuration,
      reactions: reactions ?? this.reactions,
    );
  }

  factory GroupChatMessage.fromJson(
    Map<String, dynamic> json,
  ) {
    return GroupChatMessage(
      id: json['id'],
      senderId: json['senderId'],
      senderName: json['senderName'],
      senderAvatar: json['senderAvatar'],
      content: json['content'],
      mediaUrl: json['mediaUrl'],
      type: MessageType.values.firstWhere(
        (e) => e.name == json['type'],
      ),
      isMine: json['isMine'],
      createdAt: DateTime.parse(json['createdAt']),
      audioDuration: json['audioDuration'] != null
          ? Duration(
              seconds: json['audioDuration'],
            )
          : null,
      reactions: json['reactions'] != null
          ? Map<String, int>.from(
              json['reactions'],
            )
          : {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'senderAvatar': senderAvatar,
      'content': content,
      'mediaUrl': mediaUrl,
      'type': type.name,
      'isMine': isMine,
      'createdAt': createdAt.toIso8601String(),
      'audioDuration': audioDuration?.inSeconds,
      'reactions': reactions,
    };
  }
}