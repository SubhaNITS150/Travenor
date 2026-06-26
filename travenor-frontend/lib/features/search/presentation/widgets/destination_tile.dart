import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const DestinationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white,
      ),
    );
  }
}