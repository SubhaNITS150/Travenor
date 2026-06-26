import 'package:travenor/features/groupchat/data/models/group_chat_models.dart';

final List<GroupChatMessage> dummyMessages = [
  GroupChatMessage(
    id: '1',
    senderId: 'user_1',
    senderName: 'Rahul',
    senderAvatar:
        'https://i.pravatar.cc/150?img=1',
    content:
        'Hey everyone 👋 Has anyone finalized the Shillong hotel yet?',
    type: MessageType.text,
    isMine: false,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 4),
    ),
  ),

  GroupChatMessage(
    id: '2',
    senderId: 'user_2',
    senderName: 'Ananya',
    senderAvatar:
        'https://i.pravatar.cc/150?img=5',
    content:
        'I shortlisted 3 hotels. Will share details tonight.',
    type: MessageType.text,
    isMine: false,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 4),
    ),
  ),

  GroupChatMessage(
    id: '3',
    senderId: 'current_user',
    senderName: 'You',
    senderAvatar:
        'https://i.pravatar.cc/150?img=11',
    content:
        'Perfect. We should also compare distance from Police Bazaar.',
    type: MessageType.text,
    isMine: true,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 3),
    ),
  ),

  GroupChatMessage(
    id: '4',
    senderId: 'user_3',
    senderName: 'Neha',
    senderAvatar:
        'https://i.pravatar.cc/150?img=8',
    content:
        'Voice note regarding transportation options.',
    mediaUrl:
        'https://example.com/audio/shillong_transport.mp3',
    type: MessageType.audio,
    isMine: false,
    audioDuration: Duration(seconds: 28),
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2),
    ),
  ),

  GroupChatMessage(
    id: '5',
    senderId: 'system',
    senderName: 'System',
    senderAvatar: '',
    content:
        'A new poll has been created: Best Hotel in Shillong',
    type: MessageType.system,
    isMine: false,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2),
    ),
  ),

  GroupChatMessage(
    id: '6',
    senderId: 'user_4',
    senderName: 'Amit',
    senderAvatar:
        'https://i.pravatar.cc/150?img=15',
    content:
        'Check out this view from the resort 😍',
    mediaUrl:
        'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    type: MessageType.image,
    isMine: false,
    createdAt: DateTime.now().subtract(
      const Duration(hours: 1),
    ),
  ),

  GroupChatMessage(
    id: '7',
    senderId: 'current_user',
    senderName: 'You',
    senderAvatar:
        'https://i.pravatar.cc/150?img=11',
    content:
        'Looks amazing! I think we should stay there.',
    type: MessageType.text,
    isMine: true,
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 55),
    ),
  ),

  GroupChatMessage(
    id: '8',
    senderId: 'user_5',
    senderName: 'Priya',
    senderAvatar:
        'https://i.pravatar.cc/150?img=20',
    content:
        'I have uploaded the updated itinerary PDF.',
    type: MessageType.text,
    isMine: false,
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 40),
    ),
  ),

  GroupChatMessage(
    id: '9',
    senderId: 'user_2',
    senderName: 'Ananya',
    senderAvatar:
        'https://i.pravatar.cc/150?img=5',
    content:
        'Voice summary of today’s planning meeting.',
    mediaUrl:
        'https://example.com/audio/meeting_summary.mp3',
    type: MessageType.audio,
    isMine: false,
    audioDuration: Duration(
      minutes: 1,
      seconds: 12,
    ),
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 30),
    ),
  ),

  GroupChatMessage(
    id: '10',
    senderId: 'current_user',
    senderName: 'You',
    senderAvatar:
        'https://i.pravatar.cc/150?img=11',
    content:
        'Great. Let’s finalize bookings by tomorrow evening.',
    type: MessageType.text,
    isMine: true,
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 10),
    ),
  ),
];