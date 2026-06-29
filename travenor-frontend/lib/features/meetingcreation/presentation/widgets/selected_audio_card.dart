import 'package:flutter/material.dart';

class SelectedAudioCard extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final VoidCallback onReplace;
  final VoidCallback onRemove;

  const SelectedAudioCard({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.onReplace,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffF0FDF4),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xff86EFAC),
        ),
      ),
      child: Column(
        children: [

          //-------------------------------- Top Row ------------------------------//

          Row(
            children: [

              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: const Color(0xffDCFCE7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.audio_file_rounded,
                  color: Colors.green,
                  size: 30,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      fileName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      fileSize,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff22C55E),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            ],
          ),

          const SizedBox(height: 18),

          //-------------------------------- Ready ------------------------------//

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [

                Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 18,
                ),

                SizedBox(width: 10),

                Text(
                  "Ready for AI Analysis",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          //-------------------------------- Buttons ------------------------------//

          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onReplace,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Replace"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xff6C63FF),
                    side: const BorderSide(
                      color: Color(0xff6C63FF),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline),
                  label: const Text("Remove"),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}