import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travenor/features/meetanalysis/presentation/providers/meet_analysis_provider.dart';
import 'package:travenor/features/preferences/presentation/widgets/destination_card.dart';

class DestinationSelectionSection extends ConsumerStatefulWidget {
  final String meetingId;

  const DestinationSelectionSection({super.key, required this.meetingId});

  @override
  ConsumerState<DestinationSelectionSection> createState() =>
      _DestinationSelectionSectionState();
}

class _DestinationSelectionSectionState
    extends ConsumerState<DestinationSelectionSection> {
  final Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    final destinationsAsync =
        ref.watch(discussedDestinationsProvider(widget.meetingId));

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xff7C3AED),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  "Select Destinations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffF5F3FF),
                  border: Border.all(color: const Color(0xffC4B5FD)),
                ),
                child: Text(
                  "${selectedIndexes.length} Selected",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff7C3AED),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Choose the destinations you want to include in your itinerary.",
              style: TextStyle(color: Color(0xff64748B), fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),

          // ✅ real data from provider
          destinationsAsync.when(
            loading: () => const SizedBox(
              height: 260,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, _) => const SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'Failed to load destinations.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            data: (destinations) {
              if (destinations.isEmpty) {
                return const SizedBox(
                  height: 80,
                  child: Center(child: Text('No destinations discussed yet.')),
                );
              }

              return SizedBox(
                height: 260,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return DestinationCard(
                      title: destinations[index].name,
                      imageUrl: "https://picsum.photos/seed/${destinations[index].name}/300",
                      isSelected: selectedIndexes.contains(index),
                      onTap: () {
                        setState(() {
                          if (selectedIndexes.contains(index)) {
                            selectedIndexes.remove(index);
                          } else {
                            selectedIndexes.add(index);
                          }
                        });
                      },
                    );
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 18),
          Container(
            width: 120,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xffE5E7EB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 42,
                decoration: BoxDecoration(
                  color: const Color(0xff7C3AED),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}