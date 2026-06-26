class PollOption {
  final String id;
  final String title;
  final int votes;

  const PollOption({
    required this.id,
    required this.title,
    required this.votes,
  });

  PollOption copyWith({
    String? id,
    String? title,
    int? votes,
  }) {
    return PollOption(
      id: id ?? this.id,
      title: title ?? this.title,
      votes: votes ?? this.votes,
    );
  }

  factory PollOption.fromJson(
    Map<String, dynamic> json,
  ) {
    return PollOption(
      id: json['id'],
      title: json['title'],
      votes: json['votes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'votes': votes,
    };
  }
}

class PollModel {
  final String id;

  /// Creator
  final String createdBy;

  /// Poll Question
  final String question;

  /// Poll Options
  final List<PollOption> options;

  /// User selected option
  final String? selectedOptionId;

  /// Total votes
  final int totalVotes;

  /// Whether poll is active
  final bool isActive;

  /// Creation time
  final DateTime createdAt;

  const PollModel({
    required this.id,
    required this.createdBy,
    required this.question,
    required this.options,
    required this.totalVotes,
    required this.isActive,
    required this.createdAt,
    this.selectedOptionId,
  });

  PollModel copyWith({
    String? id,
    String? createdBy,
    String? question,
    List<PollOption>? options,
    String? selectedOptionId,
    int? totalVotes,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return PollModel(
      id: id ?? this.id,
      createdBy: createdBy ?? this.createdBy,
      question: question ?? this.question,
      options: options ?? this.options,
      selectedOptionId:
          selectedOptionId ?? this.selectedOptionId,
      totalVotes: totalVotes ?? this.totalVotes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory PollModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PollModel(
      id: json['id'],
      createdBy: json['createdBy'],
      question: json['question'],
      options: (json['options'] as List)
          .map(
            (option) => PollOption.fromJson(option),
          )
          .toList(),
      selectedOptionId: json['selectedOptionId'],
      totalVotes: json['totalVotes'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(
        json['createdAt'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'question': question,
      'options': options
          .map((option) => option.toJson())
          .toList(),
      'selectedOptionId': selectedOptionId,
      'totalVotes': totalVotes,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Returns option with highest votes
  PollOption? get winningOption {
    if (options.isEmpty) return null;

    return options.reduce(
      (a, b) => a.votes > b.votes ? a : b,
    );
  }
}