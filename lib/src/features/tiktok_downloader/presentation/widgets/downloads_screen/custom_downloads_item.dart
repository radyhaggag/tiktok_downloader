import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../domain/entities/download_item.dart';
import 'download_item_status.dart';

class CustomDownloadsItem extends StatelessWidget {
  final DownloadItem item;
  const CustomDownloadsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
              image: NetworkImage(item.video.videoData!.originCover),
              placeholder: const AssetImage(AppAssets.noInternetImage),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(child: DownloadItemStatus(item: item)),
        ],
      ),
    );
  }
}
