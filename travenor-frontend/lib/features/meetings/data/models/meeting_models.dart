class MeetingResponseModel {
  final String id;
  final String meetingName;
  final String status;
  final String? audioUrl;
  final DateTime createdAt;

  const MeetingResponseModel({
    required this.id,
    required this.meetingName,
    required this.status,
    required this.createdAt,
    this.audioUrl,
  });

  factory MeetingResponseModel.fromJson(Map<String, dynamic> json) {
    return MeetingResponseModel(
      id: json['id'] as String,
      meetingName: json['meetingName'] as String,
      status: json['status'] as String,
      audioUrl: json['audioUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'meetingName': meetingName,
      'status': status,
      'audioUrl': audioUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}