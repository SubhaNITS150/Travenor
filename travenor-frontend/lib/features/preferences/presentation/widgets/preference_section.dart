import 'package:flutter/material.dart';

class PreferenceSection extends StatefulWidget {
  final String title;
  final String description;
  final String sectionNumber;
  final List<String> options;

  const PreferenceSection({
    super.key,
    required this.title,
    required this.description,
    required this.sectionNumber,
    required this.options,
  });

  @override
  State<PreferenceSection> createState() =>
      _PreferenceSectionState();
}

class _PreferenceSectionState
    extends State<PreferenceSection> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
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
              CircleAvatar(
                radius: 16,
                backgroundColor: const Color(0xff7C3AED),
                child: Text(
                  widget.sectionNumber,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.description,
              style: const TextStyle(
                color: Color(0xff64748B),
              ),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: List.generate(
              widget.options.length,
              (index) {
                final selected =
                    selectedIndex == index;

                return Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(
                                  0xffF5F3FF,
                                )
                              : Colors.white,
                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),
                          border: Border.all(
                            color: selected
                                ? const Color(
                                    0xff7C3AED)
                                : const Color(
                                    0xffE5E7EB),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.options[index],
                            style: TextStyle(
                              color: selected
                                  ? const Color(
                                      0xff7C3AED)
                                  : Colors.black,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}