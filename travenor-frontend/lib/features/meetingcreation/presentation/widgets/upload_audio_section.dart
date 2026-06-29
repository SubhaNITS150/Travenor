import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:travenor/features/meetingcreation/data/services/audio_upload_service.dart';

class UploadAudioSection extends StatefulWidget {
  final String meetingId;

  const UploadAudioSection({super.key, required this.meetingId});

  @override
  State<UploadAudioSection> createState() => _UploadAudioSectionState();
}

class _UploadAudioSectionState extends State<UploadAudioSection> {
  PlatformFile? selectedFile;
  bool isUploading = false;
  final AudioUploadService _audioService = AudioUploadService();

  Future<void> pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'm4a', 'aac'],
      withData: true,
    );

    print("Result: $result");

    if (result == null) {
      print("No file selected");
      return;
    }

    print("File name: ${result.files.first.name}");
    print("Bytes: ${result.files.first.bytes?.length}");

    setState(() {
      selectedFile = result.files.first;
    });

    print("Selected file after setState: ${selectedFile?.name}");
  }

  Future<void> uploadAudio() async {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select an audio file.")),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      await _audioService.uploadAudio(
        meetingId: widget.meetingId,
        file: selectedFile!,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Audio uploaded successfully."),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
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
          //-------------------------------- Header --------------------------------//
          Row(
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: const Color(0xffEEF2FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.mic_rounded, color: Color(0xff6C63FF)),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meeting Audio",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111827),
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      "Upload your meeting recording for AI analysis",
                      style: TextStyle(color: Color(0xff6B7280), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          //-------------------------------- Upload Area ------------------------------//
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
              color: const Color(0xffFAFAFF),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xffC4B5FD), width: 2),
            ),
            child: Column(
              children: [
                //-------------------------------- Upload Icon ----------------------------//
                Container(
                  height: 82,
                  width: 82,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffEEF2FF),
                  ),
                  child: const Icon(
                    Icons.cloud_upload_rounded,
                    color: Color(0xff6C63FF),
                    size: 42,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Upload Meeting Audio",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Drag & drop your audio file here\nor choose a file from your device",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff6B7280), height: 1.5),
                  ),
                ),

                const SizedBox(height: 24),

                //-------------------------------- Choose File Button ---------------------//
                SizedBox(
                  width: 170,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: pickAudio,

                    icon: const Icon(Icons.folder_open),

                    label: const Text(
                      "Choose File",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff6C63FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                if (selectedFile != null) ...[
                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          selectedFile!.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

                if (selectedFile != null) ...[
                  const SizedBox(height: 20),

                  SizedBox(
                    width: 170,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: isUploading ? null : uploadAudio,
                      icon: isUploading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.cloud_upload),

                      label: Text(
                        isUploading ? "Uploading..." : "Upload Audio",
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                //-------------------------------- Divider -------------------------------//
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Supported Formats",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),

                const SizedBox(height: 18),

                //-------------------------------- Chips --------------------------------//
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _formatChip(".mp3"),

                    _formatChip(".wav"),

                    _formatChip(".m4a"),

                    _formatChip(".aac"),
                  ],
                ),

                const SizedBox(height: 20),

                //-------------------------------- Max Size ------------------------------//
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF7ED),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info_outline, color: Colors.orange, size: 18),

                      SizedBox(width: 8),

                      Text(
                        "Maximum file size : 200 MB",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formatChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xffE5E7EB)),
      ),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
