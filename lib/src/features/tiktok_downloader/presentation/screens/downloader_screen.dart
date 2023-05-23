import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_downloader/src/features/tiktok_downloader/presentation/widgets/downloader_screen/downloader_screen_app_bar.dart';

import '../../../../config/routes_manager.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/build_toast.dart';
import '../../../../core/widgets/center_indicator.dart';
import '../../../../core/widgets/custom_elevated_btn.dart';
import '../bloc/downloader_bloc/downloader_bloc.dart';
import '../widgets/download_bottom_sheet.dart';

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
      listener: (context, state) {
        if (state is DownloaderSaveVideoLoading) {
          Navigator.of(context).popAndPushNamed(Routes.downloads);
        }
        if (state is DownloaderGetVideoFailure) {
          buildToast(msg: state.message, type: ToastType.error);
        }
        if (state is DownloaderGetVideoSuccess &&
            state.tikTokVideo.videoData == null) {
          buildToast(msg: state.tikTokVideo.msg, type: ToastType.error);
        }
        if (state is DownloaderGetVideoSuccess &&
            state.tikTokVideo.videoData != null) {
          buildDownloadBottomSheet(context, state.tikTokVideo);
        }
        if (state is DownloaderSaveVideoSuccess) {
          // DirHelper.saveVideoToGallery(state.path);
          // DirHelper.removeFileFromDownloadsDir(state.path);
          buildToast(msg: state.message, type: ToastType.success);
        }
        if (state is DownloaderSaveVideoFailure) {
          buildToast(msg: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const DownloaderScreenAppBar(),
          body: _buildScreenBody(context, state),
        );
      },
    );
  }

  Widget _buildScreenBody(BuildContext context, DownloaderState state) =>
      Container(
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
              if (state is! DownloaderGetVideoLoading)
                _buildBodyDownloadBtn(context),
              if (state is DownloaderGetVideoLoading)
                const CenterProgressIndicator(),
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
        keyboardType: TextInputType.url,
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
