import '../models/poll_model.dart';

final List<PollModel> dummyPolls = [
  PollModel(
    id: 'poll_1',
    createdBy: 'Rahul',
    question: 'Which hotel should we book in Shillong?',
    totalVotes: 18,
    isActive: true,
    createdAt: DateTime.now().subtract(
      const Duration(days: 2),
    ),
    selectedOptionId: 'option_2',
    options: const [
      PollOption(
        id: 'option_1',
        title: 'Hotel Pinewood',
        votes: 5,
      ),
      PollOption(
        id: 'option_2',
        title: 'Polo Towers',
        votes: 9,
      ),
      PollOption(
        id: 'option_3',
        title: 'The Habitat Shillong',
        votes: 4,
      ),
    ],
  ),

  PollModel(
    id: 'poll_2',
    createdBy: 'Ananya',
    question: 'Preferred mode of transport?',
    totalVotes: 15,
    isActive: true,
    createdAt: DateTime.now().subtract(
      const Duration(days: 1),
    ),
    selectedOptionId: 'option_5',
    options: const [
      PollOption(
        id: 'option_4',
        title: 'Private Cab',
        votes: 4,
      ),
      PollOption(
        id: 'option_5',
        title: 'Self Drive',
        votes: 8,
      ),
      PollOption(
        id: 'option_6',
        title: 'Public Transport',
        votes: 3,
      ),
    ],
  ),

  PollModel(
    id: 'poll_3',
    createdBy: 'Neha',
    question: 'Best month for the Meghalaya trip?',
    totalVotes: 22,
    isActive: false,
    createdAt: DateTime.now().subtract(
      const Duration(days: 5),
    ),
    selectedOptionId: 'option_8',
    options: const [
      PollOption(
        id: 'option_7',
        title: 'September',
        votes: 5,
      ),
      PollOption(
        id: 'option_8',
        title: 'October',
        votes: 12,
      ),
      PollOption(
        id: 'option_9',
        title: 'November',
        votes: 5,
      ),
    ],
  ),

  PollModel(
    id: 'poll_4',
    createdBy: 'Amit',
    question: 'How many days should the trip be?',
    totalVotes: 16,
    isActive: true,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 12),
    ),
    selectedOptionId: 'option_11',
    options: const [
      PollOption(
        id: 'option_10',
        title: '3 Days',
        votes: 3,
      ),
      PollOption(
        id: 'option_11',
        title: '5 Days',
        votes: 10,
      ),
      PollOption(
        id: 'option_12',
        title: '7 Days',
        votes: 3,
      ),
    ],
  ),

  PollModel(
    id: 'poll_5',
    createdBy: 'Priya',
    question: 'Should we include Dawki in the itinerary?',
    totalVotes: 19,
    isActive: true,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 6),
    ),
    selectedOptionId: 'option_13',
    options: const [
      PollOption(
        id: 'option_13',
        title: 'Yes',
        votes: 15,
      ),
      PollOption(
        id: 'option_14',
        title: 'No',
        votes: 4,
      ),
    ],
  ),
];