class DiscussedDestinationModel {
  final String id;
  final String name;
  final int mentionCount;
  final double confidence;

  const DiscussedDestinationModel({
    required this.id,
    required this.name,
    required this.mentionCount,
    required this.confidence,
  });

  factory DiscussedDestinationModel.fromJson(Map<String, dynamic> json) {
    return DiscussedDestinationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      mentionCount: json['mentionCount'] as int,
      confidence: (json['confidence'] as num).toDouble(),
    );
  }
}