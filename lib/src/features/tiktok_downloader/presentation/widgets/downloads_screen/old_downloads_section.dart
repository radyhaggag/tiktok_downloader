import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/center_indicator.dart';

import '../../bloc/downloader_bloc/downloader_bloc.dart';
import 'old_download_item.dart';

class OldDownloadsSection extends StatelessWidget {
  const OldDownloadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloaderBloc, DownloaderState>(
      buildWhen: (previous, current) {
        if (current is OldDownloadsLoadingSuccess) {
          return true;
        }
        if (current is OldDownloadsLoadingFailure) {
          return true;
        }
        if (current is OldDownloadsLoading) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is OldDownloadsLoading) {
          return const CenterProgressIndicator();
        } else if (state is OldDownloadsLoadingSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: List.generate(
                state.downloads.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: OldDownloadItem(videoItem: state.downloads[index]),
                ),
              ).toList(),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
