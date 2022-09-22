import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/dir_helper.dart';
import '../../../../../core/helpers/permissions_helper.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/download_item.dart';
import '../../../domain/entities/tiktok_video.dart';
import '../../../domain/usecases/get_video_usecase.dart';
import '../../../domain/usecases/save_video_usecase.dart';

part 'downloader_event.dart';

part 'downloader_state.dart';

class DownloaderBloc extends Bloc<DownloaderEvent, DownloaderState> {
  final GetVideoUseCase getVideoUseCase;
  final SaveVideoUseCase saveVideoUseCase;

  DownloaderBloc({
    required this.getVideoUseCase,
    required this.saveVideoUseCase,
  }) : super(DownloaderInitial()) {
    on<DownloaderEvent>((event, emit) async {
      if (event is DownloaderGetVideo) await _getVideo(event, emit);

      if (event is DownloaderSaveVideo) await _saveVideo(event, emit);
    });
  }

  List<DownloadItem> allDownloads = [];

  Future<void> _getVideo(
    DownloaderGetVideo event,
    Emitter<DownloaderState> emit,
  ) async {
    emit(const DownloaderGetVideoLoading());
    final result = await getVideoUseCase(event.videoLink);
    result.fold(
      (left) => emit(DownloaderGetVideoFailure(left.message)),
      (right) => emit(DownloaderGetVideoSuccess(right)),
    );
  }

  Future<void> _saveVideo(
    DownloaderSaveVideo event,
    Emitter<DownloaderState> emit,
  ) async {
    bool checkPermissions = await PermissionsHelper.checkPermission();
    if (!checkPermissions) {
      emit(const DownloaderSaveVideoFailure(AppStrings.permissionsRequired));
      return;
    }
    final path = await _getPathById(event.tikTokVideo.videoData!.id);
    final link = _processLink(event.tikTokVideo.videoData!.playVideo);
    DownloadItem item = DownloadItem(
      video: event.tikTokVideo,
      status: DownloadStatus.downloading,
      path: path,
    );
    SaveVideoParams params = SaveVideoParams(savePath: path, videoLink: link);
    int index = _checkIfItemIsExistInDownloads(item);
    _addItem(index, item);
    emit(const DownloaderSaveVideoLoading());
    final result = await saveVideoUseCase(params);
    result.fold(
      (failure) {
        _updateItem(index, item.copyWith(status: DownloadStatus.error));
        emit(DownloaderSaveVideoFailure(failure.message));
      },
      (right) {
        _updateItem(index, item.copyWith(status: DownloadStatus.success));
        emit(DownloaderSaveVideoSuccess(message: right, path: path));
      },
    );
  }

  String _processLink(String link) {
    bool isCorrectLink = link.endsWith(".mp4");
    if (!isCorrectLink) link += ".mp4";
    return link;
  }

  Future<String> _getPathById(String id) async {
    final appPath = await DirHelper.getAppPath();
    return "$appPath/$id.mp4";
  }

  _updateItem(int index, DownloadItem item) {
    if (index == -1) {
      allDownloads.last = item;
    } else {
      allDownloads[index] = item;
    }
  }

  _addItem(int index, DownloadItem item) {
    if (index == -1) {
      allDownloads.add(item);
    } else {
      allDownloads[index] = item.copyWith(status: DownloadStatus.downloading);
    }
  }

  int _checkIfItemIsExistInDownloads(DownloadItem item) {
    int index = -1;
    for (int i = 0; i < allDownloads.length; i++) {
      if (allDownloads[i].video == item.video) {
        index = i;
        return index;
      }
    }
    return index;
  }
}
