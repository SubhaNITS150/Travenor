import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/features/meetingcreation/presentation/controllers/create_meeting_controller.dart';
import 'package:travenor/features/meetingcreation/presentation/widgets/ai_banner.dart';
import 'package:travenor/features/meetingcreation/presentation/widgets/meeting_name_section.dart';
import 'package:travenor/features/meetingcreation/presentation/widgets/meeting_upload_header.dart';
import 'package:travenor/features/meetingcreation/presentation/widgets/security_info_card.dart';
import 'package:travenor/features/meetingcreation/presentation/widgets/upload_audio_section.dart';
import 'package:travenor/features/meetingcreation/presentation/widgets/upload_meeting_button.dart';
import 'package:travenor/features/meetings/presentation/providers/meeting_provider.dart';

class CreateMeetingScreen extends ConsumerStatefulWidget {
  const CreateMeetingScreen({super.key});

  @override
  ConsumerState<CreateMeetingScreen> createState() =>
      _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends ConsumerState<CreateMeetingScreen> {
  final TextEditingController meetingNameController = TextEditingController();
  final CreateMeetingController _createController = CreateMeetingController();
  final ProcessMeetingController _processController =
      ProcessMeetingController();

  bool isUploading = false;
  bool isCreatingMeeting = false;

  String? meetingId;

  @override
  void dispose() {
    meetingNameController.dispose();
    super.dispose();
  }

  Future<void> createMeeting() async {
    setState(() {
      isCreatingMeeting = true;
    });

    try {
      final response = await _createController.createMeeting(
        meetingName: meetingNameController.text.trim(),
      );

      if (!mounted) return;

      setState(() {
        meetingId = response["id"];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Meeting created successfully!"),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(e.toString())),
      );
    } finally {
      if (mounted) {
        setState(() {
          isCreatingMeeting = false;
        });
      }
    }
  }

  Future<void> uploadMeeting() async {
    if (meetingId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please create the meeting first.")),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      await _processController.processMeeting(meetingId: meetingId!);

      if (!mounted) return;

      // ✅ Refresh both providers so home screen shows new meeting instantly
      await Future.wait([
        ref.read(recentMeetingsProvider.notifier).refresh(),
        ref.read(allMeetingsProvider.notifier).refresh(),
      ]);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Meeting processing started."),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(e.toString())),
      );
    } finally {
      if (mounted) {
        setState(() {
          isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MeetingUploadHeader(),
              const SizedBox(height: 26),
              const AIBanner(),
              const SizedBox(height: 26),
              MeetingNameSection(
                controller: meetingNameController,
                isLoading: isCreatingMeeting,
                isMeetingCreated: meetingId != null,
                onCreateMeeting: createMeeting,
              ),
              const SizedBox(height: 22),
              if (meetingId != null) UploadAudioSection(meetingId: meetingId!),
              const SizedBox(height: 22),
              const SecurityInfoCard(),
              const SizedBox(height: 30),
              UploadMeetingButton(
                isUploading: isUploading,
                onPressed: uploadMeeting,
              ),
            ],
          ),
        ),
      ),
    );
  }
}