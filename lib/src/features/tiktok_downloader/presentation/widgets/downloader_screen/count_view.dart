import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../domain/entities/video_data.dart';

class CountView extends StatelessWidget {
  final int count;
  final IconData icon;

  const CountView({
    Key? key,
    required this.count,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(color: AppColors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(count.toString()),
        ],
      ),
    );
  }
}

class BottomSheetCountItems extends StatelessWidget {
  final VideoData videoData;

  const BottomSheetCountItems({Key? key, required this.videoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CountView(
            count: videoData.playCount,
            icon: Icons.remove_red_eye,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: CountView(
            count: videoData.downloadCount,
            icon: Icons.download,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: CountView(
            count: videoData.duration,
            icon: Icons.timer_outlined,
          ),
        ),
      ],
    );
  }
}
