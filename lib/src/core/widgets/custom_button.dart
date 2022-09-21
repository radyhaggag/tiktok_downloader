import 'package:flutter/material.dart';
import '../utils/app_size.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final double width;
  final double? height;

  const CustomButton({
    Key? key,
    this.onPressed,
    required this.width,
    this.height,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? AppSize.s50,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
