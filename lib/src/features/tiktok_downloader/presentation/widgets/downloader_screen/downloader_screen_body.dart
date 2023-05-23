import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/build_toast.dart';
import '../../../../../core/widgets/center_indicator.dart';
import '../../../../../core/widgets/custom_elevated_btn.dart';
import '../../bloc/downloader_bloc/downloader_bloc.dart';
import '../download_bottom_sheet.dart';
import 'downloader_body_input_field.dart';
import 'downloader_body_logo.dart';

class DownloaderScreenBody extends StatefulWidget {
  const DownloaderScreenBody({Key? key}) : super(key: key);

  @override
  State<DownloaderScreenBody> createState() => _DownloaderScreenBodyState();
}

class _DownloaderScreenBodyState extends State<DownloaderScreenBody> {
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
        return Container(
          padding: const EdgeInsets.all(20),
          alignment: AlignmentDirectional.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DownloaderBodyLogo(),
                const SizedBox(height: 40),
                DownloaderBodyInputField(
                  videoLinkController: _videoLinkController,
                  formKey: _formKey,
                ),
                const SizedBox(height: 20),
                state is DownloaderGetVideoLoading
                    ? const CenterProgressIndicator()
                    : _buildBodyDownloadBtn(context),
              ],
            ),
          ),
        );
      },
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
