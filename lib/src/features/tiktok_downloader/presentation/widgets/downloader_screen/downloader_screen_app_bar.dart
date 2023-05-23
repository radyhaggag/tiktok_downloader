import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../bloc/downloader_bloc/downloader_bloc.dart';

class DownloaderScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DownloaderScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppStrings.appName),
      actions: [
        BlocBuilder<DownloaderBloc, DownloaderState>(
          builder: (context, state) {
            final allDownloads = context.read<DownloaderBloc>().newDownloads;

            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.downloads);
              },
              child: allDownloads.isNotEmpty
                  ? Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        _buildDownloadsIcons(),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 10,
                          child: Text(
                            allDownloads.length.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ],
                    )
                  : _buildDownloadsIcons(),
            );
          },
        ),
      ],
    );
  }

  Image _buildDownloadsIcons() {
    return const Image(
      width: 40,
      height: 40,
      image: AssetImage(AppAssets.downloadsIcon),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
