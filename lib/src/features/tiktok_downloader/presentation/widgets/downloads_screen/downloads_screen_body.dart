import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_downloader/src/core/utils/app_strings.dart';
import 'package:tiktok_downloader/src/features/tiktok_downloader/presentation/widgets/downloads_screen/new_downloads_section.dart';

import '../../bloc/downloader_bloc/downloader_bloc.dart';
import 'old_downloads_section.dart';

class DownloadsScreenBody extends StatefulWidget {
  const DownloadsScreenBody({super.key});

  @override
  State<DownloadsScreenBody> createState() => _DownloadsScreenBodyState();
}

class _DownloadsScreenBodyState extends State<DownloadsScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<DownloaderBloc>().add(LoadOldDownloads());
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NewDownloadsSection(),
          SizedBox(height: 10),
          Text(AppStrings.oldDownloads),
          SizedBox(height: 10),
          OldDownloadsSection(),
        ],
      ),
    );
  }
}
