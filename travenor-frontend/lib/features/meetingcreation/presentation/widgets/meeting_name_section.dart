import 'package:flutter/material.dart';

class MeetingNameSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCreateMeeting;
  final bool isLoading;
  final bool isMeetingCreated;

  const MeetingNameSection({
    super.key,
    required this.controller,
    required this.onCreateMeeting,
    this.isLoading = false,
    this.isMeetingCreated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------------- Header ----------------------//

          Row(
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF2FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isMeetingCreated
                      ? Icons.check_circle
                      : Icons.calendar_today_rounded,
                  color: isMeetingCreated
                      ? Colors.green
                      : const Color(0xff6C63FF),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Meeting Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111827),
                      ),
                    ),

                    const SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton.icon(
                        onPressed: isMeetingCreated
                            ? null
                            : (isLoading ? null : onCreateMeeting),

                        icon: isLoading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                isMeetingCreated
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline_rounded,
                              ),

                        label: Text(
                          isLoading
                              ? "Creating..."
                              : isMeetingCreated
                                  ? "Meeting Created"
                                  : "Create Meeting",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: isMeetingCreated
                              ? Colors.green
                              : const Color(0xff6C63FF),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          disabledBackgroundColor: Colors.green,
                          disabledForegroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          //---------------------- Label ----------------------//

          const Text(
            "Meeting Name",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xff374151),
            ),
          ),

          const SizedBox(height: 10),

          //---------------------- TextField ----------------------//

          TextField(
            controller: controller,
            enabled: !isLoading && !isMeetingCreated,
            textInputAction: TextInputAction.done,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "e.g. Meghalaya Trip Planning",
              hintStyle: const TextStyle(
                color: Color(0xff9CA3AF),
              ),
              prefixIcon: Icon(
                isMeetingCreated
                    ? Icons.check_circle
                    : Icons.edit_note_rounded,
                color: isMeetingCreated
                    ? Colors.green
                    : const Color(0xff6C63FF),
              ),
              filled: true,
              fillColor: const Color(0xffF8FAFC),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: isMeetingCreated
                      ? Colors.green
                      : Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: isMeetingCreated
                      ? Colors.green
                      : const Color(0xff6C63FF),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),

          //---------------------- Status Card ----------------------//

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isMeetingCreated
                  ? const Color(0xffECFDF5)
                  : const Color(0xffF5F3FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isMeetingCreated
                    ? const Color(0xffBBF7D0)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isMeetingCreated
                      ? Icons.check_circle
                      : Icons.info_outline_rounded,
                  color: isMeetingCreated
                      ? Colors.green
                      : const Color(0xff7C3AED),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    isMeetingCreated
                        ? "Meeting created successfully. You can now upload your meeting recording."
                        : "Create the meeting first. Once it's created successfully, you'll be able to upload the meeting recording and start the AI analysis.",
                    style: TextStyle(
                      fontSize: 13,
                      color: isMeetingCreated
                          ? const Color(0xff166534)
                          : const Color(0xff6B7280),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}