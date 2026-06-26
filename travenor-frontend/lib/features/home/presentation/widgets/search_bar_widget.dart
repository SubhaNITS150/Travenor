import 'package:flutter/material.dart';
import 'package:travenor/features/search/presentation/screens/destination_search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 58,
        child: TextField(
          readOnly: true,
          textAlignVertical: TextAlignVertical.center,
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                transitionDuration: const Duration(
                  milliseconds: 250,
                ),
                pageBuilder: (_, __, ___) =>
                    const DestinationSearchScreen(),
              ),
            );
          },
          decoration: InputDecoration(
            hintText: "Search destinations...",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.white,

            // Keeps the text perfectly centered vertically
            contentPadding: EdgeInsets.zero,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}