import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_size.dart';
import '../../domain/entities/video_data.dart';

class BottomSheetHeader extends StatelessWidget {
  final VideoData videoData;

  const BottomSheetHeader({Key? key, required this.videoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s10),
          child: FadeInImage(
            width: AppSize.s150,
            height: AppSize.s150,
            fit: BoxFit.cover,
            image: NetworkImage(videoData.originCover),
            placeholder: const AssetImage(AppAssets.noInternetImage),
          ),
        ),
        const SizedBox(width: AppSize.s10),
        Expanded(
          child: Text(
            videoData.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
