import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/downloader_bloc/downloader_bloc.dart';
import 'custom_downloads_item.dart';

class DownloadsScreenBody extends StatelessWidget {
  const DownloadsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloaderBloc, DownloaderState>(
      builder: (context, state) {
        final allDownloads = context.read<DownloaderBloc>().allDownloads;

        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            itemBuilder: (context, index) => CustomDownloadsItem(
              item: allDownloads[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: allDownloads.length,
          ),
        );
      },
    );
  }
}
