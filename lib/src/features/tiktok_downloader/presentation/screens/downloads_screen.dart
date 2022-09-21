import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/download_item.dart';
import '../controller/downloader_bloc/downloader_bloc.dart';
import '../../../../core/utils/app_size.dart';
import '../widgets/download_item_status.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allDownloads = context.read<DownloaderBloc>().allDownloads;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.downloads),
      ),
      body: BlocBuilder<DownloaderBloc, DownloaderState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppSize.s20),
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildItem(allDownloads[index], context),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSize.s10),
              itemCount: allDownloads.length,
            ),
          );
        },
      ),
    );
  }

  Widget buildItem(DownloadItem item, BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s10),
              child: FadeInImage(
                width: AppSize.s80,
                height: AppSize.s80,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.cover,
                image: NetworkImage(item.video.videoData!.originCover),
                placeholder: const AssetImage(AppAssets.noInternetImage),
              ),
            ),
            const SizedBox(width: AppSize.s10),
            Expanded(child: DownloadItemStatus(item: item)),
          ],
        ),
      );
}
