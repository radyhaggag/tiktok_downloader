import 'package:tiktok_downloader/src/core/media_query.dart';
import 'package:flutter/material.dart';

import '../utils/app_size.dart';

class CustomElevatedBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final double? width;

  const CustomElevatedBtn(
      {Key? key, this.onPressed, required this.label, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50,
      width: width ?? context.width / 2,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
