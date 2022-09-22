import 'package:flutter/material.dart';
import '../../../../../core/helpers/dir_helper.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/widgets/build_toast.dart';
import '../../widgets/download_bottom_sheet.dart';
import '../downloader_bloc/downloader_bloc.dart';

void downloaderListener(BuildContext context, DownloaderState state) {
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
    DirHelper.saveVideoToGallery(state.path);
    buildToast(msg: state.message, type: ToastType.success);
  }
  if (state is DownloaderSaveVideoFailure) {
    buildToast(msg: state.message, type: ToastType.error);
  }
}
