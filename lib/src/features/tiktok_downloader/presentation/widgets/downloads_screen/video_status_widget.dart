import 'package:flutter/material.dart';

class VideoStatusWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const VideoStatusWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label, textAlign: TextAlign.center),
        Icon(icon, color: color),
      ],
    );
  }
}
