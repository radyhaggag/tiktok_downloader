import '../../../../config/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/listeners/downloader_listener.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_elevated_btn.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../controller/downloader_bloc/downloader_bloc.dart';

class DownloaderScreen extends StatefulWidget {
  const DownloaderScreen({Key? key}) : super(key: key);

  @override
  State<DownloaderScreen> createState() => _DownloaderScreenState();
}

class _DownloaderScreenState extends State<DownloaderScreen> {
  late final TextEditingController _videoLinkController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _videoLinkController = TextEditingController();
  }

  @override
  void dispose() {
    _videoLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloaderBloc, DownloaderState>(
      listener: downloaderListener,
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildScreenBody(context),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final allDownloads = context.read<DownloaderBloc>().allDownloads;
    return AppBar(
      title: const Text(AppStrings.appName),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(Routes.downloads),
          child: allDownloads.isNotEmpty
              ? Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    _buildDownloadsIcons(),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: AppSize.s10,
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
        ),
      ],
    );
  }

  Image _buildDownloadsIcons() {
    return const Image(
      width: AppSize.s40,
      height: AppSize.s40,
      image: AssetImage(AppAssets.downloadsIcon),
    );
  }

  Widget _buildScreenBody(BuildContext context) => Container(
        padding: const EdgeInsets.all(AppSize.s20),
        alignment: AlignmentDirectional.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBodyLogo(),
              const SizedBox(height: AppSize.s40),
              _buildBodyInputField(),
              const SizedBox(height: AppSize.s20),
              _buildBodyDownloadBtn(context),
            ],
          ),
        ),
      );

  Widget _buildBodyLogo() => Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(AppSize.s50),
        ),
        child: const Image(
          width: AppSize.s250,
          height: AppSize.s250,
          image: AssetImage(AppAssets.tiktokLogo),
        ),
      );

  Form _buildBodyInputField() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _videoLinkController,
        validator: (String? value) {
          if (value!.isEmpty) return AppStrings.videoLinkRequired;
          return null;
        },
        decoration: const InputDecoration(
          hintText: AppStrings.inputLinkFieldText,
        ),
      ),
    );
  }

  Widget _buildBodyDownloadBtn(BuildContext context) {
    return CustomElevatedBtn(
      label: AppStrings.download,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<DownloaderBloc>().add(
                DownloaderGetVideo(_videoLinkController.text),
              );
        }
      },
    );
  }
}
