import 'package:flutter/material.dart';
import '../../../../../core/media_query.dart';

class TextBtnWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final void Function()? onPressed;

  const TextBtnWithIcon({
    Key? key,
    required this.icon,
    required this.label,
    this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(context.width, 30),
        shape: StadiumBorder(
          side: BorderSide(color: color),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: color,
                ),
          ),
        ],
      ),
    );
  }
}
