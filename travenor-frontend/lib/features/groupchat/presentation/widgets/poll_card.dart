import 'package:flutter/material.dart';
import '../../data/models/poll_model.dart';

class PollCard extends StatelessWidget {
  final PollModel poll;
  final Function(String optionId)? onVote;

  const PollCard({
    super.key,
    required this.poll,
    this.onVote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.04,
            ),
            blurRadius: 12,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            children: [
              const Icon(
                Icons.poll_outlined,
                color: Color(0xFF6C63FF),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  poll.question,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: poll.isActive
                      ? const Color(
                          0xFFE9FFF1,
                        )
                      : const Color(
                          0xFFF3F4F6,
                        ),
                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),
                child: Text(
                  poll.isActive
                      ? "Active"
                      : "Closed",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        FontWeight.w600,
                    color: poll.isActive
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            "Created by ${poll.createdBy}",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          ...poll.options.map(
            (option) {
              final percentage =
                  poll.totalVotes == 0
                      ? 0.0
                      : option.votes /
                          poll.totalVotes;

              final isSelected =
                  poll.selectedOptionId ==
                  option.id;

              return GestureDetector(
                onTap: poll.isActive
                    ? () {
                        onVote?.call(
                          option.id,
                        );
                      }
                    : null,
                child: Container(
                  margin:
                      const EdgeInsets.only(
                    bottom: 14,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons
                                    .radio_button_checked
                                : Icons
                                    .radio_button_off,
                            color: isSelected
                                ? const Color(
                                    0xFF6C63FF,
                                  )
                                : Colors.grey,
                          ),

                          const SizedBox(
                            width: 8,
                          ),

                          Expanded(
                            child: Text(
                              option.title,
                              style:
                                  const TextStyle(
                                fontSize: 15,
                                fontWeight:
                                    FontWeight
                                        .w500,
                              ),
                            ),
                          ),

                          Text(
                            "${(percentage * 100).toStringAsFixed(0)}%",
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight
                                      .w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                          20,
                        ),
                        child:
                            LinearProgressIndicator(
                          value: percentage,
                          minHeight: 8,
                          backgroundColor:
                              Colors.grey
                                  .shade200,
                          valueColor:
                              AlwaysStoppedAnimation(
                            isSelected
                                ? const Color(
                                    0xFF6C63FF,
                                  )
                                : const Color(
                                    0xFFBFC4D4,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const Divider(),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(
                Icons.people_outline,
                size: 18,
                color: Colors.grey,
              ),

              const SizedBox(width: 6),

              Text(
                "${poll.totalVotes} votes",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight:
                      FontWeight.w500,
                ),
              ),

              const Spacer(),

              Text(
                "${poll.createdAt.day}/${poll.createdAt.month}/${poll.createdAt.year}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}