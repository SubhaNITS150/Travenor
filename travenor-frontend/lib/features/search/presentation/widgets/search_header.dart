import 'package:flutter/material.dart';
import 'package:travenor/core/constants/app_color.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .85),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .85),
                borderRadius: BorderRadius.circular(28),
              ),
              child: TextField(
                autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Search destinations...',
                  border: InputBorder.none,

                  isDense: true,

                  contentPadding: const EdgeInsets.symmetric(vertical: 0),

                  prefixIcon: const Icon(Icons.search, size: 22),

                  suffixIcon: const Icon(Icons.close, size: 22),

                  prefixIconConstraints: const BoxConstraints(
                    minHeight: 58,
                    minWidth: 48,
                  ),

                  suffixIconConstraints: const BoxConstraints(
                    minHeight: 58,
                    minWidth: 48,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.headTextWhite,
            ),
          ),
        ],
      ),
    );
  }
}
